import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/services/srvIngresarJugador.dart';
import 'package:get/get.dart';

class ctrGuardarPuntaje{

  // Se crea una instancia de tipo Singleton
  static final ctrGuardarPuntaje instancia = ctrGuardarPuntaje._();
  ctrGuardarPuntaje._();

  // Se inicializan los notificadores
  ValueNotifier<String> strNombreJugador = ValueNotifier<String>("");

  void fncGuardarPuntaje(){
    fncIngresarJugador();
    Get.toNamed('pagInicio');
  }
}