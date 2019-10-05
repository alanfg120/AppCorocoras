import 'package:flutter/material.dart';
import 'package:apptrans/src/plugins/format_date.dart';
import 'package:apptrans/src/plugins/listadedatos.dart';
import 'package:apptrans/src/plugins/silverappbar.dart';
import 'package:apptrans/src/componentes/trailers/trailer_model.dart';



class TrailerDetalle extends StatefulWidget {
  TrailerDetalle({Key key}) : super(key: key);
  
  _TrailerDetalleState createState() => _TrailerDetalleState();

}

class _TrailerDetalleState extends State<TrailerDetalle> {
  final f = Format();
  @override
  Widget build(BuildContext context) {
     final Trailer trailer = ModalRoute.of(context).settings.arguments;
     List<Widget> informacion=[
                                datosbasicos(trailer),
                                documento("Tarjeta de Propiedad", 
                                          trailer.licencia['numero'], 
                                          trailer.licencia['fecha'], 
                                          trailer.licencia['url']
                                          ),
                                documento("Cadenas y Raches", 
                                          trailer.numerocadenas,
                                          trailer.fechacadenas,
                                          trailer.urlcadenas
                                          ),
                                 documento("Aparejos", 
                                          trailer.numeroparejos,
                                          trailer.fechaparejos,
                                          trailer.urlaparejos
                                          ),
                                documento("Prueba Hidrostatica", 
                                          trailer.numerohidrostatica, 
                                          trailer.fechahidrostatica, 
                                          trailer.urlhidrostatica
                                          ),
                                documento("Tabla de Aforos", 
                                          trailer.numeroaforos, 
                                          trailer.fechaaforos, 
                                          trailer.fechaaforos
                                          ),
                                documento("Lineas de Vida", 
                                          trailer.numerolineas, 
                                          trailer.fechalineas, 
                                          trailer.urllineas
                                          ),
                                documento("KingPing", 
                                          trailer.kinping['numero'], 
                                          trailer.kinping['fecha'], 
                                          trailer.kinping['url']
                                          ),
                                
                              ];
     return Scaffold(
           body: CustomScrollView(
                 slivers: <Widget>[
                           silverappbar(trailer.placa,trailer.placa,trailer.fotofrontal),
                           SliverList(
                           delegate: SliverChildListDelegate([
                                     datos(trailer,informacion)
                                   
                                   ]
                             ),
                           )
            ],
      ),
    );
  }

  Widget datos(Trailer triler,List informacion) {
               switch (triler.tipo) {
                       
                       case "tanque"     : for (var i = 0; i < 2; i++)informacion.removeAt(2);
                                           break;
                       case "camaalta"   : for (var i = 0; i < 4; i++)informacion.removeAt(3);
                                           break;
                       case "camabaja"   : informacion.removeAt(2);
                                           for (var i = 0; i < 3; i++)informacion.removeAt(3);
                                           break; 
               }
               return Column(children: informacion);
  }

Widget datosbasicos(Trailer trailer) {
       final  datosbasicos= [
                              SizedBox(height: 10.0,),

                              Text("Datos Basicos",style: TextStyle(
                                                   fontWeight: FontWeight.bold, 
                                                   fontSize: 15.0
                                                 )
                               ),
                         
                              Datos("Modelo"        ,trailer.modelo    ,null              ,Icon(Icons.view_module)),
                              Datos("Capacidad"     ,trailer.capacidad ,null              ,Icon(Icons.crop_din)),
                              Datos("Tipo"          ,trailer.tipotanque,null              ,Icon(Icons.dehaze)),
                              Datos("Numero de Ejes",trailer.numeroec  ,null              ,Icon(Icons.format_list_numbered)),
                              Datos("Permiso"       ,trailer.permiso   ,trailer.urlpermiso,Icon(Icons.open_with)),
                              Datos("Hoja De vida  ","Descargar"     ,trailer.hojadevida,Icon(Icons.file_download)),
                      ];
       if(trailer.tipo=="carroceria" || trailer.tipo=="camaalta"){
          datosbasicos.removeAt(4);
          datosbasicos.removeAt(5);      
       }
       
       if(trailer.tipo=='tanque')  datosbasicos.removeAt(6);
       if(trailer.tipo=='camabaja')datosbasicos.removeAt(4); 
       
       return Column(children: datosbasicos);
}
  
Widget documento(tipo,numero,fecha,url) {
      
         return Column(
         children: <Widget>[
                   SizedBox(height: 10.0,),
                   Text(tipo,style: TextStyle(
                                          fontWeight: FontWeight.bold, 
                                          fontSize: 15.0
                                          )
                        ),
                   Datos("Numero",numero ,null,Icon(Icons.credit_card)),
                   Datos("Fecha",f.formato(fecha),null,Icon(Icons.calendar_today)),
                   Datos("Documento","Descargar",url,Icon(Icons.file_download)),
                   
                   ],
         );

  }
}