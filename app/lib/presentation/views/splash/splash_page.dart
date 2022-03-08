import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/views/home/home_page.dart';
import 'package:boobook/presentation/views/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authSettings = ref.watch(boobookAuthSettingsProvider);
    final authState = ref.watch(authStateProvider(authSettings));
    print("authState: $authState");
    return authState.maybeWhen(
      initializing: () => const ScaffoldLoader(),
      authed: (_) => const HomePage(),
      orElse: () => const SignInPage(),
    );
  }
}
