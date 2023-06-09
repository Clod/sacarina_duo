import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness brightness) {
  var theme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: brightness,
  ); // app background color

  // extract auto generated colors
  Color primaryColor = theme.primaryColor;
  Color backgroundColor = theme.colorScheme.background;
  Color accentColor = theme.colorScheme.secondary;
  Color textColor = theme.textTheme.displayLarge!.color!;
  Color headerTextColor = textColor;

  // override colors for light themes
  if (brightness == Brightness.light) {
    backgroundColor = Colors.blue[100]!;
    primaryColor = Colors.blue;
    accentColor = Colors.blue[900]!;
  //  textColor = Colors.green[700]!; // Textos en los Dialor y en el final de las Rows
    textColor = Colors.black54; // Textos en los Dialogs y en el final de las Rows
    headerTextColor = Colors.lightGreen[50]!; // Header de los Dialogs
  }

  theme = theme.copyWith(
    primaryColor: primaryColor,
    dialogBackgroundColor: backgroundColor, // background color of the dialog
    primaryTextTheme: theme.primaryTextTheme.copyWith(
      titleLarge: theme.primaryTextTheme.titleLarge?.copyWith(
        color: headerTextColor, // text color of the header area
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        color: Colors.blue[900], // text color of dialog text
      ),
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        color: textColor, // text color of dialog text
      ),
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        color: textColor, // text color of the action bar buttons v.gr. Cancel y OK
      ),
    ),
    timePickerTheme: theme.timePickerTheme.copyWith(
      backgroundColor: backgroundColor,
    ), colorScheme: theme.colorScheme.copyWith(
      primary: primaryColor, // new way to do title color
      surface: backgroundColor, // new way to do background color
      secondary: accentColor, // color of controls and button bar text
    ).copyWith(background: backgroundColor),
  );

  return theme;
}
