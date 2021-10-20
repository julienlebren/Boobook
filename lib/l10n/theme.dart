import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final themeLocalizationProvider =
    Provider.family<ThemeLocalizations, AppLocalizations>(
  (_, l10n) => ThemeLocalizations(
    dark: l10n.themeDark,
    light: l10n.themeLight,
    system: l10n.themeSystem,
  ),
);
