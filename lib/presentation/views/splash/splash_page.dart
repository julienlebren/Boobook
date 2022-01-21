import 'package:boobook/presentation/views/home/home_page.dart';
import 'package:boobook/presentation/views/sign_in/sign_in_page.dart';
import 'package:boobook/providers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/sign_in.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider(userStreamProvider));
    return authState.maybeWhen(
      initializing: () => const ScaffoldLoader(),
      authed: () => const HomePage(),
      orElse: () => const SignInPage(),
    );
  }
}
