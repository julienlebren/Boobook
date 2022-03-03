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
import 'package:boobook/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart' show platformPageRoute;

class AppRouter {
  static final main = GlobalKey<NavigatorState>();
  static final scan = GlobalKey<NavigatorState>();
  static final loans = GlobalKey<NavigatorState>();
  static final books = GlobalKey<NavigatorState>();
  static final pupils = GlobalKey<NavigatorState>();
  static final settings = GlobalKey<NavigatorState>();
  static final loan = GlobalKey<NavigatorState>();

  static const scanPage = 'scan';
  static const scanMainPage = 'scan/scan';
  static const scanResultsPage = 'scan/results';
  static const bookListPage = 'books';
  static bookDetailsPage(String id) => 'books/$id';
  static bookFormPage(String id) => 'books/$id/edit';
  static const pupilListPage = 'pupils';
  static pupilDetailsPage(String id) => 'pupils/$id';
  static pupilFormPage(String id) => 'pupils/$id/edit';
  static const loanListPage = 'loans';
  static const loanNewPage = 'loans/new';
  static loanFormNavigator(String id) => 'loans/$id';
  static loanFormPage(String id) => 'loans/$id/edit';
  static const settingsPage = 'settings';
  static const subscriptionPage = 'subscription';

  static PageRoute<dynamic>? onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    if (settings.name != null) {
      switch (settings.name) {
        case subscriptionPage:
          return platformPageRoute(
            builder: (_) => const SubscriptionPage(),
            fullscreenDialog: true,
          );
        case scanPage:
          return platformPageRoute(
            builder: (_) => scanNavigator(ref),
            fullscreenDialog: true,
          );
        case scanMainPage:
          return platformPageRoute(
            builder: (_) => const ScanPage(),
          );
        case scanResultsPage:
          return platformPageRoute(
            builder: (_) => const ScanSheet(),
          );
        case settingsPage:
          return platformPageRoute(
            builder: (_) => const SettingsOverviewPage(),
          );
        case pupilListPage:
          final args = settings.arguments as PupilPageArguments?;
          return MaterialPageRoute<dynamic>(
            builder: (_) {
              if (args != null) {
                return ProviderScope(
                  overrides: [
                    selectedPupilId.overrideWithValue(args.pupilId),
                    pupilHandler.overrideWithValue(args.onPupilChanged),
                    pickerProvider.overrideWithValue(args.isPicker),
                  ],
                  child: const PupilListPage(),
                );
              }
              return const PupilListPage();
            },
            fullscreenDialog: args?.isFullScreenRoute ?? false,
          );
        case bookListPage:
          final args = settings.arguments as BookPageArguments?;
          return MaterialPageRoute<dynamic>(
            builder: (_) {
              if (args != null) {
                return ProviderScope(
                  overrides: [
                    selectedPupilId.overrideWithValue(args.bookId),
                    bookHandler.overrideWithValue(args.onBookChanged),
                    pickerProvider.overrideWithValue(args.isPicker),
                    magazineProvider.overrideWithValue(args.magazineBarCode),
                  ],
                  child: const BookListPage(),
                );
              }
              return const BookListPage();
            },
            fullscreenDialog: true,
          );
        case loanListPage:
          return platformPageRoute(
            builder: (_) => const LoanListPage(),
            fullscreenDialog: true,
          );
      }

      final split = settings.name!.split('/');

      if (split.length > 1) {
        final id = split[1];

        // Loans
        if (settings.name!.startsWith("loans")) {
          if (split.length == 3) {
            return platformPageRoute(
              builder: (_) => ProviderScope(
                overrides: [
                  selectedLoanId.overrideWithValue(id),
                ],
                child: const LoanFormPage(),
              ),
            );
          } else {
            return platformPageRoute(
              builder: (_) => ProviderScope(
                overrides: [
                  pickerProvider.overrideWithValue(true),
                  selectedLoanId.overrideWithValue(id),
                ],
                child: const LoanFormNavigator(),
              ),
              fullscreenDialog: true,
            );
          }
        }

        // Books
        if (settings.name!.startsWith("books")) {
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
        if (settings.name!.startsWith("pupils")) {
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

    return null;
  }
}
