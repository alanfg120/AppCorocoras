class Conductores {
  List<Conductor> items = new List();
  Conductores();
  Conductores.fromJsonList(List<dynamic> jsonList)  {
  if (jsonList == null)return;
  else items = jsonList.map((item) => Conductor.fromJson(item)).toList();
  }
}

class Conductor {
  Map    licencia;
  Map    seguridad;
  Map    vacunas;
  List   cursos;
  List   pendientes;
  String tipo;
  String nombre;
  String email;
  String direccion;
  String telefono;
  String cedula;
  String edad;
  String eps;
  String arl;
  String urlcedula;
  String urlcertificado;
  String urlfoto;
  String comparendos;
  String urlsimit;
  String urlrunt;
  String hojadevida;

  Conductor({
    this.licencia,
    this.seguridad,
    this.vacunas,
    this.cursos,
    this.pendientes,
    this.tipo,
    this.nombre,
    this.email,
    this.direccion,
    this.telefono,
    this.cedula,
    this.edad,
    this.eps,
    this.arl,
    this.urlcedula,
    this.urlcertificado,
    this.urlfoto,
    this.comparendos,
    this.urlsimit,
    this.urlrunt,
    this.hojadevida
  });
  Conductor.fromJson(Map<String, dynamic> json) {
    licencia       = json['licencia'];
    seguridad      = json['seguridad'];
    vacunas        = json['vacunas'];
    cursos         = json['cursos'];
    pendientes     = json['pendientes'];
    tipo           = json['tipo'];
    nombre         = json['nombre'];
    email          = json['email'];
    direccion      = json['direccion'];
    telefono       = json['telefono'];
    cedula         = json['cedula'];
    edad           = json['edad'];
    eps            = json['eps'];
    arl            = json['arl'];
    urlcedula      = json['urlcedula'];
    urlcertificado = json['urlcertificado'];
    urlfoto        = json['urlfoto'];
    comparendos    = json['comparendos'];
    urlsimit       = json['urlsimit'];
    urlrunt        = json['urlrunt'];
    urlrunt        = json['urlrunt'];
    hojadevida        = json['hojadevida'];
  }
}










