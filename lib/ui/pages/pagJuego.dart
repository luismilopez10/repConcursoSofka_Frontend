import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/controller/ctrAumentarNivel.dart';
import 'package:flutter_concurso_app/ui/widgets/wdgOpcionesBoton.dart';

class pagJuego extends StatefulWidget {
  @override
  _pagJuegoState createState() => _pagJuegoState();
}

class _pagJuegoState extends State<pagJuego> {

  int intPuntaje;
  String strNivel;
  //ctrAumentarNivel objCtrAumentarNivel = ctrAumentarNivel();

  @override
  void initState() {
    super.initState();
    intPuntaje = 0;
    strNivel = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //-----------------------HEADER---------------------------
                  ListTile(
                    leading: Column(
                      children: [
                        Icon(Icons.monetization_on_rounded, color: Colors.amber, size: 30.0,),
                        Text(intPuntaje.toString(), style: TextStyle(color: Colors.green[300], fontSize: 20.0, fontStyle: FontStyle.italic))
                    ]),
                    trailing: Column(
                      children: [
                        Text('Nivel:', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0, fontStyle: FontStyle.italic)),
                        Text(strNivel, style: TextStyle(color: Colors.green[300], fontSize: 20.0, fontStyle: FontStyle.italic)),
                    ]),
                  ),
                  SizedBox(height: 70,),

                  //-----------------------PREGUNTA---------------------------
                  Text('6÷2(1+2)+4', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80,),

                  //-----------------------OPCIONES---------------------------
                  wdgOpcionesBoton('12', "pagJuego", Colors.blue, Colors.blue[200]),
                  SizedBox(height: 20,),
                  wdgOpcionesBoton('5', "pagJuego", Colors.green, Colors.green[200]),
                  SizedBox(height: 20,),
                  wdgOpcionesBoton('15', "pagJuego", Colors.orange, Colors.orange[200]),
                  SizedBox(height: 20,),
                  wdgOpcionesBoton('13', "pagJuego", Colors.purple, Colors.purple[200]),
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
                        Navigator.pop(context);
                      },
                      contentPadding: EdgeInsets.only(top: 15, left: 0, bottom: 15, right: 10),
                      title: Center(
                        child: Text('RETIRARSE',style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
