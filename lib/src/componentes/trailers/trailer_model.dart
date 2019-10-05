// Generated by https://quicktype.io
class Trailers {
  List<Trailer> items = new List();
  Trailers();
  Trailers.fromJsonList(List<dynamic> jsonList) {
  if (jsonList == null)return;
  else items = jsonList.map((item) => Trailer.fromJson(item)).toList();
  }
}
class Trailer {
  Map    licencia;
  Map    kinping;
  String tipo;
  String modelo;
  String placa;
  String capacidad;
  String tipotanque;
  String numeroec;
  String fotofrontal;
  String fotolaterar;
  String fototrasera;
  String numerohidrostatica;
  String fechahidrostatica;
  String urlhidrostatica;
  String numeroaforos;
  String fechaaforos;
  String urlaforos;
  String numerolineas;
  String fechalineas;
  String urllineas;
  String permiso;
  String urlpermiso;
  String numerocadenas;
  String fechacadenas;
  String urlcadenas;
  String numeroparejos;
  String fechaparejos;
  String urlaparejos;
  String hojadevida;
 

  Trailer({
    this.licencia,
    this.kinping,
    this.tipo,
    this.modelo,
    this.placa,
    this.capacidad,
    this.tipotanque,
    this.numeroec,
    this.fotofrontal,
    this.fotolaterar,
    this.fototrasera,
    this.numerohidrostatica,
    this.fechahidrostatica,
    this.urlhidrostatica,
    this.numeroaforos,
    this.fechaaforos,
    this.urlaforos,
    this.numerolineas,
    this.fechalineas,
    this.urllineas,
    this.permiso,
    this.urlpermiso,
    this.numerocadenas,
    this.fechacadenas,
    this.urlcadenas,
    this.numeroparejos,
    this.fechaparejos,
    this.urlaparejos,
    this.hojadevida,
   
  });
   Trailer.fromJson(Map<String, dynamic> json) {
    licencia              =json['licencia'];
    kinping               =json['kinping'];
    tipo                  =json['tipo'];
    modelo                =json['tipo'];
    placa                 =json['placa'];
    capacidad             =json['capacidad'];
    tipotanque            =json['tipotanque'];
    numeroec              =json['numeroec'];
    fotofrontal           =json['frontal'];
    fotolaterar           =json['laterar'];
    fototrasera           =json['trasera'];
    numerohidrostatica    =json['numerohidrostatica'];
    fechahidrostatica     =json['fechahidrostatica'];
    urlhidrostatica       =json['urlhidrostatica'];
    numeroaforos          =json['numeroaforos'];
    fechaaforos           =json['fechaaforos'];
    urlaforos             =json['urlaforos'];
    numerolineas          =json['numerolineas'];
    fechalineas           =json['fechalineas'];  
    urllineas             =json['urllineas'];
    permiso               =json['permiso'];
    urlpermiso            =json['urlpermiso'];
    numerocadenas         =json['numerocadenas'];
    fechacadenas          =json['fechacadenas'];
    urlcadenas            =json['urlcadenas'];
    numeroparejos         =json['numeroparejos'];
    fechaparejos          =json['fechaparejos'];
    urlaparejos           =json['urlaparejos'];
    hojadevida            =json['hojadevida'];
   
   }
}


