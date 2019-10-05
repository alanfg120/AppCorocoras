import 'package:apptrans/src/componentes/conductores/conductores_page.dart';
import 'package:apptrans/src/componentes/configuracion/configuracion_page.dart';
import 'package:apptrans/src/componentes/notificaciones/notificaciones_page.dart';
import 'package:apptrans/src/componentes/trailers/trailers_page.dart';
import 'package:apptrans/src/componentes/vehiculos/vehiculo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String titulo    = "Conductures";
  int currentindex = 0;
  final Color red  = Colors.red;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body                : page(currentindex), 
           bottomNavigationBar : bottomnavbar()
          );
  }

  Widget bottomnavbar() =>
         BottomNavigationBar(
         onTap              : (value) {
                               page(value);
                              },
         currentIndex       : currentindex,
         type               : BottomNavigationBarType.fixed,
         backgroundColor    : Colors.white,
         elevation          : 0,
         iconSize           : 30.0,
         selectedFontSize   : 10.0,
         unselectedFontSize : 10.5,
         items              : [
                              BottomNavigationBarItem(
                              icon  : Icon(Icons.airline_seat_recline_normal),
                              title : Text("Conductores"),
                              ),
                              BottomNavigationBarItem(
                              icon  : Icon(Icons.directions_car), 
                              title : Text("Vehiculos")
                              ),
                              BottomNavigationBarItem(
                              icon  : Icon(Icons.local_shipping), 
                              title : Text("Trailers")
                              ),
                              BottomNavigationBarItem(
                              icon  : Icon(Icons.notifications_none), 
                              title : Text("Notificaciones")
                              ),
                              BottomNavigationBarItem(
                              icon  : Icon(Icons.settings), 
                              title : Text("Configuracion")
                              ),
                             ],
          
        );
  

  Widget page(index) {
         setState(()=>currentindex = index);
         switch (currentindex) {
                 case 0  : titulo = "Conductores";
                           return ConductoresPage();
                           break;
                 case 1  : titulo = "Vehiculos";
                           return VehiculoPage();
                           break;
                 case 2  : titulo = "Trailers";
                           return TrailerPage();
                           break;
                 case 3  : titulo = "Notificaciones";
                           return NotificacionesPage();
                           break;          
                 case 4  : titulo = "Configuacion";
                           return ConfiguracionPage();
                           break;
                 default : return null;
           }   
  }
}
