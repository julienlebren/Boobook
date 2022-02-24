import 'package:boobook/controllers/book_form_controller.dart';
import 'package:boobook/models/book.dart';
import 'package:boobook/presentation/common_widgets/book_cover.dart';
import 'package:boobook/presentation/router/router.dart';
import 'package:boobook/presentation/views/home/books/book_list_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/views/home/scan/scan_page.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:photo_upload/upload.dart';
import 'package:sign_in/sign_in.dart';

final bookControllerProvider = StateNotifierProvider.family
    .autoDispose<BookFormController, BookFormState, String>((ref, id) {
  final repository = ref.watch(bookRepositoryProvider);
  final bookList = ref.read(bookListProvider).asData?.value ?? [];
  final filteredList = bookList.where((book) => book.id == id);

  if (filteredList.isEmpty) {
    final scanController = ref.read(scanControllerProvider);
    if (scanController.book != null) {
      return BookFormController(repository, scanController.book!);
    } else if (scanController.barCode?.code != null) {
      return BookFormController(
        repository,
        Book.fromUnknownISBN(
          id: id,
          isbn13: scanController.barCode!.code!,
        ),
      );
    } else {
      return BookFormController(repository, Book.create(id: id));
    }
  } else {
    return BookFormController(repository, filteredList.first);
  }
});

void _handleEvent(WidgetRef ref, BookFormEvent event) {
  final id = ref.watch(selectedBookId);
  final controller = ref.read(bookControllerProvider(id).notifier);
  controller.handleEvent(event);
}

class BookFormPage extends ConsumerWidget {
  const BookFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedBookId);
    final l10n = ref.watch(localizationProvider);

    ref.listen<BookFormState>(bookControllerProvider(id), (_, state) {
      if (state.isSuccess) {
        ref.read(currentTabIndexProvider.state).state = 1;
        Navigator.pop(context);
      } else if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return const BookFormPageBuilder();
  }
}

class BookFormPageBuilder extends ConsumerWidget {
  const BookFormPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedBookId);
    final canSubmit = ref.watch(
      bookControllerProvider(id).select((state) => state.canSubmit),
    );
    final isSaving = ref.watch(
      bookControllerProvider(id).select((state) => state.isSaving),
    );
    final isNewBook = ref.watch(
      bookControllerProvider(id).select((state) => state.book.isNewBook),
    );

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: isNewBook == true ? l10n.bookNewTitle : l10n.bookEditTitle,
        trailing: BookFormSubmitButton(
          isSaving: isSaving,
          canSubmit: canSubmit,
        ),
      ),
      body: FormWithOverlay(
        isSaving: isSaving,
        child: const BookFormContents(),
      ),
    );
  }
}

class BookFormSubmitButton extends ConsumerWidget {
  const BookFormSubmitButton({
    Key? key,
    required this.canSubmit,
    required this.isSaving,
  }) : super(key: key);

  _saveBook(WidgetRef ref) {
    final bookCount = ref.watch(bookListProvider).asData!.value.length;
    final isSubscribed =
        ref.watch(userProvider.select((user) => user!.isSubscribed));

    if (bookCount > 8 && !isSubscribed) {
      final navigator = AppRouter.main.currentState!;
      navigator.pushReplacementNamed(
        AppRouter.subscriptionPage,
      );
    } else {
      _handleEvent(ref, BookFormEvent.save());
    }
  }

  final bool isSaving;
  final bool canSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSaving) {
      return FormLoader();
    } else {
      return PlatformNavigationBarSaveButton(
        onPressed: canSubmit ? () => _saveBook(ref) : null,
      );
    }
  }
}

class BookFormContents extends ConsumerWidget {
  const BookFormContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormPage(
      children: [
        const BookFormCoverSection(),
        const BookFormGeneralSection(),
      ],
    );
  }
}

class BookFormCoverSection extends ConsumerWidget {
  const BookFormCoverSection({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedBookId);
    final book = ref.watch(bookControllerProvider(id)).book;
    final repository = ref.watch(bookRepositoryProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMaterial() ? 15 : 0),
      child: UploadWidget(
        width: 300,
        height: 150,
        isRounded: false,
        title: l10n.bookCover,
        storageRef: book.isFromUnknownISBN
            ? repository.storageLibraryRef(book.id!)
            : repository.storageRef(book.id!),
        showDeleteButton: book.imageUrl != null &&
            !book.imageUrl!.startsWith("https://images.isbndb.com/"),
        onDelete: () => _handleEvent(ref, BookFormEvent.deleteImage()),
        onStart: () {},
        onSuccess: (url) => _handleEvent(ref, BookFormEvent.imageUploaded(url)),
        maxWidth: 1000,
        child: BookCover(
          book: book,
          width: 300,
          height: 150,
        ),
      ),
    );
  }
}

class BookFormGeneralSection extends ConsumerStatefulWidget {
  const BookFormGeneralSection({Key? key}) : super(key: key);

  @override
  createState() => _BookFormGeneralSectionState();
}

class _BookFormGeneralSectionState
    extends ConsumerState<BookFormGeneralSection> {
  final titleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      //titleFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedBookId);
    final book = ref.read(bookControllerProvider(id)).book;

    return FormSection(
      children: [
        FormRow(
          child: PlatformTextField(
            controller: TextEditingController(text: book.title),
            focusNode: titleFocusNode,
            textInputAction: TextInputAction.done,
            placeholder: l10n.bookTitle,
            autocorrect: false,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (String value) {
              _handleEvent(ref, BookFormEvent.titleChanged(value));
            },
          ),
        ),
        FormRow(
          child: PlatformTextField(
            controller: TextEditingController(text: book.dashedISBN),
            textInputAction: TextInputAction.done,
            placeholder: l10n.bookISBN,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              _handleEvent(ref, BookFormEvent.isbnChanged(value));
            },
          ),
        ),
        if (isMaterial())
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormSectionCaption(caption: l10n.bookGeneralSectionCaption),
          ),
      ],
      caption: isCupertino() ? l10n.bookGeneralSectionCaption : null,
    );
  }
}
