import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/views/home/scan/scan_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart'
    show
        PlatformIcons,
        PlatformTabNavigator,
        PlatformTabScaffold,
        TabItem,
        currentTabIndexProvider,
        isCupertino,
        tabsProvider;
import 'package:layout_builder/theme/theme.dart';
import 'package:purchases/purchases.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    final purchasesService = ref.read(purchasesServiceProvider);
    purchasesService.setup();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final purchasesService = ref.read(purchasesServiceProvider);
      purchasesService.refreshSubscription();
    }
    ref.refresh(brightnessProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(localizationProvider);

    return ProviderScope(
      overrides: [
        currentTabIndexProvider.overrideWithValue(StateController(0)),
        tabsProvider.overrideWithValue(
          [
            TabItem(
              title: l10n.loansTab,
              icon: Icon(Icons.home),
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.loans,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.loanListPage,
                onUnknownRoute: (_) => AppRouter.onGenerateRoute(
                  RouteSettings(name: AppRoutes.loanListPage),
                  ref,
                ),
              ),
            ),
            TabItem(
              title: l10n.booksTab,
              icon: Icon(Icons.auto_stories),
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.books,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.bookListPage,
                onUnknownRoute: (_) => AppRouter.onGenerateRoute(
                  RouteSettings(name: AppRoutes.bookListPage),
                  ref,
                ),
              ),
            ),
            if (isCupertino())
              TabItem(
                title: l10n.scanTab,
                icon: Icon(CupertinoIcons.barcode_viewfinder),
                selectedIcon: Icon(CupertinoIcons.barcode_viewfinder),
                router: const ScanNavigator(),
              ),
            TabItem(
              title: l10n.pupilsTab,
              icon: Icon(Icons.people),
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.pupils,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.pupilListPage,
                onUnknownRoute: (_) => AppRouter.onGenerateRoute(
                  RouteSettings(name: AppRoutes.pupilListPage),
                  ref,
                ),
              ),
            ),
            TabItem(
              title: l10n.settingsTab,
              icon: Icon(PlatformIcons.settings),
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.settings,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.settingsPage,
                onUnknownRoute: (_) => AppRouter.onGenerateRoute(
                  RouteSettings(name: AppRoutes.settingsPage),
                  ref,
                ),
              ),
            ),
          ],
        ),
      ],
      child: const PlatformTabScaffold(),
    );
  }
}
