class mdlJugador{
  int intIdJugador;
  int intPuntaje;
  String strNombre;
  bool blnActivo;
  DateTime dtmActualiza;

  mdlJugador({this.intIdJugador, this.intPuntaje, this.strNombre, this.blnActivo, this.dtmActualiza});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlJugador.fromJson(Map<String,dynamic> json){
    return mdlJugador(
        intIdJugador: json['intIdJugador'],
        intPuntaje: json['intPuntaje'],
        strNombre: json['strNombre'],
        blnActivo: json['blnActivo'],
        dtmActualiza: DateTime.tryParse(json['dtmActualiza'])
    );
  }

}