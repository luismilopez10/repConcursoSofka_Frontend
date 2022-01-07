import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_concurso_app/controller/ctrGuardarPuntaje.dart';
import 'package:get/get.dart';

GlobalKey<FormState> formContactKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class pagFormGuardarPuntaje extends StatefulWidget {
  @override
  _pagFormGuardarPuntajeState createState() => _pagFormGuardarPuntajeState();
}

class _pagFormGuardarPuntajeState extends State<pagFormGuardarPuntaje> {

  TextEditingController _nameController;
  ctrGuardarPuntaje objCtrGuardarPuntaje = ctrGuardarPuntaje.instancia;

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    myFocusNode = FocusNode();
  }

  bool validateAll() {
    if (formContactKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validate(String value, String key) => value.isEmpty ? "Wow, parece que no has ingresado tu $key" : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formPageKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Guardar Puntaje"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/backgroundImage.jpg"), fit: BoxFit.cover),
        ),
        child: Form(
          key: formContactKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 250,),

                //----------------------------NOMBRE----------------------------
                TextFormField(
                  autofocus: true,
                  focusNode: myFocusNode,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Z a-z]")),
                    LengthLimitingTextInputFormatter(4),
                  ],
                  validator: (value) => validate(value, "Nick"),
                  decoration: InputDecoration(
                    hintText: 'Ej. LML',
                    labelText: 'Nick',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white)),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) => objCtrGuardarPuntaje.strNombreJugador.value = value,
                  controller: _nameController,
                ),
                SizedBox(height: 270.0),

                //---------------------BOTÓN "Guardar"----------------------
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green[200],
                  ),
                  margin: EdgeInsets.only(top: 1.0),
                  child: ListTile(
                    onTap: (){
                      if(validateAll()){
                        objCtrGuardarPuntaje.fncGuardarPuntaje();
                      }
                    },
                    contentPadding: EdgeInsets.only(top: 15, left: 0, bottom: 15, right: 10),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('GUARDAR',style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 40,),
                        Icon(Icons.save,color: Colors.white,size: 40,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }
}
