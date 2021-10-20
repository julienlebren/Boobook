import 'package:boobook/config.dart';
import 'package:boobook/controllers/settings_controller.dart';
import 'package:boobook/l10n/theme.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/providers/common.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:models/models.dart';
import 'package:url_launcher/url_launcher.dart';

final settingsControllerProvider =
    StateNotifierProvider.autoDispose<SettingsController, SettingsState>((ref) {
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
        (user) => user!.maxSimultaneousLoans,
      ),
    );
    final loanDuration = ref.watch(
      userProvider.select(
        (user) => user!.loanDuration,
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
        (user) => user!.cardTitle,
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
                    Navigator.pop(context);
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
    final themeL10n = ref.watch(themeLocalizationProvider(l10n));
    final theme = ref.watch(
      userProvider.select(
        (user) => user!.theme,
      ),
    );
    final languages = ref.read(languagesProvider);
    final selectedLang = ref.watch(selectedLangProvider);

    return FormSection(
      title: l10n.settingsAppearanceSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsThemeLabel,
          value: theme.description(themeL10n),
          onPressed: () => showPlatformSinglePicker<ThemeType>(
            context,
            ref,
            title: l10n.settingsAppearanceSectionTitle,
            data: ThemeType.values,
            selectedValue: theme,
            itemBuilder: (theme) => Text(theme.description(themeL10n)),
            onChanged: (theme) => _handleEvent(
              ref,
              SettingsEvent.themeChanged(theme),
            ),
          ),
        ),
        FormTappableField(
          label: l10n.settingsLanguageLabel,
          value: selectedLang.name,
          onPressed: () => showPlatformSinglePicker<Language>(
            context,
            ref,
            title: l10n.settingsLanguageLabel,
            data: languages,
            selectedValue: selectedLang,
            itemBuilder: (lang) => Text(lang.name),
            onChanged: (lang) => _handleEvent(
              ref,
              SettingsEvent.langChanged(lang.identifier),
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
      displayCancelButton: false,
      actions: [
        PlatformDialogAction(
          buttonText: l10n.cancelButton,
        ),
        PlatformDialogAction(
          buttonText: l10n.logoutButton,
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: () async {
            await ref.read(authServiceProvider).signOut();
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
        (user) => user!.emailAddress,
      ),
    );
    final isSubscribed = ref.watch(
      userProvider.select(
        (user) => user!.isSubscribed,
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
              final navigator = NavigatorKeys.main.currentState!;
              navigator.pushNamed(AppRoutes.subscriptionPage);
            }
          },
        ),
      ],
    );
  }
}