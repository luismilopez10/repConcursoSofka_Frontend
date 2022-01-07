class mdlOpcion{
  int intIdOpcion;
  int intIdPregunta;
  String strOpcion;
  bool blnActivo;
  DateTime dtmActualiza;

  mdlOpcion({this.intIdOpcion, this.intIdPregunta, this.strOpcion, this.blnActivo, this.dtmActualiza});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlOpcion.fromJson(Map<String,dynamic> json){
    return mdlOpcion(
        intIdOpcion: json['intIdOpcion'],
        intIdPregunta: json['intIdPregunta'],
        strOpcion: json['strOpcion'],
        blnActivo: json['blnActivo'],
        dtmActualiza: DateTime.tryParse(json['dtmActualiza'])
    );
  }

}