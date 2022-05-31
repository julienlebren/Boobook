import 'dart:ui';
import 'package:boobook/config.dart';
import 'package:boobook/models/user.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/localization.dart';
import 'package:purchases/purchases.dart';
import 'package:sign_in/sign_in.dart';

/// A provider which listens to the user document in the database
/// Returns a [User] object (which may not be confused with the Firebase
/// User object, which is not used in the app) if it exists or an
/// empty stream otherwise.
final boobookUserStreamProvider = StreamProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository != null ? userRepository.streamUser() : Stream.empty();
});

final boobookAuthSettingsProvider = Provider<AuthSettings>((_) {
  return AuthSettings(
    suppliers: [
      SignInSupplier.apple,
      SignInSupplier.google,
      SignInSupplier.anonymous,
    ],
    userStreamProvider: boobookUserStreamProvider,
  );
});

final userProvider = Provider<User?>((ref) {
  final authSettings = ref.watch(boobookAuthSettingsProvider);
  final authState = ref.watch(authStateProvider(authSettings));
  return authState.maybeWhen(
    authed: (user) => user,
    orElse: () => null, // throw UnimplementedError(),
  );
});

final boobookUserLocaleProvider = Provider<Locale?>((ref) {
  final userLanguage = ref.watch(
    userProvider.select((user) => user?.lang),
  );
  if (userLanguage != null) {
    return Locale(userLanguage);
  }
  return null;
});

final localizationProvider = Provider<AppLocalizations>(
  (ref) {
    final locale = ref.watch(localeProvider);
    return lookupAppLocalizations(locale);
  },
  dependencies: [localeProvider],
);

final boobookPurchasesSettings = Provider<PurchasesSettings>((ref) {
  final user = ref.watch(userProvider)!;
  return PurchasesSettings(
    publicGoogleKey: publicGoogleKey,
    publicAppleKey: publicAppleKey,
    entitlementId: entitlementId,
    privacyPolicyUrl: privacyPolicyUrl,
    termsUrl: termsUrl,
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
