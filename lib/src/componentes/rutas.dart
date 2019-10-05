import 'package:flutter/material.dart';
import 'package:apptrans/src/plugins/pdf_visor.dart';
import 'package:apptrans/src/componentes/home_page.dart';
import 'package:apptrans/src/componentes/login/login.dart';
import 'package:apptrans/src/componentes/trailers/trailers_page.dart';
import 'package:apptrans/src/componentes/vehiculos/vehiculo_page.dart';
import 'package:apptrans/src/componentes/trailers/trailer_detalle.dart';
import 'package:apptrans/src/componentes/vehiculos/vehiculo_detalles.dart';
import 'package:apptrans/src/componentes/conductores/conductores_page.dart';
import 'package:apptrans/src/componentes/conductores/conductor_detalle.dart';
import 'package:apptrans/src/componentes/configuracion/configuracion_page.dart';
import 'package:apptrans/src/componentes/notificaciones/notificaciones_page.dart';


Map<String, WidgetBuilder> route() {
  return <String, WidgetBuilder>{
    'login'           : (context) => Login(),
    'home'            : (context) => HomePage(),
    'conductores'     : (context) => ConductoresPage(),
    'vehiculos'       : (context) => VehiculoPage(),
    'trailers'        : (context) => TrailerPage(),
    'configuracion'   : (context) => ConfiguracionPage(),
    'conductor'       : (context) => ConductorDetalle(),
    'vehiculo'        : (context) => VehiculoDetalle(),
    'trailer'         : (context) => TrailerDetalle(),
    'pdf'             : (context) => PdfVisor(),
    'pdf'             : (context) => NotificacionesPage(),
  };
}
