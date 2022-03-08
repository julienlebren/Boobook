import 'package:boobook/controllers/settings_controller.dart';
import 'package:boobook/presentation/router/router.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:localization/localization.dart';
import 'package:purchases/purchases.dart';
import 'package:sign_in/sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return SettingsController(repository!);
});

void _handleEvent(WidgetRef ref, SettingsEvent event) {
  final controller = ref.read(settingsControllerProvider.notifier);
  final user = ref.read(userProvider);
  controller.handleEvent(user!, event);
}

class SettingsOverviewPage extends ConsumerWidget {
  const SettingsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    return ProviderScope(
      overrides: [
        /*formThemeProvider.overrideWithValue(FormTheme(
          displayRowDivider: false,
          rowDividerPadding: 63,
          sectionDividerPadding: 0,
        ))*/
      ],
      child: WillPopScope(
        onWillPop: () async => false,
        child: PlatformScaffold(
          appBar: PlatformNavigationBar(
            title: l10n.settingsTitle,
          ),
          body: FormPage(
            children: [
              const SettingsLoansSection(),
              const SettingsCardsSection(),
              const SettingsAppearanceSection(),
              const SettingsAccountSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsLoansSection extends ConsumerWidget {
  const SettingsLoansSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final maxSimultaneousLoans = ref.watch(
      userProvider.select(
        (user) => user?.maxSimultaneousLoans ?? 0,
      ),
    );
    final loanDuration = ref.watch(
      userProvider.select(
        (user) => user?.loanDuration ?? 0,
      ),
    );

    return FormSection(
      title: l10n.settingsLoansSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsMaxSimultaneousLoans,
          value: maxSimultaneousLoans.toString(),
          onPressed: () => showPlatformNumberPicker(
            context,
            ref,
            title: l10n.settingsMaxSimultaneousLoans,
            minValue: 1,
            maxValue: 20,
            selectedValue: maxSimultaneousLoans,
            onChanged: (value) => _handleEvent(
              ref,
              SettingsEvent.maxSimultaneousLoansChanged(value),
            ),
          ),
        ),
        FormTappableField(
          label: l10n.settingsLoanDuration,
          value: l10n.settingsLoanDays(loanDuration.toString()),
          onPressed: () => showPlatformNumberPicker(
            context,
            ref,
            title: l10n.settingsLoanDuration,
            minValue: 1,
            maxValue: 60,
            selectedValue: loanDuration,
            onChanged: (value) => _handleEvent(
              ref,
              SettingsEvent.loanDurationChanged(value),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsCardsSection extends ConsumerWidget {
  const SettingsCardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final cardTitle = ref.watch(
      userProvider.select(
        (user) => user?.cardTitle,
      ),
    );
    final textController = TextEditingController(text: cardTitle);
    final focusNode = FocusNode();

    return FormSection(
      title: l10n.settingsCardsSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsCardLabel,
          value: cardTitle ?? l10n.pupilCardTitle,
          onPressed: () {
            showAlertDialog(
              context,
              ref,
              title: l10n.settingsCardLabel,
              child: PlatformTextField(
                controller: textController,
                focusNode: focusNode,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: kDefaultRoundedBorderDecoration,
              ),
              displayCancelButton: true,
              actions: [
                PlatformDialogAction(
                  buttonText: l10n.saveButton,
                  onPressed: () {
                    _handleEvent(
                      ref,
                      SettingsEvent.cardTitleChanged(textController.text),
                    );
                  },
                  isDefaultAction: true,
                ),
              ],
            );
            focusNode.requestFocus();
          },
        ),
      ],
    );
  }
}

class SettingsAppearanceSection extends ConsumerWidget {
  const SettingsAppearanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final theme = ref.watch(
      userProvider.select(
        (user) => user?.theme,
      ),
    );
    final locale = ref.watch(localeProvider);
    final locales = ref.read(localesProvider);

    return FormSection(
      title: l10n.settingsAppearanceSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsThemeLabel,
          value: theme?.description(ref),
          onPressed: () => showPlatformSinglePicker<ThemeType>(
            context,
            ref,
            title: l10n.settingsThemeLabel,
            data: ThemeType.values,
            selectedValue: theme,
            itemBuilder: (theme) => Text(theme.description(ref)),
            onChanged: (theme) => _handleEvent(
              ref,
              SettingsEvent.themeChanged(theme),
            ),
          ),
        ),
        FormTappableField(
          label: l10n.settingsLanguageLabel,
          value: locale.toString(),
          onPressed: () => showPlatformSinglePicker<Locale>(
            context,
            ref,
            title: l10n.settingsLanguageLabel,
            data: locales,
            selectedValue: locale,
            itemBuilder: (locale) => Text(locale.toString()),
            onChanged: (locale) => _handleEvent(
              ref,
              SettingsEvent.langChanged(locale.languageCode),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsAccountSection extends ConsumerWidget {
  const SettingsAccountSection({Key? key}) : super(key: key);

  _confirmLogout(BuildContext context, WidgetRef ref) async {
    final l10n = ref.read(localizationProvider);
    await showAlertDialog(
      context,
      ref,
      title: l10n.logoutButton,
      content: l10n.logoutCaption,
      displayCancelButton: true,
      actions: [
        PlatformDialogAction(
          buttonText: l10n.logoutButton,
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: () async {
            if (isMaterial()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            final controller =
                ref.read(signInButtonsControllerProvider.notifier);
            controller.signOut();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final emailAddress = ref.watch(
      userProvider.select(
        (user) => user?.emailAddress,
      ),
    );
    final isSubscribed = ref.watch(
      userProvider.select(
        (user) => user?.isSubscribed ?? false,
      ),
    );

    return FormSection(
      title: l10n.settingsAccountSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsEmailLabel,
          value: emailAddress,
          onPressed: () => _confirmLogout(context, ref),
        ),
        FormTappableField(
          label: l10n.settingsSubscriptionLabel,
          value: isSubscribed
              ? l10n.settingsSubscriptionActive
              : l10n.settingsSubscriptionInactive,
          onPressed: () async {
            if (isSubscribed) {
              final url = isMaterial() ? googlePlayURL : appStoreURL;
              await launch(url);
            } else {
              final navigator = AppRouter.main.currentState!;
              navigator.pushNamed(AppRouter.subscriptionPage);
            }
          },
        ),
      ],
    );
  }
}
