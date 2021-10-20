import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/views/home/settings/settings_page.dart';
import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart'
    show PlatformTabNavigator, PlatformTabScaffold, TabItem, tabsProvider;
import 'package:layout_builder/theme/theme.dart';

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
    final subscriptionService = ref.read(subscriptionServiceProvider);
    subscriptionService.setup();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final subscriptionService = ref.read(subscriptionServiceProvider);
      subscriptionService.refreshSubscription();
    }
    ref.refresh(brightnessProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(localizationProvider);

    return ProviderScope(
      overrides: [
        tabsProvider.overrideWithValue(
          [
            TabItem(
              title: l10n.loansTab,
              icon: Icons.home,
              selectedIcon: Icons.home,
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.loans,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.loanListPage,
              ),
            ),
            TabItem(
              title: l10n.booksTab,
              icon: Icons.auto_stories,
              selectedIcon: Icons.auto_stories,
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.books,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.bookListPage,
              ),
            ),
            TabItem(
              title: l10n.pupilsTab,
              icon: Icons.people,
              selectedIcon: Icons.people,
              router: PlatformTabNavigator(
                navigatorKey: NavigatorKeys.pupils,
                onGenerateRoute: (settings) =>
                    AppRouter.onGenerateRoute(settings, ref),
                initialRoute: AppRoutes.pupilListPage,
              ),
            ),
            TabItem(
              title: l10n.settingsTab,
              icon: Icons.tune,
              selectedIcon: Icons.tune,
              router: SettingsOverviewPage(),
            ),
          ],
        ),
      ],
      child: const PlatformTabScaffold(),
    );
  }
}
