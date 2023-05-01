import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ItemHelp extends StatelessWidget {
  const ItemHelp({Key? key, required String this.title, required String this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {

    debugPrint("Acá estoy $title");

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
//            AppLocalizations.of(context)!.txtDietButton,
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
//        child: Text(AppLocalizations.of(context)!.txtDietHelp),
        child: Markdown(
//          data: AppLocalizations.of(context)!.txtDietHelp,
          data: content,
          styleSheet: MarkdownStyleSheet.fromTheme(
            ThemeData(
              textTheme: TextTheme(
                bodyMedium: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
