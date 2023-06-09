import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:sacarina_duo/help_drawer.dart';
import 'package:sacarina_duo/pretty_gauge.dart';
import 'package:sacarina_duo/show_radio_picker_local.dart';
import 'package:sacarina_duo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model.dart';

// PickerModel selectedDietaOpt = PickerModel('',code: '?');

const initialValue = PickerModel('', code: '?');

bool? showTandC = null;
SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Obtain shared preferences.
  prefs = await SharedPreferences.getInstance();

  showTandC = prefs!.getBool('showTandC');

  debugPrint("Show T&C: " + showTandC.toString());
  // If I could not read it I assume T&C have not veen already accepted
  if (showTandC == null) showTandC = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: buildTheme(Brightness.light),
      dark: buildTheme(Brightness.dark),
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SACARINA',
          theme: theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const MyHomePage(title: 'SACARINA'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var model = Modelo();
  double _promedio = 0;
  bool tcAccepted = false;
  bool _buttonsEnabled = !showTandC!;

  Map<String, PickerModel> pickedValues = {
    "Diet": initialValue,
  };

  // The variable where I keep the chosen option need a setter because I need to modify
  // them inside the onChanged method of armarRowI and Dart does not allow to change
  // the reference to an object passed as parameter

  /*********************** Diet ***********************/

  PickerModel _pickedValueDiet = initialValue;

  setPickedValueDiet(PickerModel value) {
    _pickedValueDiet = value;
  }

  final _dietValues = [100, 70, 30, 15, 0];

  /*********************** Physical Activity ***********************/

  PickerModel _pickedValuePhysicalActivity = initialValue;

  setPickedValuePhysicalActivity(PickerModel value) {
    _pickedValuePhysicalActivity = value;
  }

  final _PhysicalActivityValues = [100, 90, 80, 60, 40, 20, 0];

  PickerModel _pickedValueBodyMassIndex = initialValue;

  /*********************** BMI ***********************/

  setPickedValueBodyMassIndex(PickerModel value) {
    _pickedValueBodyMassIndex = value;
  }

  final _BodyMassIndexValues = [100, 70, 30, 15, 0];

  /*********************** Sleep ***********************/

  PickerModel _pickedValueSleep = initialValue;

  setPickedValueSleep(PickerModel value) {
    _pickedValueSleep = value;
  }

  final _SleepValues = [100, 90, 70, 40, 20, 0];

  /*********************** Smoke exposure ***********************/

  PickerModel _pickedValueSmokeExposure = initialValue;

  setPickedValueSmokeExposure(PickerModel value) {
    _pickedValueSmokeExposure = value;
  }

  final _SmokeExposureValues = [100, 80, 50, 30, 25, 5, 0];

  /*********************** Diabetes ***********************/

  PickerModel _pickedValueDiabetes = initialValue;

  setPickedValueDiabetes(PickerModel value) {
    _pickedValueDiabetes = value;
  }

  final _DiabetesValues = [100, 60, 40, 30, 20, 10, 0];

  /*********************** Blood Pressure ***********************/

  PickerModel _pickedValueBloodPressure = initialValue;

  setPickedValueBloodPressure(PickerModel value) {
    _pickedValueBloodPressure = value;
  }

  final _BloodPressureValues = [100, 80, 75, 55, 50, 30, 25, 5, 0];

  /*********************** Cholesterol ***********************/

  PickerModel _pickedValueCholesterol = initialValue;

  setPickedValueCholesterol(PickerModel value) {
    _pickedValueCholesterol = value;
  }

  final _CholesterolValues = [100, 80, 60, 40, 20, 0];

  /***********************************************************/

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: HelpDrawer(),
      body: showTandC! ? buildTandCwidget(context) : buildMainWidget(context),
    );
  }

  Widget? buildTandCwidget(BuildContext context) {
    buildMainWidget(context);
    Stack st;

    st = Stack(
      alignment: Alignment.center,
      children: [
        buildMainWidget(context),
        Container(
          color: Colors.cyan,
          width: MediaQuery.of(context).size.width * 0.66,
          height: MediaQuery.of(context).size.height * 0.60,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.75 * 0.7,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.txtImportantNotice,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: (MediaQuery.of(context).textScaleFactor) * (DefaultTextStyle.of(context).style.fontSize)!.toInt() * 0.3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.txtReadCarefully,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.txtAppPurpose,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse('https://www.heart.org/en/healthy-living/healthy-lifestyle/lifes-essential-8'));
                        },
                        child: Text(
                          'American Heart Association',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.txtFundamentalsLocation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse('https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.txtLifeEssentialEightObjective,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.txtPaperAuthors,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            // Gracefully quit the app
                            // Según leí, Apple no lo permite pero esto, de alguna manera, lo logra.
                            // FlutterExitApp.exitApp(iosForceExit: true);
                            FlutterExitApp.exitApp();
                          },
                          child: Text(AppLocalizations.of(context)!.txtButtonRejectTandC)),
                      ElevatedButton(
                          onPressed: () {
                            tcAccepted = true;
                            _buttonsEnabled = true;
                            setState(() {});
                          },
                          child: Text(AppLocalizations.of(context)!.txtButtonAcceptTandC)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );

    if (tcAccepted) {
      debugPrint("Intentando remover Dialog");
      prefs!.setBool('showTandC', false);
      st.children.removeAt(1);
      setState(() {});
    }

    return st;
  }

  // Main widget with the actual app
  SafeArea buildMainWidget(BuildContext context) {

    debugPrint("selectedDietaOpt: $_pickedValueDiet");

    SafeArea sa = SafeArea(
      child: Container(
        // color: Colors.black12,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtDietButton,
              Colors.red,
              AppLocalizations.of(context)!.txtDietDialog,
              AppLocalizations.of(context)!.txtDietDialogOptions,
              _dietValues,
              _pickedValueDiet,
              setPickedValueDiet,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtPhysicalActivityButton,
              Colors.red,
              AppLocalizations.of(context)!.txtPhysicalActivityDialog,
              AppLocalizations.of(context)!.txtPhysicalActivityDialogOptions,
              _PhysicalActivityValues,
              _pickedValuePhysicalActivity,
              setPickedValuePhysicalActivity,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtBodyMassIndexButton,
              Colors.red,
              AppLocalizations.of(context)!.txtBodyMassIndexDialog,
              AppLocalizations.of(context)!.txtBodyMassIndexDialogOptions,
              _BodyMassIndexValues,
              _pickedValueBodyMassIndex,
              setPickedValueBodyMassIndex,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtSleepButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtSleepDialog,
              AppLocalizations.of(context)!.txtSleepDialogOptions,
              _SleepValues,
              _pickedValueSleep,
              setPickedValueSleep,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtSmokeExposureButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtSmokeExposureDialog,
              AppLocalizations.of(context)!.txtSmokeExposureDialogOptions,
              _SmokeExposureValues,
              _pickedValueSmokeExposure,
              setPickedValueSmokeExposure,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtDiabetesButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtDiabetesDialog,
              AppLocalizations.of(context)!.txtDiabetesDialogOptions,
              _DiabetesValues,
              _pickedValueDiabetes,
              setPickedValueDiabetes,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtBloodPressureButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtBloodPressureDialog,
              AppLocalizations.of(context)!.txtBloodPressureDialogOptions,
              _BloodPressureValues,
              _pickedValueBloodPressure,
              setPickedValueBloodPressure,
              preText: AppLocalizations.of(context)!.txtBloodPressureWarning,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRowI(
              context,
              AppLocalizations.of(context)!.txtCholesterolButton,
              Colors.blue,
              AppLocalizations.of(context)!.txtCholesterolDialog,
              AppLocalizations.of(context)!.txtCholesterolDialogOptions,
              _CholesterolValues,
              _pickedValueCholesterol,
              setPickedValueCholesterol,
            ),
            const Expanded(child: SizedBox(height: 5)),
            GestureDetector(
              onLongPress: _buttonsEnabled
                  ? () => setState(() {
                        resetValues();
                      })
                  : null,
              child: PrettyGauge(
                gaugeSize: 190,
                // https://meyerweb.com/eric/tools/color-blend/#FFEB3B:4CAF50:3:rgbd
                segments: [
                  GaugeSegment('Low', 10, Colors.red),
                  GaugeSegment('', 10, const Color.fromRGBO(246, 101, 55, 100)),
                  GaugeSegment('', 10, const Color.fromRGBO(248, 134, 56, 100)),
                  GaugeSegment('', 10, const Color.fromRGBO(251, 168, 57, 100)),
                  GaugeSegment('', 10, const Color.fromRGBO(253, 201, 58, 100)),
                  GaugeSegment('Medium High', 10, Colors.yellow),
                  GaugeSegment('', 10, const Color.fromRGBO(210, 220, 64, 100)),
                  GaugeSegment('', 10, const Color.fromRGBO(166, 205, 70, 100)),
                  GaugeSegment('', 10, const Color.fromRGBO(121, 190, 75, 100)),
                  GaugeSegment('High', 10, Colors.green),
                ],
                currentValue: _promedio,
                displayWidget: const Text('Score', style: TextStyle(fontSize: 16)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse('https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
              },
              child: Text(
                AppLocalizations.of(context)!.txtFundamentalsLocationMainWindow,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return sa;
  }

  void resetValues() {
    _pickedValueDiet = initialValue;
    _pickedValuePhysicalActivity = initialValue;
    _pickedValueBodyMassIndex = initialValue;
    _pickedValueSleep = initialValue;
    _pickedValueSmokeExposure = initialValue;
    _pickedValueDiabetes = initialValue;
    _pickedValueBloodPressure = initialValue;
    _pickedValueCholesterol = initialValue;
    _promedio = 0;
  }

  Row armarRowI(
    BuildContext context,
    String textoBoton,
    Color? buttonColor,
    String tituloDialogo,
    String listaOpciones,
    List<int> listaValores,
    PickerModel seleccion,
    setter, {
    String? preText,
  }) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          height: 35.0,
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
            child: Text(
              textoBoton,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
            onPressed: _buttonsEnabled
                ? () {
                    debugPrint("Armando la lista de opciones");
                    debugPrint("Selected: $pickedValues['Diet']");
                    List<String> optionsTexts = listaOpciones.split("|");
                    List<PickerModel> optionsFull = [];
                    for (int i = 0; i < optionsTexts.length; i++) {
                      optionsFull.add(PickerModel(optionsTexts[i], code: listaValores[i]));
                    }
                    ;
                    debugPrint("Indice: " +
                        //optionsFull.indexOf(pickedValues['Diet']!).toString());
                        optionsFull.indexOf(seleccion).toString());
                    // As this is a new list with new objets, the picked value is not included
                    // I need to search for the equivalent object (I search for the same value
                    // because the laguage might have changes in the middle.

                    optionsFull.forEach((element) {
                      if (element.code.toString() == seleccion.code.toString()) {
                        seleccion = element;
                      }
                    });

                    showMaterialRadioPickerLocal<PickerModel>(
                        context: context,
                        superTitle: textoBoton,
                        title: tituloDialogo,
                        items: optionsFull,
                        preText: preText, // Cargarlos todos en un vector in el initState()
                        selectedItem: seleccion,
                        onChanged: (value) {
                          debugPrint("El valor de $textoBoton es $value");
                          setState(() {
                            setter(value);
                          });
                          calcularPromedio(context);
                        });
                  }
                : null,
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0,0.0,0.0,0.0),
                child: Text(
                  '[${seleccion.code}] - $seleccion ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: getColor(seleccion.code.toString()),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void calcularPromedio(BuildContext context) {
    try {
      _promedio = (double.parse(_pickedValueDiet.code.toString()) +
              double.parse(_pickedValuePhysicalActivity.code.toString()) +
              double.parse(_pickedValueBodyMassIndex.code.toString()) +
              double.parse(_pickedValueSleep.code.toString()) +
              double.parse(_pickedValueSmokeExposure.code.toString()) +
              double.parse(_pickedValueDiabetes.code.toString()) +
              double.parse(_pickedValueBloodPressure.code.toString()) +
              double.parse(_pickedValueCholesterol.code.toString())) /
          8.0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.txtLongPressGauge,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
          ),
        ),
      );
    } on FormatException {
      debugPrint("Todavía no están todos los parámetros cargados");
    }
  }
}

Color getColor(String code) {
  if (code == '?') return Colors.black;

  int score = int.parse(code);

  if (score == 0)
    return Colors.red;
  else if (score < 20)
    return Color.fromRGBO(246, 101, 55, 100);
  else if (score < 30)
    return Color.fromRGBO(248, 134, 56, 100);
  else if (score < 40)
    return Color.fromRGBO(251, 168, 57, 100);
  else if (score < 50)
    return Color.fromRGBO(253, 201, 58, 100);
  else if (score < 60)
    return Colors.yellow;
  else if (score < 80)
    return Color.fromRGBO(210, 220, 64, 100);
  else if (score < 90)
    return Color.fromRGBO(166, 205, 70, 100);
  else if (score < 100)
    return Color.fromRGBO(121, 190, 75, 100);
  else if (score == 100)
    return Colors.green;
  else
    return Color.fromRGBO(0, 0, 0, 100);
}
