import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';
import 'package:flutter_concurso_app/ui/widgets/wdgOpcionesBoton.dart';
import 'package:get/get.dart';

class pagJuego extends StatefulWidget {
  @override
  _pagJuegoState createState() => _pagJuegoState();
}

class _pagJuegoState extends State<pagJuego> {

  int intRandom;
  int intPuntaje;
  int intNivel;
  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;

  // Función que se le envía a los botones para actualizar el widget del Nivel y el Puntaje
  void fncActualizarInfoNivelActual(String strOpcionElegida){
    intRandom = Random().nextInt(5);
    fncFiltrarInfoNivelActual();
    setState(() => intNivel = objCtrAumentarNivel.intNivelActual.value);
    setState(() => intPuntaje = objCtrAumentarNivel.intPuntajeActual.value);
  }

  void fncFiltrarInfoNivelActual(){
    objCtrAumentarNivel.objMdlCategoriaFiltro = objCtrAumentarNivel.lstMdlCategoria.where((categoria) => categoria.intNivel == objCtrAumentarNivel.intNivelActual.value).toList().first;
    objCtrAumentarNivel.objMdlPreguntaFiltro = objCtrAumentarNivel.lstMdlPregunta.where((pregunta) => pregunta.intIdCategoria == objCtrAumentarNivel.objMdlCategoriaFiltro.intIdCategoria).toList()[intRandom];
    objCtrAumentarNivel.lstMdlOpcionFiltro = objCtrAumentarNivel.lstMdlOpcion.where((opcion) => opcion.intIdPregunta == objCtrAumentarNivel.objMdlPreguntaFiltro.intIdPregunta).toList();
  }

  @override
  void initState() {
    super.initState();
    fncActualizarInfoNivelActual("0");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/backgroundImage.jpg"), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.only(top: 50.0, left: 20.0, bottom: 20.0, right: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    //-------------------PUNTAJE Y NIVEL------------------------
                    ListTile(
                      leading: Column(
                        children: [
                          Icon(Icons.monetization_on_rounded, color: Colors.orange[300], size: 30.0,),
                          Text(objCtrAumentarNivel.intPuntajeActual.value.toString(), style: TextStyle(color: Colors.green[300], fontSize: 20.0, fontStyle: FontStyle.italic))
                      ]),
                      trailing: Column(
                        children: [
                          Text('Nivel:', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0, fontStyle: FontStyle.italic)),
                          Text(objCtrAumentarNivel.intNivelActual.value.toString(), style: TextStyle(color: Colors.green[300], fontSize: 20.0, fontStyle: FontStyle.italic))
                      ]),
                    ),
                    SizedBox(height: 70,),

                    //-----------------------PREGUNTA---------------------------
                    Text(objCtrAumentarNivel.objMdlPreguntaFiltro.strPregunta, style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 80,),

                    //-----------------------OPCIONES---------------------------
                    wdgOpcionesBoton(objCtrAumentarNivel.lstMdlOpcionFiltro[0].strOpcion, "pagJuego", Colors.blue, Colors.blue[200], fncActualizarInfoNivelActual),
                    SizedBox(height: 20,),
                    wdgOpcionesBoton(objCtrAumentarNivel.lstMdlOpcionFiltro[1].strOpcion, "pagJuego", Colors.green, Colors.green[200], fncActualizarInfoNivelActual),
                    SizedBox(height: 20,),
                    wdgOpcionesBoton(objCtrAumentarNivel.lstMdlOpcionFiltro[2].strOpcion, "pagJuego", Colors.orange, Colors.orange[200], fncActualizarInfoNivelActual),
                    SizedBox(height: 20,),
                    wdgOpcionesBoton(objCtrAumentarNivel.lstMdlOpcionFiltro[3].strOpcion, "pagJuego", Colors.purple, Colors.purple[200], fncActualizarInfoNivelActual),
                    SizedBox(height: 80,),

                    //---------------------BOTÓN RETIRARSE------------------------
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.red[200],
                      ),
                      margin: EdgeInsets.only(top: 1.0),
                      child: ListTile(
                        onTap: (){
                          if (objCtrAumentarNivel.intNivelActual.value != 1){
                            Get.toNamed('pagFormGuardarPuntaje');
                            Get.snackbar("Te has retirado", "Ingresa tu Nick para guardar tu puntaje.");
                          } else {
                            Get.toNamed('pagInicio');
                            Get.snackbar("Retirado", "Te has retirado sin puntuación.");
                          }
                        },
                        contentPadding: EdgeInsets.only(top: 15, left: 0, bottom: 15, right: 10),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('RETIRARSE',style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 40,),
                            Icon(Icons.exit_to_app,color: Colors.white,size: 40,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}