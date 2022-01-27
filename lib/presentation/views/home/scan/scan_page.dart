import 'package:boobook/config.dart';
import 'package:boobook/controllers/scan_controller.dart';
import 'package:boobook/core/models/book.dart';
import 'package:boobook/presentation/common_widgets/book_availability.dart';
import 'package:boobook/presentation/views/home/books/book_list_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:barcode_widget/barcode_widget.dart' show BarcodeWidget;
import 'package:barcode_widget/barcode_widget.dart' as bcw show Barcode;
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isbndb/isbndb.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

final scanControllerProvider =
    StateNotifierProvider<ScanController, ScanState>((ref) {
  final loanRepository = ref.watch(loanRepositoryProvider);
  final bookRepository = ref.watch(bookRepositoryProvider);
  final pupilRepository = ref.watch(pupilRepositoryProvider);
  final isbndb = ISBNdb(isbnApiKey);
  final maxSimultaneousLoans = ref.watch(
    userProvider.select((user) => user!.maxSimultaneousLoans),
  );

  return ScanController(
    loanRepository,
    bookRepository,
    pupilRepository,
    isbndb,
    maxSimultaneousLoans,
  );
});

void _openLoanForm(WidgetRef ref) {
  Future.delayed(
    const Duration(seconds: 1),
    () {
      final controller = ref.read(scanControllerProvider.notifier);
      controller.handleEvent(
        ScanEvent.modalDismissed(),
      );
    },
  );

  final id = ref.read(loanRepositoryProvider).newDocumentId;
  final navigator = NavigatorKeys.main.currentState!;
  navigator.pushReplacementNamed(AppRoutes.loanFormNavigator(id));
}

class ScanNavigator extends ConsumerWidget {
  const ScanNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformTabNavigator(
      navigatorKey: NavigatorKeys.scan,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, ref),
      initialRoute: AppRoutes.scanMainPage,
      onUnknownRoute: (_) => AppRouter.onGenerateRoute(
        RouteSettings(name: AppRoutes.scanMainPage),
        ref,
      ),
    );
  }
}

class ScanPage extends ConsumerWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(scanControllerProvider.notifier);
    final l10n = ref.watch(localizationProvider);

    ref.listen<ScanState>(scanControllerProvider, (_, state) async {
      print("state is $state");
      if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content:
              state.barCode == null ? l10n.scanISBNNotFound : state.errorText,
        );
      } else if (state.maxLoansReached) {
        showAlertDialog(
          context,
          ref,
          title: l10n.warning,
          content: l10n.scanMaxLoansReached(
              state.pupil!.displayName, state.pupil!.currentLoans.toString()),
          actions: [
            PlatformDialogAction(
              buttonText: MaterialLocalizations.of(context).okButtonLabel,
              onPressed: () {
                final controller = ref.read(scanControllerProvider.notifier);
                controller.handleEvent(ScanEvent.errorDismissed());
              },
            ),
          ],
          displayCancelButton: false,
        );
      }
      if (state.isUnknownCode) {
        showAlertDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: "Ce code-barres n'est pas un numéro ISBN valide.",
          actions: [
            PlatformDialogAction(
              buttonText: MaterialLocalizations.of(context).okButtonLabel,
              onPressed: () {
                final controller = ref.read(scanControllerProvider.notifier);
                controller.handleEvent(ScanEvent.errorDismissed());
                //Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
          displayCancelButton: false,
        );
      } else if (state.isLoading) {
        if (await Vibration.hasVibrator() ?? false) {
          Vibration.vibrate(duration: 50, amplitude: 30);
        }
      } else if (state.isISBN) {
        showModalBottomSheet(
          context: context,
          barrierColor: Colors.transparent,
          //isDismissible: false,
          builder: (context) => const ScanSheet(),
          useRootNavigator: true,
        ).whenComplete(() {
          controller.handleEvent(
            ScanEvent.modalDismissed(),
          );
        });
      } else if (state.magazineBarCode != null) {
        final navigator = NavigatorKeys.main.currentState!;
        navigator.pushNamed(
          AppRoutes.bookListPage,
          arguments: BookPageArguments(
            magazineBarCode: state.magazineBarCode,
            onBookChanged: (book) => null,
          ),
        );
      } else if (state.book != null &&
          state.pupil != null &&
          !state.maxLoansReached) {
        _openLoanForm(ref);
      } else if (state.isSuccess) {
        ref.read(currentTabIndexProvider.state).state =
            state.loan != null ? 0 : 1;
        Future.delayed(
          const Duration(seconds: 2),
          () {
            // Used to pop only the ScanSheet widget
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      }
    });

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.black,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              QRView(
                key: GlobalKey(debugLabel: "QR"),
                //formatsAllowed: [BarcodeFormat.ean13],
                onQRViewCreated: (qrViewController) {
                  controller.handleEvent(
                    ScanEvent.controllerCreated(qrViewController),
                  );
                },
              ),
              CustomPaint(
                painter: HolePainter(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                child: Container(),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isCupertino() ? 15 : 0,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: isMaterial()
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.end,
                        children: [
                          if (isMaterial())
                            PlatformIconPlainButton(
                              icon: Icons.close,
                              backgroundColor: Colors.black26,
                              color: Colors.white,
                              size: 28,
                              onPressed: () {
                                final navigator =
                                    NavigatorKeys.main.currentState!;
                                navigator.pop();
                              },
                            ),
                          PlatformIconPlainButton(
                            icon: Icons.flashlight_on,
                            backgroundColor: Colors.black26,
                            color: Colors.white,
                            size: 28,
                            onPressed: () {
                              controller.handleEvent(
                                ScanEvent.toggleFlash(),
                              );
                            },
                          ),
                        ],
                      ),
                      Consumer(builder: (context, ref, _) {
                        final state = ref.watch(scanControllerProvider);
                        if (state.barCode != null &&
                            state.barCode!.code != null) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              state.barCode!.code!.length == 13
                                  ? l10n.scanSearchingISBN(state.barCode!.code!)
                                  : l10n.scanSearchingPupil,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanSheet extends StatelessWidget {
  const ScanSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isCupertino() ? 240 : 225,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(scanControllerProvider);
          if (state.book == null) {
            return const UnknownBook();
          } else if (state.isSuccess) {
            return const ScanSuccess();
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _BookTile(),
                const BookTileDivider(),
                const BookActions(),
              ],
            );
          }
        },
      ),
    );
  }
}

class UnknownBook extends ConsumerWidget {
  const UnknownBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final l10n = ref.watch(localizationProvider);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: BarcodeWidget(
            barcode: bcw.Barcode.isbn(),
            data: state.barCode!.code!,
            width: double.infinity,
            height: 70,
          ),
        ),
        const BookTileDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            l10n.scanISBNNotFound,
            textAlign: TextAlign.center,
            style: PlatformTextStyle.n17,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: double.infinity,
            child: PlatformElevatedButton(
              title: l10n.scanAddBook,
              onPressed: () {
                final id = ref.read(bookRepositoryProvider).newDocumentId;
                final navigator = NavigatorKeys.main.currentState!;
                navigator.pushReplacementNamed(AppRoutes.bookFormPage(id));

                /*navigator.pushNamedAndRemoveUntil(
                    AppRoutes.bookFormPage(state.barCode!.code!),
                    (route) => route.isFirst,
                    arguments: ref);*/
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _BookTile extends ConsumerWidget {
  const _BookTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(
      scanControllerProvider.select((controller) => controller.book),
    );
    if (book != null) {
      return ListTile(
        leading: SizedBox(
          width: 70,
          height: 70,
          child: book.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: book.imageUrl!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(color: Colors.grey[300]),
        ),
        title: Text(
          book.title,
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: PlatformTextStyle.n18,
        ),
        subtitle: book.isFromISBNdb
            ? Text(
                book.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PlatformTextStyle.n15,
              )
            : BookAvailability(
                isAvailable: book.isAvailable,
                expectedReturnTime: DateTime.now(),
              ),
        onTap: () {
          Navigator.pop(context);
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class BookTileDivider extends PlatformWidgetBase<Widget, SizedBox> {
  const BookTileDivider({Key? key}) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 15,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        decoration: BoxDecoration(
          color: Color(0xFFCCCCCC),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SizedBox createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return SizedBox(height: 18);
  }
}

class BookActions extends ConsumerWidget {
  const BookActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: (() {
        if (state.book != null) {
          if (state.book!.isFromISBNdb) {
            return BookAddTile();
          } else {
            if (state.book!.isAvailable) {
              return BookLoanTile();
            } else {
              return BookReturnTile();
            }
          }
        } else if (state.isUnknownPupil) {
          return UnknownPupilTile();
        }
      }()),
    );
  }
}

class BookAddTile extends ConsumerWidget {
  const BookAddTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final l10n = ref.watch(localizationProvider);
    final bookCount = ref.watch(bookListProvider).asData!.value.length;
    final isSubscribed =
        ref.watch(userProvider.select((user) => user!.isSubscribed));

    return FormWithOverlay(
      isSaving: state.isSaving,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlatformElevatedButton(
              title: l10n.scanAddBookToList,
              onPressed: () {
                if (bookCount > 8 && !isSubscribed) {
                  final navigator = NavigatorKeys.main.currentState!;
                  navigator.pushReplacementNamed(
                    AppRoutes.subscriptionPage,
                  );
                } else {
                  final controller = ref.read(scanControllerProvider.notifier);
                  controller.handleEvent(
                    ScanEvent.addBook(),
                  );
                }
              },
            ),
            PlatformTextButton(
              title: l10n.scanOpenForm,
              onPressed: () {
                final state = ref.read(scanControllerProvider);
                final navigator = NavigatorKeys.main.currentState!;

                if (bookCount > 8 && !isSubscribed) {
                  navigator.pushReplacementNamed(
                    AppRoutes.subscriptionPage,
                  );
                } else {
                  navigator.pushReplacementNamed(
                    AppRoutes.bookFormPage(state.book!.id!),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BookReturnTile extends ConsumerWidget {
  const BookReturnTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pupil = ref.watch(
      scanControllerProvider.select((state) => state.loan!.pupil!),
    );
    final isSaving = ref.watch(
      scanControllerProvider.select((state) => state.isSaving),
    );
    final l10n = ref.watch(localizationProvider);

    return FormWithOverlay(
      isSaving: isSaving,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n.scanBorrowedBy(pupil.displayName),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: PlatformTextStyle.n17,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: PlatformElevatedButton(
                title: l10n.loanActionReturn,
                onPressed: () {
                  final controller = ref.read(scanControllerProvider.notifier);
                  controller.handleEvent(
                    ScanEvent.returnLoan(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookLoanTile extends ConsumerWidget {
  const BookLoanTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.scanPupilCard,
          textAlign: TextAlign.center,
          style: PlatformTextStyle.n17,
        ),
        PlatformTextButton(
          title: l10n.scanPickPupil,
          onPressed: () => _openLoanForm(ref),
        ),
      ],
    );
  }
}

class UnknownPupilTile extends ConsumerWidget {
  const UnknownPupilTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.scanPupilNotFound,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.red,
          ),
        ),
        PlatformTextButton(
          title: l10n.scanPupilNotFoundPickPupil,
          onPressed: () {
            final navigator = NavigatorKeys.scan.currentState!;
            navigator.pushNamed(AppRoutes.pupilListPage);
          },
        ),
      ],
    );
  }
}

class ScanSuccess extends ConsumerWidget {
  const ScanSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final state = ref.watch(scanControllerProvider);
    final appTheme = ref.watch(appThemeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.check,
            size: 80,
            color: appTheme.primaryColor,
          ),
        ),
        Text(
          state.loan != null ? l10n.scanSuccessReturn : l10n.scanSuccessAdd,
          style: PlatformTextStyle.n18.copyWith(
            color: appTheme.primaryColor,
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

class HolePainter extends CustomPainter {
  HolePainter({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final rectWidth = width * 0.9;
    final rectHeight = rectWidth * 0.7;
    final paint = Paint();
    RRect rRect = RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(width / 2, height / 2),
            width: rectWidth,
            height: rectHeight),
        Radius.circular(8));
    paint.color = Colors.black54;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRRect(RRect.fromLTRBR(0, 0, width, height, Radius.zero)),
        Path()..addRRect(rRect),
      ),
      paint,
    );

    Paint paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path = Path();
    path.addRRect(rRect);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
