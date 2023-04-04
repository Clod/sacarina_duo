import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:sacarina_duo/pretty_gauge.dart';
import 'package:sacarina_duo/show_radio_picker_local.dart';
import 'package:sacarina_duo/theme.dart';
import 'model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
      body: SafeArea(
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
                onLongPress: () => setState(() {
                  resetValues();
                }),
                child: PrettyGauge(
                  gaugeSize: 190,
                  // https://meyerweb.com/eric/tools/color-blend/#FFEB3B:4CAF50:3:rgbd
                  segments: [
                    GaugeSegment('Low', 10, Colors.red),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(246, 101, 55, 100)),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(248, 134, 56, 100)),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(251, 168, 57, 100)),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(253, 201, 58, 100)),
                    GaugeSegment('Medium High', 10, Colors.yellow),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(210, 220, 64, 100)),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(166, 205, 70, 100)),
                    GaugeSegment(
                        '', 10, const Color.fromRGBO(121, 190, 75, 100)),
                    GaugeSegment('High', 10, Colors.green),
                  ],
                  currentValue: _promedio,
                  //currentValue: double.parse('80'),
                  // currentValue: 42,
                  displayWidget:
                      const Text('Score', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            onPressed: () => showMaterialRadioPickerLocal<PickerModel>(
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
                ),
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
