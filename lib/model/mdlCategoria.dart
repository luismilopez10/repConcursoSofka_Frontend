class mdlCategoria{
  final int intIdCategoria;
  final int intNivel;
  final int intPremio;
  final bool blnActivo;
  final DateTime dtmActualiza;

  const mdlCategoria({this.intIdCategoria, this.intNivel, this.intPremio, this.blnActivo, this.dtmActualiza});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlCategoria.fromJson(Map<String, dynamic> json){
    return mdlCategoria(
        intIdCategoria:   json['intIdCategoria'] as int,
        intNivel:         json['intNivel'] as int,
        intPremio:        json['intPremio'] as int,
        blnActivo:        json['blnActivo'] as bool,
        dtmActualiza:     DateTime.tryParse(json['dtmActualiza'])
    );
  }

}