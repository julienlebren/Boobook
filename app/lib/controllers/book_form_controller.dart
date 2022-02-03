import 'package:boobook/models/book.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_form_controller.freezed.dart';

@freezed
class BookFormEvent with _$BookFormEvent {
  const factory BookFormEvent.deleteImage() = _DeleteImage;
  const factory BookFormEvent.imageUploaded(String photoURL) = _ImageUploaded;
  const factory BookFormEvent.titleChanged(String title) = _TitleChanged;
  const factory BookFormEvent.isbnChanged(String isbn) = _IsbnChanged;
  const factory BookFormEvent.save() = _Save;
}

@freezed
class BookFormState with _$BookFormState {
  const factory BookFormState({
    required Book book,
    @Default(false) bool isUploading,
    @Default(0.0) double uploadProgress,
    @Default(false) bool isUploadSuccess,
    @Default(false) bool canSubmit,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _BookFormState;

  factory BookFormState.initial(Book book) => BookFormState(book: book);
}

class BookFormController extends StateNotifier<BookFormState> {
  BookFormController(
    this._repository,
    Book book,
  ) : super(BookFormState.initial(book)) {
    _checkIfCanSubmit();
  }

  final BookRepository _repository;

  void handleEvent(BookFormEvent event) {
    event.when(
      deleteImage: () {
        _repository.deleteImage(state.book.id!);
        state = state.copyWith.book(imageUrl: null);
      },
      imageUploaded: (imageUrl) {
        state = state.copyWith.book(imageUrl: imageUrl);
      },
      titleChanged: (title) {
        state = state.copyWith.book(title: title);
        _checkIfCanSubmit();
      },
      isbnChanged: (String isbn) {
        state = state.copyWith.book(isbn13: isbn);
        _checkIfCanSubmit();
      },
      save: () {
        _saveBook();
      },
    );
  }

  void _checkIfCanSubmit() {
    bool canSubmit = state.book.title.length > 1 &&
        (state.book.isbn13.isEmpty ||
            state.book.isbn13.onlyDigits.length == 13);

    if (canSubmit != state.canSubmit) {
      state = state.copyWith(
        errorText: null,
        canSubmit: canSubmit,
      );
    }
  }

  Future<void> _saveBook() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isSaving: true);

    try {
      await _repository.set(state.book);

      state = state.copyWith(
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        errorText: e.toString(),
      );
    }
  }
}
