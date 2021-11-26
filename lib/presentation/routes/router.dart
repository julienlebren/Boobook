import 'package:boobook/presentation/views/home/books/book_details_page.dart';
import 'package:boobook/presentation/views/home/books/book_form_page.dart';
import 'package:boobook/presentation/views/home/books/book_list_page.dart';
import 'package:boobook/presentation/views/home/loans/loan_form_page.dart';
import 'package:boobook/presentation/views/home/loans/loan_list_page.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_details_page.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_form_page.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_list_page.dart';
import 'package:boobook/presentation/views/home/scan/scan_page.dart';
import 'package:boobook/presentation/views/home/settings/settings_page.dart';
import 'package:boobook/presentation/views/home/subscription/subscription_page.dart';
import 'package:boobook/presentation/views/splash/splash_page.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/pupils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart' show platformPageRoute;

class AppRoutes {
  static const splashPage = 'home';
  static const scanPage = 'scan';
  static const scanMainPage = 'scan/scan';
  static const scanResultsPage = 'scan/results';
  static const books = 'books';
  static const bookListPage = 'books';
  static bookDetailsPage(String id) => 'books/$id';
  static bookFormPage(String id) => 'books/$id/edit';
  static const pupils = 'pupils';
  static const pupilListPage = 'pupils';
  static pupilDetailsPage(String id) => 'pupils/$id';
  static pupilFormPage(String id) => 'pupils/$id/edit';
  static const loans = 'loans';
  static const loanListPage = 'loans';
  static const loanNewPage = 'loans/new';
  static loanFormPage(String id) => 'loans/$id/edit';
  static const settingsPage = 'settings';
  static const subscriptionPage = 'subscription';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, WidgetRef ref) {
    if (settings.name != null) {
      switch (settings.name) {
        case AppRoutes.splashPage:
          return platformPageRoute(
            builder: (_) => const SplashPage(),
          );
        case AppRoutes.subscriptionPage:
          return platformPageRoute(
            builder: (_) => const SubscriptionPage(),
            fullscreenDialog: true,
          );
        case AppRoutes.scanPage:
          return platformPageRoute(
            builder: (_) => const ScanNavigator(),
            fullscreenDialog: true,
          );
        case AppRoutes.scanMainPage:
          return platformPageRoute(
            builder: (_) => const ScanPage(),
          );
        case AppRoutes.scanResultsPage:
          return platformPageRoute(
            builder: (_) => const ScanSheet(),
          );
        case AppRoutes.settingsPage:
          return platformPageRoute(
            builder: (_) => const SettingsOverviewPage(),
          );
        case AppRoutes.pupilListPage:
          final args = settings.arguments as PupilPageArguments?;
          return MaterialPageRoute<dynamic>(
            builder: (_) {
              if (args != null) {
                return ProviderScope(
                  overrides: [
                    selectedPupilId.overrideWithValue(args.pupilId),
                    pupilHandler.overrideWithValue(args.onPupilChanged),
                  ],
                  child: const PupilListPage(),
                );
              }
              return const PupilListPage();
            },
            fullscreenDialog: true,
          );
        case AppRoutes.bookListPage:
          return platformPageRoute(
            builder: (_) => const BookListPage(),
            fullscreenDialog: true,
          );
        case AppRoutes.loanListPage:
          return platformPageRoute(
            builder: (_) => const LoanListPage(),
            fullscreenDialog: true,
          );
        case AppRoutes.loanNewPage:
          return platformPageRoute(
            builder: (_) => const LoanFormPage(),
            fullscreenDialog: true,
          );
      }

      final split = settings.name!.split('/');

      if (split.length > 1) {
        final id = split[1];

        // Loans
        if (settings.name!.startsWith(AppRoutes.loans)) {
          return platformPageRoute(
            builder: (_) => ProviderScope(
              overrides: [
                selectedLoanId.overrideWithValue(id),
              ],
              child: const LoanFormPage(),
            ),
            fullscreenDialog: true,
          );
        }

        // Books
        if (settings.name!.startsWith(AppRoutes.books)) {
          if (id.length == 20) {
            if (split.length == 3) {
              return platformPageRoute(
                builder: (_) => ProviderScope(
                  overrides: [
                    selectedBookId.overrideWithValue(id),
                  ],
                  child: const BookFormPage(),
                ),
                fullscreenDialog: true,
              );
            } else {
              return platformPageRoute(
                builder: (_) => ProviderScope(
                  overrides: [
                    selectedBookId.overrideWithValue(id),
                  ],
                  child: const BookDetailsPage(),
                ),
              );
            }
          }
        }

        // Pupils
        if (settings.name!.startsWith(AppRoutes.pupils)) {
          if (id.length == 20) {
            if (split.length == 3) {
              return platformPageRoute(
                builder: (_) => ProviderScope(
                  overrides: [
                    selectedPupilId.overrideWithValue(id),
                  ],
                  child: const PupilFormPage(),
                ),
                fullscreenDialog: true,
              );
            } else {
              return platformPageRoute(
                builder: (_) => ProviderScope(
                  overrides: [
                    selectedPupilId.overrideWithValue(id),
                  ],
                  child: const PupilDetailsPage(),
                ),
              );
            }
          }
        }
      }
    }
    /*throw Exception(
        "The route ${settings.name} is not handled by the router 🤷");*/
  }
}
