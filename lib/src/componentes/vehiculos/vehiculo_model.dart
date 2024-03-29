// Generated by https://quicktype.io
class Vehiculos {
  
  List<Vehiculo> items = new List();
  Vehiculos();

  Vehiculos.fromJsonList(List<dynamic> jsonList) {
                        if (jsonList == null) return;
                        else items = jsonList.map((item) => Vehiculo.fromJson(item)).toList();
  }
}
class Vehiculo {
  List   poliza;
  List   certificados;
  Map    licencia;
  Map    soat;
  Map    tecnomecanica;
  Map    propetario;
  Map    quintarueda;
  String tipo;
  String placa;
  String modelo;
  String marca;
  String linea;
  String mula;
  String volqueta;
  String dobletroque;
  String fotofrontal;
  String fotolaterar;
  String fototrasera;
  String webgps;
  String usergps;
  String pwdgps;
  String hojadevida;

  Vehiculo({
    this.poliza,
    this.certificados,
    this.licencia,
    this.soat,
    this.tecnomecanica,
    this.propetario,
    this.quintarueda,
    this.tipo,
    this.placa,
    this.modelo,
    this.marca,
    this.linea,
    this.mula,
    this.dobletroque,
    this.volqueta,
    this.fotofrontal,
    this.fotolaterar,
    this.fototrasera,
    this.webgps,
    this.usergps,
    this.pwdgps,
    this.hojadevida,
  });

   Vehiculo.fromJson(Map<String, dynamic> json) {

    poliza        = json['poliza'];
    certificados  = json['certificado'];
    licencia      = json['licencia'];
    soat          = json['soat'];
    tecnomecanica = json['tecnomecanica'];
    propetario    = json['propetario'];
    quintarueda   = json['quintarueda'];
    tipo          = json['tipo'];
    placa         = json['placa'];
    modelo        = json['modelo'];
    marca         = json['marca'];
    linea         = json['linea'];
    mula          = json['mula'];
    dobletroque   = json['dobletroque'];
    volqueta      = json['volqueta'];
    fotofrontal   = json['fotofrontal'];
    fotolaterar   = json['fotolaterar'];
    fototrasera   = json['fototrasera'];
    webgps        = json['webgps'];
    usergps       = json['usergps'];
    pwdgps        = json['pwdgps'];
    hojadevida    = json['hojadevida'];

    
  }
}

