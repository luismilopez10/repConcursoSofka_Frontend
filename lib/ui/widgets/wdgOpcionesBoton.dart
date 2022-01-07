import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';

class wdgOpcionesBoton extends StatelessWidget {

  final ValueChanged<String> fncFuncion;

  String strTextoBoton;
  String strProximaPagina;
  Color clrColorBorde;
  Color clrColorFondo;

  wdgOpcionesBoton(this.strTextoBoton, this.strProximaPagina, this.clrColorBorde, this.clrColorFondo, this.fncFuncion);

  ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel.instancia;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: clrColorBorde),
        borderRadius: BorderRadius.circular(10.0),
        color: clrColorFondo,
      ),
      margin: EdgeInsets.only(top: 1.0),
      child: ListTile(
        onTap: () {
          objCtrAumentarNivel.strOpcionElegida.value = strTextoBoton;
          objCtrAumentarNivel.fncAumentarNivel();
          fncFuncion("");
        },
        contentPadding: EdgeInsets.only(top: 5, left: 0, bottom: 5, right: 10),
        visualDensity: VisualDensity.compact,
        title: Center(
          child: Text(strTextoBoton, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
