import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/ui/widgets/wdgInputDecoration.dart';

// https://medium.com/zipper-studios/the-keyboard-causes-the-bottom-overflowed-error-5da150a1c660

Widget wgdTextFormPregunta() {
  return TextFormField(
    validator: (value) =>
    value.isEmpty ? "¿Cuál es tu pregunta?" : null,
    style: TextStyle(color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration: buildInputDecoration("Pregunta", ''),
  );
}


Widget wdgTextFormOpcion(String strNumOpcion) {
  return Container(
      margin: const EdgeInsets.only(left: 40),
      child: TextFormField(
        validator: (value) =>
        value.isEmpty ? "¡Ups! Te faltó esta opción" : null,
        style: TextStyle(color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: buildInputDecoration("Opción " + strNumOpcion, ''),
      ));
}


Widget wdgBotonInsertar(BuildContext context, key) {
  return Container(
    margin: const EdgeInsets.only(top: 43.0),
    width: MediaQuery.of(context).size.width * 0.62,
    child: RaisedButton(
      child: const Text(
        "Insertar",
        style: TextStyle(
            color: Color.fromRGBO(40, 48, 52, 1),
            fontFamily: 'RadikalMedium',
            fontSize: 14),
      ),
      color: Colors.white,
      elevation: 4.0,
      onPressed: () {
        key.currentState.validate();
      },
    ),
  );
}