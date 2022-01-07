import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/services/srvConsultarCategoria.dart';
import 'package:flutter_concurso_app/services/srvConsultarOpcion.dart';
import 'package:flutter_concurso_app/services/srvConsultarPregunta.dart';
import 'package:flutter_concurso_app/ui/pages/pagConfiguracion.dart';
import 'package:flutter_concurso_app/ui/pages/pagFormGuardarPuntaje.dart';
import 'package:flutter_concurso_app/ui/pages/pagInicio.dart';
import 'package:flutter_concurso_app/ui/pages/pagJuego.dart';
import 'package:flutter_concurso_app/ui/pages/pagPuntajes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    fncConsultarCategoria();
    fncConsultarPregunta();
    fncConsultarOpcion();
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        routes: {
          'pagInicio': (context) => pagInicio(),
          'pagJuego': (context) => pagJuego(),
          'pagFormGuardarPuntaje': (context) => pagFormGuardarPuntaje(),
          'pagPuntajes': (context) => pagPuntajes(),
          'pagConfiguracion': (context) => pagConfiguracion(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Concurso App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: pagInicio());
  }
}
