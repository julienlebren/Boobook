import 'package:boobook/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    return SignInPageBuilder2(
      theme: SignInTheme(
        buttonBackgroundColor: formTheme.rowBackgroundColor,
        buttonTextColor: appTheme.textColor,
      ),
      child: _SignInLandingPage(),
    );
  }
}

class _SignInLandingPage extends StatelessWidget {
  const _SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInLandingPage(
      backgroundImage: "assets/images/background2.png",
      logo: const _SignInLandingLogo(),
      buttons: SignInButtons([
        SignInSupplier.apple,
        SignInSupplier.google,
        SignInSupplier.emailLink,
        SignInSupplier.anonymous,
      ]),
    );
  }
}

class _SignInLandingLogo extends ConsumerWidget {
  const _SignInLandingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final l10n = ref.watch(localizationProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/logo.png", width: 160),
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
      ],
    );
  }
}
