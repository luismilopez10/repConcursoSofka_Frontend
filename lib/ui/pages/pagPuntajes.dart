import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/main.dart';
import 'package:flutter_concurso_app/model/mdlJugador.dart';
import 'package:flutter_concurso_app/services/srvConsultarJugador.dart';
import 'package:flutter_concurso_app/ui/pages/pagInicio.dart';

class pagPuntajes extends StatefulWidget {
  @override
  _pagPuntajesState createState() => _pagPuntajesState();
}

class _pagPuntajesState extends State<pagPuntajes> {

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  Future<String> ftrJugador;
  List<mdlJugador> lstMdlJugador = [];

  @override
  void initState() {
    super.initState();
    ftrJugador = fncConsultarJugador();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Ranking"),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed("pagInicio");
          },
          color: Colors.white,
          icon: Icon(Icons.home),
        ),
      ),
      body: Card(
        margin: EdgeInsets.only(top: 10.0, left: 5.0, bottom: 10.0, right: 5.0),
        shadowColor: Colors.white70,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Posición",textAlign: TextAlign.start,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Jugador",textAlign: TextAlign.start,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Puntaje",textAlign: TextAlign.end,),
                  ),
                ],
              )
            ),
            Expanded(
              child: FutureBuilder(
                  future: ftrJugador,
                  builder: (context, response) {
                    if (response.hasData) {
                      lstMdlJugador.clear();
                      List<dynamic> NewsJson = jsonDecode(response.data);
                      NewsJson.forEach((element) {
                        lstMdlJugador.add(mdlJugador.fromJson(element));
                      });
                      return ListView.builder(
                            itemCount: lstMdlJugador.length,
                            itemBuilder: (context, puntero) {
                              return Container(
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Theme.of(context).primaryColor,width: 0.1),
                                    color: Colors.blue[50],
                                  ),
                                  height: 40,
                                  // padding: EdgeInsets.all(5.0),
                                  child: ListTile(
                                    visualDensity: VisualDensity.compact,
                                    dense: true,
                                    leading: Container(
                                      margin: EdgeInsets.only(left: 14.0),
                                      child: Text(
                                        (puntero+1).toString(),
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    title: Container(
                                      margin: EdgeInsets.only(left: 35.0),
                                      child: Text(
                                        (lstMdlJugador[puntero].strNombre.toString()), //TODO Cambiar la fuente del texto y tamaño
                                        style: TextStyle(color: Colors.green[500],fontWeight: FontWeight.bold),
                                      )
                                    ),
                                    trailing: Text(
                                      lstMdlJugador[puntero].intPuntaje.toString(),
                                      style: TextStyle(color: Colors.blue[500],fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                            });
                    } else if (response.hasError) {
                      return Center(child: Text("${response.error}"));
                    }
                    return Center(
                      child: Container(
                          color: Colors.white,
                          child: CircularProgressIndicator()),
                    );
                  }),
          ),
          ]
        ),
      ),
    );
  }
}
