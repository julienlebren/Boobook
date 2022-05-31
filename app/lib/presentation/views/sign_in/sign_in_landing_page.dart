import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

final _signInThemeProvider = Provider<SignInTheme>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  final formTheme = ref.watch(formThemeProvider);

  return SignInTheme(
    backgroundImage: "assets/images/background2.png",
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    textColor: appTheme.textColor,
    buttonBackgroundColor: formTheme.rowBackgroundColor,
    buttonTextColor: appTheme.textColor,
    borderColor: appTheme.borderColor,
    dividerColor: appTheme.dividerColor,
  );
});

class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInLandingPageBuilder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          const SignInLandingLogo(),
          const Spacer(),
          const SignInButtons(),
        ],
      ),
    );
  }
}

class SignInLandingLogo extends ConsumerWidget {
  const SignInLandingLogo({Key? key}) : super(key: key);

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
