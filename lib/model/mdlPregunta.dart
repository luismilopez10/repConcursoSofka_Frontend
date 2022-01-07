class mdlPregunta{
  final int intIdPregunta;
  final int intIdCategoria;
  final String strPregunta;
  final String strRespuesta;
  final bool blnActivo;
  final DateTime dtmActualiza;

  const mdlPregunta({this.intIdPregunta, this.intIdCategoria, this.strPregunta, this.strRespuesta, this.blnActivo, this.dtmActualiza});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlPregunta.fromJson(Map<String, dynamic> json){
    return mdlPregunta(
        intIdPregunta: json['intIdPregunta'] as int,
        intIdCategoria: json['intIdCategoria'] as int,
        strPregunta: json['strPregunta'] as String,
        strRespuesta: json['strRespuesta'] as String,
        blnActivo: json['blnActivo'] as bool,
        dtmActualiza: DateTime.tryParse(json['dtmActualiza'])
    );
  }

}