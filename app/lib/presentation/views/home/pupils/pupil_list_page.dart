import 'package:avatar/avatar.dart';
import 'package:boobook/models/pupil.dart';
import 'package:boobook/presentation/common_widgets/empty_data.dart';
import 'package:boobook/presentation/common_widgets/pupil_card.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

enum PupilSort { name, loans }

/// This provider stores the way we sort the list of the pupils in the view.
final pupilSortProvider = StateProvider<PupilSort>(
  (_) => PupilSort.name,
);

/// This provider reads the stream from the database to get the list of the pupils.
final pupilListProvider = StreamProvider<List<Pupil>>((ref) {
  final repository = ref.watch(pupilRepositoryProvider);
  return repository.pupilsStream();
});

/// This provider is a workaround to avoid useless reads to the database.
/// If we pass the [PupilQuery] to [PupilRepository.pupilsStream], we could avoid
/// this provider but each time the user changes the sort method, but it leads to
/// more reads of the database (so more billing) and also a fast loading screen
/// while the new sort is processed.
/// So by storing the list in a provider and the sorted list in another one, we do not
/// request the database each time we sort the list by a new parameter.
final sortedPupilListProvider =
    Provider.family<AsyncValue<List<Pupil>>, PupilSort>((ref, sortBy) {
  return ref.watch(pupilListProvider).whenData((pupils) {
    switch (sortBy) {
      case PupilSort.name:
        pupils.sort((a, b) => a.firstName.compareTo(b.firstName));
        break;
      case PupilSort.loans:
        pupils.sort((a, b) => b.currentLoans.compareTo(a.currentLoans));
        break;
    }
    return pupils;
  });
});

/// A class that handles the arguments passed to the navigator
class PupilPageArguments {
  final String? pupilId;
  final Function(Pupil pupil) onPupilChanged;
  final bool isPicker;
  final bool isFullScreenRoute;

  PupilPageArguments({
    this.pupilId,
    required this.onPupilChanged,
    this.isPicker = false,
    this.isFullScreenRoute = false,
  });
}

enum PupilsMenuAction { cards }

class PupilListPage extends ConsumerWidget {
  const PupilListPage({Key? key}) : super(key: key);

  void _openMenu(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    showPlatformPopupMenu(
      context: context,
      ref: ref,
      items: [
        PlatformPopupMenuItem(
          title: l10n.pupilsActionExportCards,
          icon: CupertinoIcons.barcode,
          value: PupilsMenuAction.cards,
        ),
      ],
      onPressed: (action) {
        if (action != null) {
          _print(ref);
        }
      },
    );
  }

  Future<void> _print(WidgetRef ref) async {
    final l10n = ref.watch(localizationProvider);
    final user = ref.watch(userProvider)!;
    final pupils = ref.watch(pupilListProvider).asData!.value;

    final doc = pw.Document();

    for (Pupil pupil in pupils) {
      final card = await PupilCard.generate(
        pupil,
        title: user.cardTitle ?? l10n.pupilCardTitle,
        subtitle: l10n.pupilCardSubitle,
      );
      doc.addPage(card);
    }

    await Printing.sharePdf(
        bytes: await doc.save(),
        filename: "${user.cardTitle ?? l10n.pupilCardTitle}-${user.id}.pdf");
  }

  _addPupil(WidgetRef ref) {
    final id = ref.read(pupilRepositoryProvider).newDocumentId;
    final navigator = NavigatorKeys.main.currentState!;
    navigator.pushNamed(AppRoutes.pupilFormPage(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPicker = ref.watch(pickerProvider);
    final l10n = ref.watch(localizationProvider);
    final pupils = ref.watch(pupilListProvider).asData?.value;

    // Used to know if we are in add mode or edit mode
    final id = ref.watch(selectedPupilId);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: isPicker ? l10n.pupilPickerTitle : l10n.pupilListTitle,
        leading: isPicker
            ? PlatformNavigationBarCloseButton(
                onPressed: () {
                  final navigator = NavigatorKeys.main.currentState!;
                  navigator.pop();
                },
              )
            : null,
        trailing: isPicker
            ? SizedBox.shrink()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isCupertino())
                    PlatformNavigationBarButton(
                      icon: PlatformIcons.add,
                      onPressed: () => _addPupil(ref),
                    ),
                  if (id == null && pupils != null && pupils.isNotEmpty)
                    PlatformNavigationBarButton(
                      icon: isCupertino()
                          ? CupertinoIcons.creditcard
                          : PlatformIcons.more,
                      onPressed: () => _openMenu(context, ref),
                    ),
                ],
              ),
      ),
      body: const PupilListPageContents(),
      floatingActionButton: isPicker
          ? null
          : FloatingActionButton(
              onPressed: () => _addPupil(ref),
              tooltip: l10n.pupilAdd,
              child: Icon(Icons.add, size: 30),
              heroTag: null,
            ),
      isModal: isPicker,
    );
  }
}

class PupilListPageContents extends ConsumerWidget {
  const PupilListPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPicker = ref.watch(pickerProvider);
    final sortBy = ref.watch(pupilSortProvider);
    final pupils = ref.watch(sortedPupilListProvider(sortBy));
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);
    final maxSimultaneousLoans =
        ref.watch(userProvider.select((user) => user!.maxSimultaneousLoans));

    return pupils.when(
      loading: () => const Center(
        child: Center(
          child: PlatformActivityIndicator(),
        ),
      ),
      error: (error, _) {
        return Center(child: Text(error.toString()));
      },
      data: (data) {
        if (isPicker) {
          data = data
              .where((pupil) => pupil.currentLoans < maxSimultaneousLoans)
              .toList();
        }

        if (data.isEmpty) {
          return EmptyData(l10n.pupilEmptyCaption);
        }
        return Container(
          color: appTheme.listTileBackground,
          child: ProviderScope(
            overrides: [
              listViewThemeProvider.overrideWithValue(
                listViewTheme.copyWith(separatorPadding: 65.0),
              ),
            ],
            child: PlatformListView(
              isModal: isPicker,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    _currentPupil.overrideWithValue(data[index]),
                  ],
                  child: const _PupilItem(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

final _currentPupil = Provider<Pupil>((ref) {
  throw UnimplementedError();
});

/// A provider that needs to be scoped with the callback that
/// will be used when the user selects a pupil in the list.
final pupilHandler = Provider<Function(Pupil)>(
  (ref) => ((Pupil pupil) {
    final navigator = NavigatorKeys.pupils.currentState!;
    navigator.pushNamed(AppRoutes.pupilDetailsPage(pupil.id!));
  }),
);

class _PupilItem extends ConsumerWidget {
  const _PupilItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pupil = ref.watch(_currentPupil);
    final l10n = ref.watch(localizationProvider);

    // Used to display a tick when the view is used in "picker mode"
    final id = ref.watch(selectedPupilId);

    return PlatformListTile(
      leading: Avatar(
        name: pupil.displayName,
        url: pupil.photoUrl,
        color: pupil.color,
        radius: 20,
      ),
      label: pupil.displayName,
      caption: pupil.currentLoans > 0
          ? l10n.pupilCurrentLoans(pupil.currentLoans.toString())
          : l10n.pupilNoRunningLoan,
      trailing: id != null && id == pupil.id
          ? Icon(PlatformIcons.checkmark, color: Colors.green, size: 28)
          : null,
      onTap: () {
        ref.read(pupilHandler)(pupil);
      },
    );
  }
}
