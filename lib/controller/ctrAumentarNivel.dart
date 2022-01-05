import 'package:flutter/material.dart';

class ctrAumentarNivel{
  ValueNotifier<int> ntfAumentarNivel = ValueNotifier<int>(1);

  void fncAumentarNivel(int intNivelActual){
    ntfAumentarNivel.value = intNivelActual + 1;
    //TODO consultar si la opción elegida es la correcta y si sí, subir el nivel
  }
}