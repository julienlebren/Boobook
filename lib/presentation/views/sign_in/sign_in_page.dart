import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final appTheme = ref.watch(appThemeProvider);

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
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
                Spacer(),
                SignInButtons(
                  theme: SignInTheme(
                    buttonBackgroundColor: appTheme.listTileBackground,
                    buttonTextColor: appTheme.textColor,
                  ),
                  l10n: SignInLocalizations(
                    signInAnonymously: l10n.signInAnonymously,
                    signInWithApple: l10n.signInWithApple,
                    signInWithFacebook: l10n.signInWithFacebook,
                    signInWithGoogle: l10n.signInWithGoogle,
                    errorTitle: l10n.errorTitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
