import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw Exception('AppLocalizations not found in context');
    }
    return localizations;
  }
}
