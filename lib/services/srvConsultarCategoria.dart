import 'dart:convert';

import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';
import 'package:flutter_concurso_app/model/mdlCategoria.dart';
import 'package:flutter_concurso_app/services/srvInternetConnectionCheck.dart';
import 'package:http/http.dart' as http;


Future<String> fncConsultarCategoria() async{

  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;
  var response;

  if (await srvInternetConnectionCheck()){
    response = await http.get(Uri.parse("https://pryconcursowebapi.azurewebsites.net/api/Categoria/fncConsultarCategoria"));
  }

  if (response.statusCode == 200) {
    List<dynamic> NewsJson = jsonDecode(response.body);
    NewsJson.forEach((element){
      objCtrAumentarNivel.lstMdlCategoria.add(mdlCategoria.fromJson(element));
    });
    print("Consulta de Categorías Finalizada");
    return response.body;
  } else {
    throw Exception('Error de carga, verifica la conectividad a internet.');
  }
}