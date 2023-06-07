// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:flutter_material_pickers/dialogs/radio_picker_dialog.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:sacarina_duo/radio_picker_dialog_local.dart';

/// Allows selection of a single from a radio list
Future<T?> showMaterialRadioPickerLocal<T>({
  required BuildContext context,

  required String superTitle,

  /// The title for the dialog box
  String? title,

  /// The list of items to use with the picker
  required List<T> items,

  /// The item that will be initially selected
  T? selectedItem,

  /// The dialog header color (overrides theme)
  Color? headerColor,

  /// The dialog header text color (overrides theme)
  Color? headerTextColor,

  /// The dialog background color (overrides theme)
  Color? backgroundColor,

  /// The button text color (overrides theme)
  Color? buttonTextColor,

  /// Text to display in the confirm button
  String? confirmText,

  /// Text to display in the cancel button
  String? cancelText,

  /// Used to restrict how tall the dialog can be.
  double? maxLongSide,

  /// Used to restrict how wide the dialog can be.
  double? maxShortSide,

  /// Function that gets called when the value is changed
  ValueChanged<T>? onChanged,

  /// Function that gets called when the confirm button is pressed
  VoidCallback? onConfirmed,

  /// Function that gets called when the cancel button is pressed
  VoidCallback? onCancelled,

  /// Function that is called when each items renders which can be used to transform the content
  /// This is helpful, for example, to provide translations to other languages
  Transformer<T>? transformer,

  String? preText,

}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {

      return RadioPickerDialogLocal<T>(
        items: items,
        superTitle: superTitle,
        title: title,
        selectedItem: selectedItem,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
        transformer: transformer,
        preText: preText,
      );
    },
  ).then((selection) {
    if (selection != null) {
      onChanged?.call(selection);
      onConfirmed?.call();
    } else {
      onCancelled?.call();
    }
    return selection;
  });
}
