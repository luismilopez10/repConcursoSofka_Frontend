import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/ui/pages/pagConfiguracion.dart';
import 'package:flutter_concurso_app/ui/pages/pagInicio.dart';
import 'package:flutter_concurso_app/ui/pages/pagJuego.dart';
import 'package:flutter_concurso_app/ui/pages/pagPuntajes.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'pagInicio': (context) => pagInicio(),
          'pagJuego': (context) => pagJuego(),
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
