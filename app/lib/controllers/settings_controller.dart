import 'package:boobook/models/user.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/theme/theme.dart';

part 'settings_controller.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.cardTitleChanged(String cardTitle) =
      _CardTitleChanged;
  const factory SettingsEvent.maxSimultaneousLoansChanged(
      int maxSimultaneousLoans) = MaxSimultaneousLoansChanged;
  const factory SettingsEvent.loanDurationChanged(int loanDuration) =
      _LoanDurationChanged;
  const factory SettingsEvent.langChanged(String lang) = _LangChanged;
  const factory SettingsEvent.themeChanged(ThemeType theme) = _ThemeChanged;
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.saving() = _Saving;
  const factory SettingsState.error(String errorText) = _Error;
  const factory SettingsState.success() = _Success;
}

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController(
    this._repository,
  ) : super(SettingsState.initial());

  final UserRepository _repository;

  void handleEvent(User user, SettingsEvent event) {
    _save(
      event.when(
        cardTitleChanged: (String cardTitle) =>
            user.copyWith(cardTitle: cardTitle),
        langChanged: (String lang) => user.copyWith(lang: lang),
        loanDurationChanged: (int loanDuration) =>
            user.copyWith(loanDuration: loanDuration),
        maxSimultaneousLoansChanged: (int maxSimultaneousLoans) =>
            user.copyWith(maxSimultaneousLoans: maxSimultaneousLoans),
        themeChanged: (theme) => user.copyWith(theme: theme),
      ),
    );
  }

  Future<void> _save(User user) async {
    state = SettingsState.saving();
    try {
      await _repository.set(user);
      state = SettingsState.success();
    } catch (e) {
      state = SettingsState.error(e.toString());
    }
  }
}
