import 'package:boobook/config.dart';
import 'package:boobook/controllers/subscription_controller.dart';
import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:url_launcher/url_launcher.dart';

final subscriptionControllerProvider = StateNotifierProvider.autoDispose<
    SubscriptionController, SubscriptionState>((ref) {
  final service = ref.watch(subscriptionServiceProvider);
  return SubscriptionController(service);
});

void _handleEvent(WidgetRef ref, SubscriptionEvent event) {
  final controller = ref.read(subscriptionControllerProvider.notifier);
  controller.handleEvent(event);
}

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subscriptionControllerProvider);
    final l10n = ref.read(localizationProvider);

    ref.listen<SubscriptionState>(subscriptionControllerProvider, (_, state) {
      if (state.errorText != null) {
        final l10n = ref.read(localizationProvider);
        showAlertDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText!,
        );
      } else if (state.isSuccess) {
        Navigator.pop(context);
      }
    });

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: l10n.subscriptionTitle,
      ),
      body: SubscriptionPageContents(
        hasStoreIssue: state.isReady && state.price == null,
        isPurchasing: state.isLoading,
      ),
    );
  }
}

class SubscriptionPageContents extends ConsumerWidget {
  const SubscriptionPageContents({
    Key? key,
    this.hasStoreIssue = false,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool hasStoreIssue;
  final bool isPurchasing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Material(
      color: appTheme.scaffoldBackgroundColor,
      child: FormWithOverlay(
        isSaving: isPurchasing,
        child: CustomScrollView(
          physics: isCupertino()
              ? AlwaysScrollableScrollPhysics()
              : ClampingScrollPhysics(),
          slivers: [
            _SubscriptionHeader(),
            _SubscriptionContents(),
            hasStoreIssue
                ? _SubscriptionIssue()
                : _SubscriptionFooter(isPurchasing: isPurchasing),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionHeader extends ConsumerWidget {
  const _SubscriptionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Image.asset(
                "assets/images/logo.png",
                height: 140,
              ),
            ),
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
              child: Text(
                l10n.subscriptionTitle,
                style: PlatformTextStyle.hugeTitle,
                textAlign: TextAlign.center,
              ),
            ),*/
            Text(
              l10n.subscriptionSubtitle,
              style: PlatformTextStyle.smallTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionContents extends ConsumerWidget {
  const _SubscriptionContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SubscriptionTile(
            icon: Icons.school_outlined,
            title: l10n.subscriptionItem1Title,
            subtitle: l10n.subscriptionItem1Subtitle,
          ),
          _SubscriptionTile(
            icon: Icons.volunteer_activism_outlined,
            title: l10n.subscriptionItem2Title,
            subtitle: l10n.subscriptionItem2Subtitle,
          ),
          _SubscriptionTile(
            icon: Icons.share_outlined,
            title: l10n.subscriptionItem3Title,
            subtitle: l10n.subscriptionItem3Subtitle,
          ),
        ],
      ),
    );
  }
}

class _SubscriptionTile extends ConsumerWidget {
  const _SubscriptionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return ListTile(
      dense: true,
      minLeadingWidth: 50,
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      leading: Icon(icon, size: 40, color: appTheme.primaryColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
          letterSpacing: -0.3,
        ),
      ),
    );
  }
}

class _SubscriptionIssue extends ConsumerWidget {
  const _SubscriptionIssue({Key? key}) : super(key: key);

  _getOfferings(WidgetRef ref) {
    _handleEvent(ref, SubscriptionEvent.fetchOfferings());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.subscriptionPriceNotLoaded),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: PlatformElevatedButton(
                title: l10n.errorRetryButton,
                onPressed: () => _getOfferings(ref),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionFooter extends StatelessWidget {
  const _SubscriptionFooter({
    Key? key,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool isPurchasing;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SubscriptionPriceSection(),
            _SubscriptionPurchaseButton(isPurchasing: isPurchasing),
            if (isCupertino()) _SubscriptionCupertinoCaption(),
            _SubscriptionFooterButtons(isPurchasing: isPurchasing),
          ],
        ),
      ),
    );
  }
}

final priceProvider = Provider.autoDispose<String?>(
    (ref) => ref.watch(subscriptionControllerProvider).price);

class _SubscriptionPriceSection extends ConsumerWidget {
  const _SubscriptionPriceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);
    final price = ref.watch(priceProvider);

    return Container(
      height: 65,
      padding: EdgeInsets.only(
        bottom: 20,
        top: 15,
      ),
      child: price != null
          ? Text(
              l10n.subscriptionPrice(price),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
                color: appTheme.primaryColor,
              ),
              textAlign: TextAlign.center,
            )
          : FormLoader(),
    );
  }
}

class _SubscriptionPurchaseButton extends ConsumerWidget {
  const _SubscriptionPurchaseButton({
    Key? key,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool isPurchasing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return SizedBox(
      width: double.infinity,
      child: PlatformElevatedButton(
        title: l10n.subscriptionButton,
        onPressed: isPurchasing
            ? null
            : () => _handleEvent(ref, SubscriptionEvent.purchase()),
      ),
    );
  }
}

class _SubscriptionCupertinoCaption extends ConsumerWidget {
  const _SubscriptionCupertinoCaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        l10n.subscriptionCupertinoCaption,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _SubscriptionFooterButtons extends ConsumerWidget {
  const _SubscriptionFooterButtons({
    Key? key,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool isPurchasing;

  Future<void> _openPrivacyPolicy() async {
    if (await canLaunch(privacyPolicyURL)) {
      await launch(privacyPolicyURL);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlatformTextButton(
              title: l10n.subscriptionPrivacyPolicyButton,
              onPressed: _openPrivacyPolicy),
          PlatformTextButton(
            title: l10n.subscriptionRestoreButton,
            onPressed: isPurchasing
                ? null
                : () => _handleEvent(ref, SubscriptionEvent.restorePurchases()),
          ),
        ],
      ),
    );
  }
}
