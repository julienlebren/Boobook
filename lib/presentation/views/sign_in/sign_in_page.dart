import 'package:boobook/controllers/sign_in_controller.dart';
import 'package:boobook/providers/common.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInController(service);
});

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final state = ref.watch(signInControllerProvider);
    final appTheme = ref.watch(appThemeProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    ref.listen<SignInState>(signInControllerProvider, (_, state) {
      state.maybeWhen(
        error: (errorText) {
          showErrorDialog(
            context,
            ref,
            title: l10n.errorTitle,
            content: errorText,
          );
        },
        orElse: () => null,
      );
    });

    return PlatformScaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                GestureDetector(
                  onTap: () {
                    ref.read(signInControllerProvider.notifier).signOut();
                  },
                  child: Image.asset("assets/images/logo.png", width: 160),
                ),
                SizedBox(height: 12),
                Text(
                  "boobook",
                  style: TextStyle(
                    fontFamily: "AristotelicaSmallCaps",
                    fontSize: 56.0,
                    color: appTheme.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  l10n.signInSubtitle,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: appTheme.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Container(
                  height: isCupertino() ? 260 : 200,
                  child: isLoading
                      ? Loader(
                          delayBeforeDisplay: 0,
                        )
                      : SignInPageButtons(),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInPageButtons extends ConsumerWidget {
  const SignInPageButtons({Key? key}) : super(key: key);

  void _handleEvent(WidgetRef ref, SignInEvent event) {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.handleEvent(event);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isCupertino()) ...[
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: SizedBox(
              width: double.infinity,
              child: PlatformSocialButton(
                icon: SizedBox(
                  width: 30 * (25 / 31),
                  height: 30,
                  child: CustomPaint(
                    painter: AppleLogoPainter(
                      color: appTheme.textColor,
                    ),
                  ),
                ),
                title: l10n.signInWithApple,
                color: appTheme.listTileBackground,
                textColor: appTheme.textColor,
                onPressed: () =>
                    _handleEvent(ref, SignInEvent.signInWithApple()),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
        Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: SizedBox(
            child: PlatformSocialButton(
              assetName: "assets/images/google-logo.png",
              title: l10n.signInWithGoogle,
              color: appTheme.listTileBackground,
              textColor: appTheme.textColor,
              onPressed: () =>
                  _handleEvent(ref, SignInEvent.signInWithGoogle()),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: SizedBox(
            width: double.infinity,
            child: PlatformSocialButton(
              assetName: "assets/images/facebook-logo.png",
              title: l10n.signInWithFacebook,
              color: appTheme.listTileBackground,
              textColor: appTheme.textColor,
              onPressed: () =>
                  _handleEvent(ref, SignInEvent.signInWithFacebook()),
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: PlatformTextButton(
            title: l10n.signInAnonymously,
            onPressed: () => _handleEvent(ref, SignInEvent.signInAnonymously()),
            color: appTheme.textColor,
          ),
        ),
      ],
    );
  }
}
