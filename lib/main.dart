import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:sacarina_duo/pretty_gauge.dart';
import 'package:sacarina_duo/show_radio_picker_local.dart';
import 'package:sacarina_duo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model.dart';

final String tcText =
    "This app calculates the estimated cardiovascular health score as defined by the American Heart Association. It may be used by physicians and parents of children. However, it is important to note that for parents, this score is ONLY ORIENTATIVE and should not replace a proper evaluation of cardiovascular health by a pediatrician. \n ";

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

  @override
  initState() {
    super.initState();
    //  _buttonsEnabled = !showTandC!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      //body: buildMainWidget(context), // Anda
      // body: buildTandCwidget(context), // Anda
      // body: () {return SafeArea(child: Text("Algo"));}(),  // Anda
      body: showTandC! ? buildTandCwidget(context) : buildMainWidget(context),
      //
    );
  }

  Widget? buildTandCwidget(BuildContext context) {
    buildMainWidget(context);
    Color? buttonColor;
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
                          "IMPORTANT NOTICE",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: (MediaQuery.of(context)
                                      .textScaleFactor) *
                                  (DefaultTextStyle.of(context).style.fontSize)!
                                      .toInt() *
                                  0.3,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Please read carefully before using this app",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "This app calculates the estimated cardiovascular health score as defined by the",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        //Text(tcText),
                        GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                'https://www.heart.org/en/healthy-living/healthy-lifestyle/lifes-essential-8'));
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
                          "The scoring system and criteria are thoroughly explained in:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                'https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
                          },
                          child: Text(
                            'Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct of Cardiovascular Health: A Presidential Advisory From the American Heart Association',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Text(
                          "Published by: Donald M. Lloyd-Jones, MD, ScM, FAHA, Chair; Norrina B. Allen, PhD, MPH, FAHA; Cheryl A.M. Anderson, PhD, MPH, MS, FAHA; Terrie Black, DNP, MBA, CRRN, FAHA; LaPrincess C. Brewer, MD, MPH; Randi E. Foraker, PhD, MA, FAHA; Michael A. Grandner, PhD, MTR, FAHA; Helen Lavretsky, MD, MS; Amanda Marma Perak, MD, MS, FAHA; Garima Sharma, MD; Wayne Rosamond, PhD, MS, FAHA; on behalf of the American Heart Association",
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
                              debugPrint("Cancelando...");
                              // Gracefully quit the app
                              // Según leí, Apple no lo permite pero esto, de alguna manera, lo logra.
                              // FlutterExitApp.exitApp(iosForceExit: true);
                              FlutterExitApp.exitApp();
                            },
                            child: Text('Cancel')),
                        ElevatedButton(
                            onPressed: () {
                              debugPrint("T&C Aceptados");
                              tcAccepted = true;
                              _buttonsEnabled = true;
                              setState(() {});
                            },
                            child: Text('Accept')),
                      ],
                    ),
                  ),
                )
              ],
            ))
      ],
    );

    if (tcAccepted) {
      debugPrint("Intentando remover Dialog");
      prefs!.setBool('showTandC', false);
      st.children!.removeAt(1);
      setState(() {});
    }
    return st;
    // setState(() {});
  }

  // Main widget with the actual app
  SafeArea buildMainWidget(BuildContext context) {
    SafeArea sa = SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            armarRow(
              context,
              model.botonDieta,
              Colors.red,
              model.tituloDieta,
              Modelo.dieta,
              model.selecDieta,
              model.setSelectedDieta,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
                context,
                model.botonActividadFisica,
                Colors.red,
                model.tituloActividadFisica,
                Modelo.actividadFisica,
                model.selecActividadFisica,
                model.setActividadFisica),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
                context,
                model.botonMasaCorporal,
                Colors.red,
                model.tituloMasaCorporal,
                Modelo.masaCorporal,
                model.selecMasaCorporal,
                model.setMasaCorporal),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
              context,
              model.botonSueno,
              Colors.red,
              model.tituloSueno,
              Modelo.sueno,
              model.selecSueno,
              model.setSueno,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
              context,
              model.botonFumar,
              Colors.blue,
              model.tituloFumar,
              Modelo.fumar,
              model.selecFumar,
              model.setFumar,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
              context,
              model.botonDiabetes,
              Colors.blue,
              model.tituloDiabetes,
              Modelo.diabetes,
              model.selecDiabetes,
              model.setDiabetes,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
              context,
              model.botonPresionArterial,
              Colors.blue,
              model.tituloPresionArterial,
              Modelo.presionArterial,
              model.selecPresionArterial,
              model.setPresionArterial,
            ),
            const Expanded(child: SizedBox(height: 5)),
            armarRow(
              context,
              model.botonColesterol,
              Colors.blue,
              model.tituloColesterol,
              Modelo.colesterol,
              model.selecColesterol,
              model.setColesterol,
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
                //currentValue: double.parse('80'),
                // currentValue: 42,
                displayWidget:
                    const Text('Score', style: TextStyle(fontSize: 16)),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(
                    'https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
              },
              child: Text(
                'Click here to read the foundations of the calculation',
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

//    buildTandCwidget(Scaffold.of(context).context);

    return sa;
  }

  void resetValues() {
    model.setSelectedDieta(Modelo.valorInicial);
    model.setActividadFisica(Modelo.valorInicial);
    model.setMasaCorporal(Modelo.valorInicial);
    model.setSueno(Modelo.valorInicial);
    model.setFumar(Modelo.valorInicial);
    model.setDiabetes(Modelo.valorInicial);
    model.setPresionArterial(Modelo.valorInicial);
    model.setColesterol(Modelo.valorInicial);
    _promedio = 0;
  }

  Row armarRow(
    BuildContext context,
    String textoBoton,
    Color? buttonColor,
    String tituloDialogo,
    List<PickerModel> listaOpciones,
    PickerModel seleccion,
    setter,
  ) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 150.0,
          height: 35.0,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor)),
            child: Text(
              textoBoton,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
            onPressed: _buttonsEnabled
                ? () => showMaterialRadioPickerLocal<PickerModel>(
                    context: context,
                    superTitle: textoBoton,
                    title: tituloDialogo,
                    items: listaOpciones,
                    selectedItem: seleccion,
                    onChanged: (value) {
                      debugPrint("El valor de $textoBoton es $value");
                      // setState(() => seleccion = value);
                      setState(() => setter(value));
                      calcularPromedio(context);
                    }
/*
              onChanged: (value) =>
                  setState(() => model.selectedUsState = value),
*/
                    )
                : null,
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            child: SingleChildScrollView(
              child: Text(
                '$seleccion (${seleccion.code})',
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void calcularPromedio(BuildContext context) {
    try {
      _promedio = (double.parse(model.selecActividadFisica.code.toString()) +
              double.parse(model.selecDieta.code.toString()) +
              double.parse(model.selecMasaCorporal.code.toString()) +
              double.parse(model.selecSueno.code.toString()) +
              double.parse(model.selecFumar.code.toString()) +
              double.parse(model.selecDiabetes.code.toString()) +
              double.parse(model.selecPresionArterial.code.toString()) +
              double.parse(model.selecColesterol.code.toString())) /
          8.0;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Long press the gauge to reset all values.",
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
