import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/ui/widgets/wdgPagInicioBoton.dart';

class pagInicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/backgroundImage-Main3.gif"), fit: BoxFit.cover),
        ),
        // padding: EdgeInsets.only(top: 550.0, left: 20.0, bottom: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  wdgPagInicioBoton(Icons.play_arrow_rounded, "Jugar", "pagJuego",Theme.of(context).primaryColor,Colors.blue[200]),
                  SizedBox(height: 20,),
                  wdgPagInicioBoton(Icons.attach_money_rounded, "Puntajes", "pagPuntajes",Colors.green,Colors.green[200]),
                  SizedBox(height: 20,),
                  wdgPagInicioBoton(Icons.settings, "Configuración", "pagConfiguracion",Colors.orange,Colors.orange[200]),
                  SizedBox(height: 20,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
