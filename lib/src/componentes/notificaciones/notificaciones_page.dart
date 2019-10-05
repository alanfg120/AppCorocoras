
import 'package:apptrans/src/componentes/notificaciones/notificaciones_model.dart';
import 'package:apptrans/src/componentes/notificaciones/notificaciones_provaider.dart';
import 'package:apptrans/src/plugins/format_date.dart';
import 'package:flutter/material.dart';

class NotificacionesPage extends StatefulWidget {
  const NotificacionesPage({Key key}) : super(key: key);

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  final notificacionesprovaider = new NotificacionProvider();
  final date=new Format();
  @override
  Widget build(BuildContext context) {
    notificacionesprovaider.getnotificaciones();
    return Scaffold(
           appBar: AppBar(
                   leading        : Image.asset('img/home.png'),
                   title          : Text("Notificaciones", style: TextStyle(color: Colors.red))
                  ),
           body: Container(
                 padding: EdgeInsets.only(top: 20.0),
                 child:   RefreshIndicator(
                          onRefresh: notificacionesprovaider.getnotificaciones,
                          child: StreamBuilder(
                                 stream :  notificacionesprovaider.notificacionesStream,
                                 builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                           return snapshot.hasData
                                           ? listanotificaciones(snapshot.data)
                                           : Center(child: CircularProgressIndicator());
                                },
                              ),
                         ),
                  ),
     );
  }

  Widget listanotificaciones(List<Notificacion> notificaciones) {
   

    return ListView.builder(
           itemCount   : notificaciones.length,
           itemBuilder : (BuildContext context, int i) {
                          Icon icono;
                          switch (notificaciones[i].icono) {
                                  case "local_shipping"              : icono=Icon(Icons.local_shipping,color: Colors.red);
                                                                       break;
                                  case "airline_seat_recline_normal" : icono=Icon(Icons.airline_seat_recline_normal,color: Colors.red);
                                                                       break;
                                  case "directions_car"              : icono=Icon(Icons.directions_car,color: Colors.red);
                                                                       break;
                           
                          }
                          return ListTile(
                                 onTap: () {
                                 //Navigator.pushNamed(context,'conductor',arguments: notificaciones[i]);
                                 },
                                 leading: Hero(
                                          tag   : notificaciones[i].id,
                                          child : icono
                                                
                                           ),
                                 title    : Text(notificaciones[i].plantilla),
                                 subtitle : Text(date.formato(notificaciones[i].fecha)),
          );
        }
    );
  }
}