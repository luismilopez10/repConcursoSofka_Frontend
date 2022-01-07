import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';
import 'package:flutter_concurso_app/controller/ctrGuardarPuntaje.dart';
import 'package:flutter_concurso_app/services/srvInternetConnectionCheck.dart';
import 'package:http/http.dart' as http;

Future<String> fncIngresarJugador() async{

  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;
  ctrGuardarPuntaje objCtrGuardarPuntaje = ctrGuardarPuntaje.instancia;
  var response;

  if (await srvInternetConnectionCheck()){
    response = await http.get(Uri.parse("https://pryconcursowebapi.azurewebsites.net/api/Jugador/fncIngresarJugador?intPuntaje=" + objCtrAumentarNivel.intPuntajeActual.value.toString()
    + "&strNombre=" + objCtrGuardarPuntaje.strNombreJugador.value));
  }

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Error de carga, verifica la conectividad a internet.');
  }
}