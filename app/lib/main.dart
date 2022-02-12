import 'dart:async';
import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:layout_builder/layout_builder.dart'
    show PlatformApp, appThemeProvider, brightnessProvider;
import 'package:purchases/purchases.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(ProviderScope(
      child: const BoobookApp(),
    ));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class BoobookApp extends ConsumerWidget {
  const BoobookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLang = ref.watch(selectedLangProvider);

    return ProviderScope(
      overrides: [
        appThemeProvider.overrideWithProvider(boobookTheme),
        brightnessProvider.overrideWithProvider(boobookBrightnessProvider),
        purchasesSettingsProvider
            .overrideWithProvider(boobookPurchasesSettings),
      ],
      child: PlatformApp(
        locale: Locale.fromSubtags(languageCode: selectedLang.identifier),
        navigatorKey: NavigatorKeys.main,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: AppRoutes.splashPage,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, ref),
        builder: (context, child) {
          return ProviderScope(
            overrides: [
              localizationProvider
                  .overrideWithValue(AppLocalizations.of(context)!),
            ],
            child: child!,
          );
        },
      ),
    );
  }
}
