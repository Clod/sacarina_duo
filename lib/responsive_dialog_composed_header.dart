// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/interfaces/common_dialog_properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'linear_gauge.dart';

// copied from flutter calendar picker
const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);
const double alturaEncabezado = 130.0;

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ResponsiveDialogLocal extends StatefulWidget implements ICommonDialogProperties {

  ResponsiveDialogLocal({
    required this.context,
    required this.superTitle,
    String? title,
    Widget? child,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.forcePortrait = false,
    double? maxLongSide,
    double? maxShortSide,
    this.hideButtons = false,
    this.okPressed,
    this.cancelPressed,
    this.confirmText,
    this.cancelText,
    this.preText,
    this.selectedItem,
  })  : title = title ?? "Title Here",
        child = child ?? Text("Content Here"),
        maxLongSide = maxLongSide ?? 600,
        maxShortSide = maxShortSide ?? 400;

  // Variables
  final BuildContext context;
  final String superTitle;
  @override
  final String? title;
  final Widget child;
  final bool forcePortrait;
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
  final bool hideButtons;
  @override
  final String? confirmText;
  @override
  final String? cancelText;
  final String? preText;
  var selectedItem;
  // Events
  final VoidCallback? cancelPressed;
  final VoidCallback? okPressed;

  @override
  _ResponsiveDialogLocalState createState() => _ResponsiveDialogLocalState();
}

class _ResponsiveDialogLocalState extends State<ResponsiveDialogLocal> {
  late Color _headerColor;
  late Color? _headerTextColor;
  late Color _backgroundColor;
  late Color? _buttonTextColor;
  bool _showContainer = false;

  @override
  void initState() {
    super.initState();
    _showContainer = widget.preText != null && widget.preText!.isNotEmpty;
    debugPrint(_showContainer.toString());
  }

  Widget header(BuildContext context, Orientation orientation, selectedItem) {
    return Container(
      color: _headerColor,
      height: (orientation == Orientation.portrait) ? alturaEncabezado : null,
      width: (orientation == Orientation.landscape) ? kPickerHeaderLandscapeWidth : null,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.superTitle,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: _headerTextColor,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 12.0,
                color: _headerTextColor,
              ),
            ),
            LinearGauge(height: 10.0, valueToSignal: selectedItem),
          ],
        ),
      ),
      padding: EdgeInsets.all(15.0),
    );
  }

  Widget actionBar(BuildContext context) {
    if (widget.hideButtons) return Container();

    var localizations = MaterialLocalizations.of(context);

    return Container(
      height: kDialogActionBarHeight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: _headerColor),
          ),
        ),
        child: ButtonBar(
          children: <Widget>[
            TextButton(
              child: Text(
                widget.cancelText ?? localizations.cancelButtonLabel,
                style: TextStyle(color: _buttonTextColor),
              ),
              onPressed: () => (widget.cancelPressed == null) ? Navigator.of(context).pop() : widget.cancelPressed!(),
            ),
            TextButton(
              child: Text(
                widget.confirmText ?? localizations.okButtonLabel,
                style: TextStyle(color: _buttonTextColor),
              ),
              onPressed: () => (widget.okPressed == null) ? Navigator.of(context).pop() : widget.okPressed!(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    _headerColor = widget.headerColor ?? theme.primaryColor;
    _headerTextColor = widget.headerTextColor ?? theme.primaryTextTheme.headline6?.color;
    _buttonTextColor = widget.buttonTextColor ?? theme.textTheme.labelLarge?.color;
    // _backgroundColor = widget.backgroundColor ?? theme.dialogBackgroundColor;
    _backgroundColor = Colors.white;

    final Orientation orientation = MediaQuery.of(context).orientation;

    // constrain the dialog from expanding to full screen
    final Size dialogSize =
        (orientation == Orientation.portrait) ? Size(widget.maxShortSide!, widget.maxLongSide!) : Size(widget.maxLongSide!, widget.maxShortSide!);

    return Dialog(
      backgroundColor: _backgroundColor,
      child: AnimatedContainer(
        width: dialogSize.width,
        height: dialogSize.height,
        duration: _dialogSizeAnimationDuration,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (widget.forcePortrait) orientation = Orientation.portrait;
            switch (orientation) {
              case Orientation.portrait:
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AbsorbPointer(
                      absorbing: _showContainer,
                      child: Column(
                        children: <Widget>[
                          header(context, orientation, widget.selectedItem),
                          Expanded(
                            child: Container(
                              child: widget.child,
                            ),
                          ),
                          actionBar(context),
                        ],
                      ),
                    ),
                    if (_showContainer)
                      Container(
                        color: Colors.grey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 100.0,
                                // minHeight: 100.0,
                                maxWidth: dialogSize.width * 0.75,
                                maxHeight: dialogSize.height,
                              ),
                              child: Html(data: widget.preText!),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showContainer = false;
                                });
                              },
                              child: Text(AppLocalizations.of(context)!.txtButtonWarnings),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              case Orientation.landscape:
                return Row(
                  children: <Widget>[
                    header(context, orientation, widget.selectedItem),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: widget.child,
                          ),
                          actionBar(context),
                        ],
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
