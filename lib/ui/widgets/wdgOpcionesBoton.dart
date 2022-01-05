import 'package:flutter/material.dart';

class wdgOpcionesBoton extends StatelessWidget {

  String strTextoBoton;
  String strProximaPagina;
  Color clrColorBorde;
  Color clrColorFondo;


  wdgOpcionesBoton(this.strTextoBoton, this.strProximaPagina, this.clrColorBorde, this.clrColorFondo);

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
          Navigator.pop(context);
          Navigator.of(context).pushNamed("pagJuego");
          //TODO: Aquí se debe hacer el condicionar para verificar que es la opción correcta y enviar a la página correspondiente
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
