// example viewmodel for the form
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class Modelo {

  static const valorInicial = PickerModel('',code: '?');
  // Scroll/Radio Picker Model
  // Scroll/Radio Picker Model
  /*
  static const List<PickerModel> state = <PickerModel>[
    PickerModel('Opción 1', code: 'AL'),
    PickerModel('Opción 2', code: 'AK'),
    PickerModel('Opción 3', code: 'AZ'),
    PickerModel('Opción 4', code: 'AR'),
    PickerModel('Opción 5', code: 'CA'),
    PickerModel('Opción 6', code: 'CO'),
    PickerModel('Opción 7', code: 'CT'),
  ];
  // PickerModel selectedUsState = state[0];

  PickerModel selectedUsState =   valorInicial;

   */

  static const List<PickerModel> dieta = <PickerModel>[
    PickerModel('9-10 MEPA score points', code: 100.0),
    PickerModel('7-8 MEPA score points', code: 70.0),
    PickerModel('5-6 MEPA score points', code: 30.0),
    PickerModel('3-4 MEPA score points', code: 15.0),
    PickerModel('0-2 MEPA score points', code: 0.0),
  ];
  PickerModel selecDieta = valorInicial;
  // PickerModel selecDieta = PickerModel('algo', code: 33.0);
  String botonDieta = "Diet";
  // String tituloDieta = "Ingesta diaria informada estilo DASH (Dietary Approaches to Stop Hypertension)";
  // Healthy Eating Index
  // The two tables provide scoring criteria for assessing the adherence of individuals aged 2-19 years to specific dietary patterns: DASH-style diet adherence, Healthy Eating Index 2015 (HEI-2015), and Moderate-to-Vigorous Physical Activity (MEPA)
  String tituloDieta = "Quantiles of DASH-style diet adherence MEPA. Ages 2-19 y.';";
  setSelectedDieta(PickerModel sd) {
    selecDieta = sd;
  }

  static const List<PickerModel> masaCorporal = <PickerModel>[
    PickerModel('5th - < 85th percentile', code: 100.0),
    PickerModel('85th - < 95th', code: 70.0),
    PickerModel('95th percentile - < 120% of the 95th percentile', code: 30.0),
    PickerModel('120% of the 95th - < 140% of the 95th percentile', code: 15.0),
    PickerModel('≥ 140% of the 95th percentile', code: 0.0),
  ];
  PickerModel selecMasaCorporal = valorInicial;
  // PickerModel selecMasaCorporal = const PickerModel('algo', code: '22.0');
  String botonMasaCorporal = "BMI";
  String tituloMasaCorporal = "BMI percentiles for age and sex, starting in infancy.";
  setMasaCorporal(PickerModel mc) {
    selecMasaCorporal = mc;
  }

  // Actividad física
  static const List<PickerModel> actividadFisica = <PickerModel>[
    PickerModel('≥ 420 minutes', code: 100.0),
    PickerModel('360 - 419 minutes', code: 90.0),
    PickerModel('300 - 359 minutes', code: 80.0),
    PickerModel('240 - 299 minutes', code: 60.0),
    PickerModel('120 - 239 minutes', code: 40.0),
    PickerModel('1 - 119 minutes', code: 20.0),
    PickerModel('No activity', code: 0.0),
  ];
  PickerModel selecActividadFisica = valorInicial;
  String botonActividadFisica = "Physical Activity";
  String tituloActividadFisica = "Minutes of moderate or greater intensity activity per week. Ages: 6 to 9 ";
  // String tituloActividadFisica = "Minutos semanales de actividad física";
  setActividadFisica(PickerModel af) {
    selecActividadFisica = af;
  }
  // Fin actividad física

  // Sueño
  static const List<PickerModel> sueno = <PickerModel>[
    PickerModel('Age-appropriate optimal range', code: 100.0),
    PickerModel('< 1h above optimal range', code: 90.0),
    PickerModel('< 1h above optimal range', code: 70.0),
    PickerModel('1 - < 2h below or ≥1h above optimal range', code: 40.0),
    PickerModel('2 - < 3h below optimal range', code: 20.0),
    PickerModel('≥ 3h below optimal range', code: 0.0),
  ];
  PickerModel selecSueno = valorInicial;
  String botonSueno = "Sleep";
  String tituloSueno = "Average hours of sleep per night (or per 24 h for age ≤ 5";
  setSueno(PickerModel su) {
    selecSueno = su;
  }
// Fin Sueño

  // Fumar
  static const List<PickerModel> fumar = <PickerModel>[
    PickerModel('Never tried', code: 100.0),
    PickerModel('Never tried but lives with indoor smoker at home', code: 80.0),
    PickerModel('Tried any nicotine product, but > 30d ago', code: 50.0),
    PickerModel('Tried any nicotine product, but > 30d ago and lives with indoor smoker at home', code: 30.0),
    PickerModel('Currently using inhaled NDS', code: 25.0),
    PickerModel('Currently using inhaled NDS and lives with indoor smoker at home', code: 5.0),
    PickerModel('Current combustible use (any within 30d)', code: 0.0),
  ];
  PickerModel selecFumar = valorInicial;
  String botonFumar = "Smoke Exposure";
  String tituloFumar = "Combustible tobacco use or inhaled NDS use at any age (per clinician discretion); or secondhand smoke exposure";
  // String tituloFumar = "Minutos semanales de actividad física";
  setFumar(PickerModel fu) {
    selecFumar = fu;
  }
// Fin fumar

  // Diabetes
  static const List<PickerModel> diabetes = <PickerModel>[
    PickerModel('No history of diabetes and FBG<100 (or HbA1c < 5.7)', code: 100.0),
    PickerModel('No diabetes and FBG 100 - 125 (or HbA1c 5.7 - 6.4) (prediabetes)', code: 60.0),
    PickerModel('Diabetes with HbA1c < 7.0', code: 40.0),
    PickerModel('Diabetes with HbA1c 7.0 - 7.9', code: 30.0),
    PickerModel('Diabetes with HbA1c 8.0 - 8.9', code: 20.0),
    PickerModel('Diabetes with HbA1c 9.0 - 9.9', code: 10.0),
    PickerModel('Diabetes with HbA1c ≥ 10', code: 0.0),
  ];
  PickerModel selecDiabetes = valorInicial;
  String botonDiabetes = "Diabetes";
  String tituloDiabetes = "FBG (mg/dL) or HbA1c (%) symptom-based screening at any age or risk-based screening starting at age ≥10y of age or onset of puberty per clinician discretion";
  setDiabetes(PickerModel af) {
    selecDiabetes = af;
  }
// Diabetes

  // Presión arterial
  static const List<PickerModel> presionArterial = <PickerModel>[
    PickerModel('Optimal (<90th percentile)', code: 100.0),
    PickerModel('Optimal (<90th percentile) (treated)', code: 80.0),
    PickerModel('Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower)', code: 75.0),
    PickerModel('Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) (treated)', code: 55.0),
    PickerModel('Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower', code: 50.0),
    PickerModel('Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower (treated)', code: 30.0),
    PickerModel('Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower)', code: 25.0),
    PickerModel('Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) (treated)', code: 5.0),
    PickerModel('Systolic BP ≥ 160 or ≥95th percentile + 30 mm Hg systolic BP, whichever is lower and/or diastolic BP ≥ 100 or ≥ 95th percentile + 20 mm Hg diastolic BP', code: 0.0),
  ];
  PickerModel selecPresionArterial = valorInicial;
  String botonPresionArterial = "Blood Pressure";
  String tituloPresionArterial = "Systolic and diastolic BP (mm Hg) percentiles for age through 12y. For age ≥ 13y use adult scoring. Screening should start no later than age 3y and earlier per clinician discretion.";
  setPresionArterial(PickerModel af) {
    selecPresionArterial = af;
  }
// Fin Presión arterial

  // Colesterol
  static const List<PickerModel> colesterol = <PickerModel>[
    PickerModel('<100', code: 100.0),
    PickerModel('<100 (drug-treated)', code: 80.0),
    PickerModel('100 - 119', code: 60.0),
    PickerModel('120 - 144', code: 40.0),
    PickerModel('145 - 189', code: 20.0),
    PickerModel('≥ 190', code: 0.0),
  ];
  PickerModel selecColesterol = valorInicial;
  String botonColesterol = "Cholesterol";
  String tituloColesterol = "Non-HDL cholesterol (mg/dL), starting no later than age 9 - 11y and earlier per clinician discretion";
  // String tituloColesterol = "Minutos semanales de actividad física";
  setColesterol(PickerModel af) {
    selecColesterol = af;
  }
// Fin Colesterol
}
