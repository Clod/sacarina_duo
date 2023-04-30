import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sacarina_duo/help_pages/diet_help.dart';

// https://blog.logrocket.com/how-to-add-navigation-drawer-flutter/
class HelpDrawer extends StatelessWidget {
  const HelpDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(AppLocalizations.of(context)!.txtGlossary),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.txtDietButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DietHelp(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
