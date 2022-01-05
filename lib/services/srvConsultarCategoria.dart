import 'dart:convert';
import 'package:flutter_concurso_app/model/mdlJugador.dart';
import 'package:flutter_concurso_app/services/srvInternetConnectionCheck.dart';
import 'package:http/http.dart' as http;


Future<String> fncConsultarCategoria() async{
  var response;

  if (await srvInternetConnectionCheck()){
    response = await http.get(Uri.parse("https://pryconcursowebapi.azurewebsites.net/api/Categoria/fncConsultarCategoria"));
  }

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return response.body;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Error de carga, verifica la conectividad a internet.');
  }
}