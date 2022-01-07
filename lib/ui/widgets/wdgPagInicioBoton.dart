// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';

class wdgPagInicioBoton extends StatelessWidget {

  IconData icnIconoBoton;
  String strTextoBoton;
  String strProximaPagina;
  Color clrColorBorde;
  Color clrColorFondo;

  wdgPagInicioBoton(this.icnIconoBoton, this.strTextoBoton, this.strProximaPagina, this.clrColorBorde, this.clrColorFondo);

  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(color: clrColorBorde),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(top: 1.0),
      child: RaisedButton(
        onPressed: () {
          if (strTextoBoton == "Jugar"){
            objCtrAumentarNivel.intNivelActual.value = 1;
            objCtrAumentarNivel.intPuntajeActual.value = 0;
          }
          Navigator.of(context).pushNamed(strProximaPagina);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: clrColorFondo,
        textColor: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icnIconoBoton, size: 40.0,),
              Text(strTextoBoton,style: TextStyle(fontSize: 30.0),),
            ],
          ),
        ),
      ),






      // child: ListTile(
      //   onTap: () {
      //     Navigator.pop(context);
      //     Navigator.of(context).pushNamed(strProximaPagina);
      //   },
      //   contentPadding: EdgeInsets.only(top: 10, left: 0, bottom: 20, right: 10),
      //   leading: Icon(icnIconoBoton, size: 70, color: Colors.black,),
      //   title: Text(
      //     strTextoBoton,
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),





    );
  }
}
