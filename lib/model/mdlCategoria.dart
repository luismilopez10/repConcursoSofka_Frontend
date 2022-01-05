class mdlCategoria{
  int intIdCategoria;
  int intNivel;
  int intPremio;
  bool blnActivo;
  DateTime dtmActualiza;

  mdlCategoria({this.intIdCategoria, this.intNivel, this.intPremio, this.blnActivo, this.dtmActualiza});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlCategoria.fromJson(Map<String,dynamic> json){
    return mdlCategoria(
        intIdCategoria: json['intIdCategoria'],
        intNivel: json['intNivel'],
        intPremio: json['intPremio'],
        blnActivo: json['blnActivo'],
        dtmActualiza: DateTime.tryParse(json['dtmActualiza'])
    );
  }

}