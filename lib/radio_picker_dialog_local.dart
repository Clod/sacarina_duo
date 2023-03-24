// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_material_pickers/interfaces/common_dialog_properties.dart';
import 'package:flutter_material_pickers/pickers/radio_picker.dart';
import 'package:sacarina_duo/responsive_dialog_composed_header.dart';

// import '../flutter_material_pickers.dart';
// import '../interfaces/common_dialog_properties.dart';
// import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class RadioPickerDialogLocal<T> extends StatefulWidget
    implements ICommonDialogProperties {
  RadioPickerDialogLocal({
    required this.superTitle,
    this.title,
    required this.items,
    this.selectedItem,
    this.transformer,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.confirmText,
    this.cancelText,
  });

  // Variables
  final List<T> items;
  final T? selectedItem;
  final Transformer<T>? transformer;
  final String superTitle;
  @override
  final String? title;
  @override
  final Color? headerColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? buttonTextColor;
  @override
  final double? maxLongSide;
  @override
  final double? maxShortSide;
  @override
  final String? confirmText;
  @override
  final String? cancelText;

  @override
  State<RadioPickerDialogLocal> createState() =>
      _RadioPickerDialogLocalState<T>(selectedItem);
}

class _RadioPickerDialogLocalState<T> extends State<RadioPickerDialogLocal<T>> {
  _RadioPickerDialogLocalState(this.selectedItem);

  T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return ResponsiveDialogLocal(
      context: context,
      superTitle: widget.superTitle,
      title: widget.title,
      headerColor: widget.headerColor,
      headerTextColor: widget.headerTextColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      maxLongSide: widget.maxLongSide,
      maxShortSide: widget.maxLongSide,
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: RadioPicker<T>(
        items: widget.items,
        initialValue: selectedItem,
        onChanged: (item) => setState(() => selectedItem = item),
        transformer: widget.transformer,
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}
