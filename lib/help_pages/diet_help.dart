import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DietHelp extends StatelessWidget {
  const DietHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return Center(child:Text(AppLocalizations.of(context)!.txtDietHelp));
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Hola",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Text(AppLocalizations.of(context)!.txtDietHelp),
    );
  }
}
