class Notificaciones {
  List<Notificacion> items = new List();
  Notificaciones();
  Notificaciones.fromJsonList(List<dynamic> jsonList) {
  if (jsonList == null)return;
  else items = jsonList.map((item) => Notificacion.fromJson(item)).toList();
  }
}

class Notificacion {
  String id;
  String icono;
  String plantilla;
  String fecha;
  String fechaNotificacion;

  Notificacion({
    this.id,
    this.icono,
    this.plantilla,
    this.fecha,
    this.fechaNotificacion,
  });
    Notificacion.fromJson(Map<String, dynamic> json) {
    id                = json['_id'];
    icono             = json['icono'];
    plantilla         = json['plantilla'];
    fecha             = json['fecha'];
    fechaNotificacion = json['fechaNotificacion'];

}


}