import 'dart:ui' as ui;
import 'package:boobook/config.dart';
import 'package:boobook/core/auth.dart';
import 'package:boobook/core/models/user.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:models/models.dart';
import 'package:subscription_service/subscription_service.dart';

/// A provider to access AppLocalizations from everywhere in the app
/// Overridden in the [PlatformApp] widget which returns either a
/// [MaterialApp] or a [CupertinoApp].
final localizationProvider = Provider<AppLocalizations>((ref) {
  throw UnimplementedError();
});

/// A provider which listens to the user document in the database
/// Returns a [User] object (which may not be confused with the Firebase
/// User object, which is not used in the app) if it exists or an
/// empty stream otherwise.
final userStreamProvider = StreamProvider<User?>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository != null ? userRepository.streamUser() : Stream.empty();
});

/// To avoid too much rebuilds in the app by listening the whole
/// profile object, we have many providers for each variables
final userProvider = Provider<User?>((ref) {
  final userAsyncValue = ref.watch(userStreamProvider);
  return userAsyncValue.maybeWhen(
    data: (user) => user,
    orElse: () => null,
  );
});

/// A provider to get the current auth status of the user
/// Listens two providers to return the correct state:
/// `authStateChangesProvider` if the user is authenticated with Firebase
/// `userStreamProvider` to get the user data from Firestore.
final authStateProvider = StateProvider<AuthState>((ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);
  return authStateChanges.when(
    loading: () => AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (user) {
      if (user == null) {
        return AuthState.notAuthed();
      } else {
        final user = ref.watch(userStreamProvider);
        return user.when(
          loading: () => AuthState.initializing(),
          error: (error, _) => AuthState.error(error.toString()),
          data: (user) {
            if (user is User) {
              return AuthState.authed();
            } else {
              return AuthState.waitingUserCreation();
            }
          },
        );
      }
    },
  );
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

final subscriptionServiceProvider = Provider<SubscriptionService>((ref) {
  final user = ref.watch(userProvider)!;
  return SubscriptionService(
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

final pickerProvider = Provider.autoDispose<bool>((_) => false);
