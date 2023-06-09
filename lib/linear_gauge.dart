import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class LinearGauge extends StatefulWidget {
  double height;

  var valueToSignal;

  LinearGauge({
    super.key,
    required double this.height,
    required this.valueToSignal,
  });

  @override
  State<LinearGauge> createState() => _LinearGaugeState();
}

class _LinearGaugeState extends State<LinearGauge> {
  @override
  Widget build(BuildContext context) {
    PickerModel valor = widget.valueToSignal as PickerModel;
    debugPrint(valor.code.toString());
    List<bool> mostrar = List<bool>.filled(11, false);

    if (widget.valueToSignal != null && valor.code.toString() != '?') {
      if (int.parse(valor.code.toString()) == 0) {
        mostrar[0] = true;
      } else if (int.parse(valor.code.toString()) <= 10) {
        mostrar[1] = true;
      } else if (int.parse(valor.code.toString()) <= 20) {
        mostrar[2] = true;
      } else if (int.parse(valor.code.toString()) <= 30) {
        mostrar[3] = true;
      } else if (int.parse(valor.code.toString()) <= 40) {
        mostrar[4] = true;
      } else if (int.parse(valor.code.toString()) <= 50) {
        mostrar[5] = true;
      } else if (int.parse(valor.code.toString()) <= 60) {
        mostrar[6] = true;
      } else if (int.parse(valor.code.toString()) <= 70) {
        mostrar[7] = true;
      } else if (int.parse(valor.code.toString()) <= 80) {
        mostrar[8] = true;
      } else if (int.parse(valor.code.toString()) <= 90) {
        mostrar[9] = true;
      } else if (int.parse(valor.code.toString()) == 100) {
        mostrar[10] = true;
      }
    }

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(246, 101, 55, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(248, 134, 56, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(251, 168, 57, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(253, 201, 58, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(210, 220, 64, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(182, 215, 64, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(155, 210, 65, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(121, 190, 75, 1.0),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.blueAccent,
                  child: Visibility(
                    visible: mostrar[0],
                    child: Icon(Icons.keyboard_double_arrow_up),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[1],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[2],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[3],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[4],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[5],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[6],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[7],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[8],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[9],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: mostrar[10],
                  child: Icon(Icons.keyboard_double_arrow_up),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
