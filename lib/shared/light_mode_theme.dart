import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LightModeTheme {
  static LightModeTheme of(BuildContext context) {
    return LightModeTheme();
  }
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF14181B);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color mainColorTCMS = const Color(0xFF0C93C3);
  late Color tCMSPalette1 = const Color(0xFF3B8CDE);
  late Color tCMSPalette2 = const Color(0xFF195DA2);
  late Color tCMSPalette3 = const Color(0xFF406E9B);
  late Color tCMSPalette4 = const Color(0xFF07396B);
  late Color tCMSPalette5 = const Color(0xFF85B7E9);
  late Color mainSentinelColor = const Color(0xFF00268E);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final LightModeTheme theme;

  @override
  String get displayLargeFamily => 'Outfit';
  @override
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  @override
  String get displayMediumFamily => 'Outfit';
  @override
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  @override
  String get displaySmallFamily => 'Outfit';
  @override
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  @override
  String get headlineLargeFamily => 'Outfit';
  @override
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  @override
  String get headlineMediumFamily => 'Outfit';
  @override
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  @override
  String get headlineSmallFamily => 'Outfit';
  @override
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  @override
  String get titleLargeFamily => 'Outfit';
  @override
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  @override
  String get titleMediumFamily => 'Readex Pro';
  @override
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  @override
  String get titleSmallFamily => 'Readex Pro';
  @override
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  @override
  String get labelLargeFamily => 'Readex Pro';
  @override
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  @override
  String get labelMediumFamily => 'Readex Pro';
  @override
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  @override
  String get labelSmallFamily => 'Readex Pro';
  @override
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  @override
  String get bodyLargeFamily => 'Readex Pro';
  @override
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  @override
  String get bodyMediumFamily => 'Readex Pro';
  @override
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  @override
  String get bodySmallFamily => 'Readex Pro';
  @override
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}