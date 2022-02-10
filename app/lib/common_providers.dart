import 'dart:ui' as ui;
import 'package:boobook/config.dart';
import 'package:boobook/models/user.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:layout_builder/theme/theme.dart';
import 'package:models/models.dart';
import 'package:purchases/purchases.dart';
import 'package:sign_in/sign_in.dart';

/// A provider which listens to the user document in the database
/// Returns a [User] object (which may not be confused with the Firebase
/// User object, which is not used in the app) if it exists or an
/// empty stream otherwise.
final userStreamProvider = StreamProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository != null ? userRepository.streamUser() : Stream.empty();
});

final needUserInfoProvider = Provider<bool>((_) => false);

final authSettingsProvider = Provider<AuthSettings>((_) {
  return AuthSettings(userStreamProvider, needUserInfoProvider);
});

final userProvider = Provider<User?>((ref) {
  final authSettings = ref.watch(authSettingsProvider);
  final authState = ref.watch(authStateProvider(authSettings));
  return authState.maybeWhen(
    authed: (user) => user,
    orElse: () => null,
  );
});

/// A provider to access AppLocalizations from everywhere in the app
/// Overridden in the [PlatformApp] widget which returns either a
/// [MaterialApp] or a [CupertinoApp].
final localizationProvider = Provider<AppLocalizations>((ref) {
  final locale = ui.window.locale;
  return lookupAppLocalizations(locale);
});

/// Availables languages in the app
final languagesProvider = Provider<List<Language>>((ref) {
  return [
    Language(identifier: "en", name: "English", isDefault: true),
    Language(identifier: "fr", name: "Français"),
  ];
});

final selectedLangProvider = Provider<Language>((ref) {
  final languages = ref.read(languagesProvider);

  if (languages.isEmpty) {
    throw UnimplementedError();
  }

  final localeFallback = ui.window.locale.languageCode;
  final langCode = ref.watch(
    userProvider.select((user) => user?.lang ?? localeFallback),
  );

  var filteredLanguages = languages.where(
    (lang) => lang.identifier == langCode,
  );
  if (filteredLanguages.isNotEmpty) {
    return filteredLanguages.first;
  }

  filteredLanguages = languages.where((lang) => lang.isDefault == true);
  if (filteredLanguages.isNotEmpty) {
    return filteredLanguages.first;
  }

  return languages.first;
});

final boobookPurchasesSettings = Provider<PurchasesSettings>((ref) {
  final user = ref.watch(userProvider)!;
  return PurchasesSettings(
    purchasesApiKey: purchasesApiKey,
    entitlementId: entitlementId,
    userId: user.id!,
    processHandler: (isSubscribed, expirationDate) async {
      final repository = ref.watch(userRepositoryProvider)!;

      if (isSubscribed != user.isSubscribed) {
        await repository.set(
          user.copyWith(
            isSubscribed: isSubscribed,
            subscriptionEndTime: expirationDate,
          ),
        );
      }
    },
  );
});

final boobookThemeLocalizationProvider = Provider<ThemeLocalizations>((ref) {
  final l10n = ref.watch(localizationProvider);
  return ThemeLocalizations(
    dark: l10n.themeDark,
    light: l10n.themeLight,
    system: l10n.themeSystem,
  );
});

/// The selected [Book] id
/// It must be overridden in a [ProviderScope] before being used.
final selectedBookId = Provider<String>((_) => throw UnimplementedError());

/// The selected [Pupil] id
/// Unlike the `selectedBookId` provider, it can be null
final selectedPupilId = Provider<String?>((ref) => null);

/// Provider used to know if we are displaying a list in the main view,
/// or if it is open to pick an entry (for example to pick a book or a pupil
/// when creating a loan)
final pickerProvider = Provider.autoDispose<bool>((_) => false);
