import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284244765),
      surfaceTint: Color(4284244765),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292995476),
      onPrimaryContainer: Color(4279901440),
      secondary: Color(4284375108),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293191105),
      onSecondaryContainer: Color(4279966983),
      tertiary: Color(4282148442),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290702556),
      onTertiaryContainer: Color(4278198297),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294769388),
      onBackground: Color(4280032276),
      surface: Color(4294769388),
      onSurface: Color(4280032276),
      surfaceVariant: Color(4293256146),
      onSurfaceVariant: Color(4282861627),
      outline: Color(4286085225),
      outlineVariant: Color(4291348407),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inverseOnSurface: Color(4294177252),
      inversePrimary: Color(4291153274),
      primaryFixed: Color(4292995476),
      onPrimaryFixed: Color(4279901440),
      primaryFixedDim: Color(4291153274),
      onPrimaryFixedVariant: Color(4282665732),
      secondaryFixed: Color(4293191105),
      onSecondaryFixed: Color(4279966983),
      secondaryFixedDim: Color(4291283366),
      onSecondaryFixedVariant: Color(4282796334),
      tertiaryFixed: Color(4290702556),
      onTertiaryFixed: Color(4278198297),
      tertiaryFixedDim: Color(4288860353),
      onTertiaryFixedVariant: Color(4280503875),
      surfaceDim: Color(4292664014),
      surfaceBright: Color(4294769388),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374631),
      surfaceContainer: Color(4293979873),
      surfaceContainerHigh: Color(4293650652),
      surfaceContainerHighest: Color(4293256150),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282468096),
      surfaceTint: Color(4284244765),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285692209),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282533163),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285888345),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280240703),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283596144),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294769388),
      onBackground: Color(4280032276),
      surface: Color(4294769388),
      onSurface: Color(4280032276),
      surfaceVariant: Color(4293256146),
      onSurfaceVariant: Color(4282598455),
      outline: Color(4284506194),
      outlineVariant: Color(4286348397),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inverseOnSurface: Color(4294177252),
      inversePrimary: Color(4291153274),
      primaryFixed: Color(4285692209),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284112922),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285888345),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284243522),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283596144),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281951319),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292664014),
      surfaceBright: Color(4294769388),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374631),
      surfaceContainer: Color(4293979873),
      surfaceContainerHigh: Color(4293650652),
      surfaceContainerHighest: Color(4293256150),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280361984),
      surfaceTint: Color(4284244765),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282468096),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280427533),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282533163),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200351),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280240703),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294769388),
      onBackground: Color(4280032276),
      surface: Color(4294769388),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293256146),
      onSurfaceVariant: Color(4280558874),
      outline: Color(4282598455),
      outlineVariant: Color(4282598455),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293653404),
      primaryFixed: Color(4282468096),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281020160),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282533163),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281085462),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280240703),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278334249),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292664014),
      surfaceBright: Color(4294769388),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374631),
      surfaceContainer: Color(4293979873),
      surfaceContainerHigh: Color(4293650652),
      surfaceContainerHighest: Color(4293256150),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291153274),
      surfaceTint: Color(4291153274),
      onPrimary: Color(4281283328),
      primaryContainer: Color(4282665732),
      onPrimaryContainer: Color(4292995476),
      secondary: Color(4291283366),
      onSecondary: Color(4281348634),
      secondaryContainer: Color(4282796334),
      onSecondaryContainer: Color(4293191105),
      tertiary: Color(4288860353),
      onTertiary: Color(4278662957),
      tertiaryContainer: Color(4280503875),
      onTertiaryContainer: Color(4290702556),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279440396),
      onBackground: Color(4293256150),
      surface: Color(4279440396),
      onSurface: Color(4293256150),
      surfaceVariant: Color(4282861627),
      onSurfaceVariant: Color(4291348407),
      outline: Color(4287795842),
      outlineVariant: Color(4282861627),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256150),
      inverseOnSurface: Color(4281413928),
      inversePrimary: Color(4284244765),
      primaryFixed: Color(4292995476),
      onPrimaryFixed: Color(4279901440),
      primaryFixedDim: Color(4291153274),
      onPrimaryFixedVariant: Color(4282665732),
      secondaryFixed: Color(4293191105),
      onSecondaryFixed: Color(4279966983),
      secondaryFixedDim: Color(4291283366),
      onSecondaryFixedVariant: Color(4282796334),
      tertiaryFixed: Color(4290702556),
      onTertiaryFixed: Color(4278198297),
      tertiaryFixedDim: Color(4288860353),
      onTertiaryFixedVariant: Color(4280503875),
      surfaceDim: Color(4279440396),
      surfaceBright: Color(4282006065),
      surfaceContainerLowest: Color(4279111432),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4280953378),
      surfaceContainerHighest: Color(4281677101),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291416446),
      surfaceTint: Color(4291153274),
      onPrimary: Color(4279572480),
      primaryContainer: Color(4287600202),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291612074),
      onSecondary: Color(4279638019),
      secondaryContainer: Color(4287730547),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289189061),
      onTertiary: Color(4278197012),
      tertiaryContainer: Color(4285438604),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279440396),
      onBackground: Color(4293256150),
      surface: Color(4279440396),
      onSurface: Color(4294835182),
      surfaceVariant: Color(4282861627),
      onSurfaceVariant: Color(4291677115),
      outline: Color(4288980116),
      outlineVariant: Color(4286874741),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256150),
      inverseOnSurface: Color(4280953634),
      inversePrimary: Color(4282797061),
      primaryFixed: Color(4292995476),
      onPrimaryFixed: Color(4279243520),
      primaryFixedDim: Color(4291153274),
      onPrimaryFixedVariant: Color(4281612544),
      secondaryFixed: Color(4293191105),
      onSecondaryFixed: Color(4279243265),
      secondaryFixedDim: Color(4291283366),
      onSecondaryFixedVariant: Color(4281743391),
      tertiaryFixed: Color(4290702556),
      onTertiaryFixed: Color(4278195471),
      tertiaryFixedDim: Color(4288860353),
      onTertiaryFixedVariant: Color(4279188786),
      surfaceDim: Color(4279440396),
      surfaceBright: Color(4282006065),
      surfaceContainerLowest: Color(4279111432),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4280953378),
      surfaceContainerHighest: Color(4281677101),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294705094),
      surfaceTint: Color(4291153274),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291416446),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294770136),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291612074),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293722103),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289189061),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279440396),
      onBackground: Color(4293256150),
      surface: Color(4279440396),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282861627),
      onSurfaceVariant: Color(4294835178),
      outline: Color(4291677115),
      outlineVariant: Color(4291677115),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256150),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280823040),
      primaryFixed: Color(4293258647),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291416446),
      onPrimaryFixedVariant: Color(4279572480),
      secondaryFixed: Color(4293454277),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291612074),
      onSecondaryFixedVariant: Color(4279638019),
      tertiaryFixed: Color(4290965985),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289189061),
      onTertiaryFixedVariant: Color(4278197012),
      surfaceDim: Color(4279440396),
      surfaceBright: Color(4282006065),
      surfaceContainerLowest: Color(4279111432),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4280953378),
      surfaceContainerHighest: Color(4281677101),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
