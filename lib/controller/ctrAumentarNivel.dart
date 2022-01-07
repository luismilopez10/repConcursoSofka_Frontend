import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/model/mdlCategoria.dart';
import 'package:flutter_concurso_app/model/mdlOpcion.dart';
import 'package:flutter_concurso_app/model/mdlPregunta.dart';
import 'package:flutter_concurso_app/services/srvConsultarCategoria.dart';
import 'package:get/get.dart';

class ctrAumentarNivel extends GetxController{

  // Se crea una instancia de tipo Singleton
  static final ctrAumentarNivel instancia = ctrAumentarNivel._();
  ctrAumentarNivel._();

  // Se inicializan los notificadores
  ValueNotifier<String> strOpcionElegida = ValueNotifier<String>("");
  ValueNotifier<int> intNivelActual = ValueNotifier<int>(1);
  ValueNotifier<int> intPuntajeActual = ValueNotifier<int>(0);

  // Listas con todos los datos de Categoría, Pregunta y Opcion
  List<mdlCategoria> lstMdlCategoria = [];
  List<mdlPregunta> lstMdlPregunta = [];
  List<mdlOpcion> lstMdlOpcion = [];

  // Modelos con los datos filtrados para cada Nivel
  mdlCategoria objMdlCategoriaFiltro;
  mdlPregunta objMdlPreguntaFiltro;
  List<mdlOpcion> lstMdlOpcionFiltro = [];

  void fncAumentarNivel(){
    if (ctrAumentarNivel.instancia.intNivelActual.value < 5 && ctrAumentarNivel.instancia.strOpcionElegida.value == ctrAumentarNivel.instancia.objMdlPreguntaFiltro.strRespuesta){
      // Respuesta correcta y faltan rondas
      ctrAumentarNivel.instancia.intNivelActual.value += 1;
      ctrAumentarNivel.instancia.intPuntajeActual.value += ctrAumentarNivel.instancia.objMdlCategoriaFiltro.intPremio;
    }
    else if (ctrAumentarNivel.instancia.intNivelActual.value == 5 && ctrAumentarNivel.instancia.strOpcionElegida.value == ctrAumentarNivel.instancia.objMdlPreguntaFiltro.strRespuesta) {
      // Respuesta correcta y es la última ronda
      Get.toNamed("/PagInicio");
    }
    else if (ctrAumentarNivel.instancia.strOpcionElegida.value != ctrAumentarNivel.instancia.objMdlPreguntaFiltro.strRespuesta) {
      // Respuesta incorrecta
      ctrAumentarNivel.instancia.intNivelActual.value = 1;
      ctrAumentarNivel.instancia.intPuntajeActual.value = 0;
      Get.toNamed("/PagInicio");
    }
    //TODO consultar si la opción elegida es la correcta y si sí, subir el nivel
  }
}