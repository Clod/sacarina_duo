import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sacarina_duo/help_pages/item_help.dart';

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
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.txtGlossary,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(AppLocalizations.of(context)!.txtDietButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemHelp(title: AppLocalizations.of(context)!.txtDietButton, content: AppLocalizations.of(context)!.txtDietHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.monitor_weight),
            title: Text(AppLocalizations.of(context)!.txtBodyMassIndexButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemHelp(
                      title: AppLocalizations.of(context)!.txtBodyMassIndexButton, content: AppLocalizations.of(context)!.txtBodyMassIndextHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.smoking_rooms),
            title: Text(AppLocalizations.of(context)!.txtSmokeExposureButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemHelp(
                      title: AppLocalizations.of(context)!.txtSmokeExposureButton, content: AppLocalizations.of(context)!.txtSmokeExposureHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.icecream),
            title: Text(AppLocalizations.of(context)!.txtDiabetesButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemHelp(title: AppLocalizations.of(context)!.txtDiabetesButton, content: AppLocalizations.of(context)!.txtDiabetesHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(AppLocalizations.of(context)!.txtBloodPressureButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemHelp(
                      title: AppLocalizations.of(context)!.txtBloodPressureButton, content: AppLocalizations.of(context)!.txtBloodPressureHelp),
                ),
              );
            },
          ),
          AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            child: Text('About this app'),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'SACARINA',
            applicationVersion: '2.0.0',
            applicationLegalese: 'This app is Freeware and Open Source',
            aboutBoxChildren: [
              SizedBox(height: 5.0,),
              SizedBox(
                  height: 300.0,
                  width: 150.0,
                  child: SingleChildScrollView(
                    child: Html(
                        data:
                        AppLocalizations.of(context)!.txtAbout),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
