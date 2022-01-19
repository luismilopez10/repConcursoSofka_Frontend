import 'package:flutter/material.dart';
import 'package:flutter_concurso_app/ui/widgets/wdgFormularioInsertarPregunta.dart';

class pagConfiguracion extends StatelessWidget {

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(36, 43, 47, 1),
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    wgdTextFormPregunta(),
                    wdgTextFormOpcion("1"),
                    wdgTextFormOpcion("2"),
                    wdgTextFormOpcion("3"),
                    wdgTextFormOpcion("4"),
                    wdgBotonInsertar(context, _formKey)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
