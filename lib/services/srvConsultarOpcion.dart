import 'dart:convert';

import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';
import 'package:flutter_concurso_app/model/mdlOpcion.dart';
import 'package:flutter_concurso_app/services/srvInternetConnectionCheck.dart';
import 'package:http/http.dart' as http;


Future<String> fncConsultarOpcion() async{

  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;
  var response;

  if (await srvInternetConnectionCheck()){
    response = await http.get(Uri.parse("https://pryconcursowebapi.azurewebsites.net/api/Opcion/fncConsultarOpcion"));
  }

  if (response.statusCode == 200) {
    List<dynamic> NewsJson = jsonDecode(response.body);
    NewsJson.forEach((element){
      objCtrAumentarNivel.lstMdlOpcion.add(mdlOpcion.fromJson(element));
    });
    print("Consulta de Opciones Finalizada");
    return response.body;
  } else {
    throw Exception('Error de carga, verifica la conectividad a internet.');
  }
}