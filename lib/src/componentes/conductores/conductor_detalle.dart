import 'package:apptrans/src/componentes/conductores/conductor_model.dart';
import 'package:apptrans/src/plugins/format_date.dart';
import 'package:apptrans/src/plugins/listadedatos.dart';
import 'package:apptrans/src/plugins/silverappbar.dart';
import 'package:apptrans/src/plugins/tarjetas.dart';
import 'package:flutter/material.dart';


class ConductorDetalle extends StatefulWidget {
  @override
  _ConductorDetalleState createState() => _ConductorDetalleState();
}

class _ConductorDetalleState extends State<ConductorDetalle> {
  final f = Format();

  @override
  Widget build(BuildContext context) {
    final Conductor conductor = ModalRoute.of(context).settings.arguments;

   
    return Scaffold(
           body: CustomScrollView(
                 slivers: <Widget>[
                           silverappbar(conductor.nombre,conductor.cedula,conductor.urlfoto),
                           SliverList(
                           delegate: SliverChildListDelegate([
                                     datosbasicos(conductor),
                                     Tarjeta(conductor.cursos)  
                                   ]
                             ),
                           )
            ],
      ),
    );
  }

  
 Widget datosbasicos(Conductor conductor) {
    return Column(
           children: <Widget>[
                      SizedBox(height: 10.0,),

                      Text("Datos Basicos",style: TextStyle(
                                                  fontWeight: FontWeight.bold, 
                                                  fontSize  : 15.0
                                                  )
                      ),
                     //------ Imprimir los Datos -------------
                      Datos("Cedula"                ,conductor.cedula                ,conductor.urlcedula       ,Icon(Icons.credit_card)),
                      Datos("Edad"                  ,conductor.edad                  ,null                      ,Icon(Icons.calendar_today)),
                      Datos("Correo"                ,conductor.email                 ,null                      ,Icon(Icons.email)),
                      Datos("Direcion"              ,conductor.direccion             ,null                      ,Icon(Icons.map)),
                      Datos("Telefono"              ,conductor.telefono              ,null                      ,Icon(Icons.phone_android)),
                      Datos("EPS"                   ,conductor.eps                   ,null                      ,Icon(Icons.local_hospital)),
                      Datos("ARL"                   ,conductor.arl                   ,null                      ,Icon(Icons.local_hospital)),
                      Datos("Certificacion Bancaria","Documento"                     ,conductor.urlcertificado  ,Icon(Icons.monetization_on)),
                      Datos("Vacunas"               ,conductor.vacunas["estado"]     ,conductor.vacunas["url"]  ,Icon(Icons.colorize)),
                      Datos("Seguridad Social"      ,conductor.seguridad["pendiente"],conductor.seguridad["url"],Icon(Icons.lock_outline)),
                      Datos("Comparendos(Simit)"    ,conductor.comparendos           ,conductor.urlsimit        ,Icon(Icons.content_copy)),
                      Datos("Rut"                   ,"Documento"                     ,conductor.urlrunt         ,Icon(Icons.description)),
                      Datos("Hoja de vida"          ,"Documento"                     ,conductor.hojadevida      ,Icon(Icons.description)),

                      SizedBox(height: 10.0,),

                      Text("Licencia",style: TextStyle( 
                                             fontWeight: FontWeight.bold, 
                                             fontSize  : 15.0
                                             )
                      ),
                      Datos("Numero"              ,conductor.licencia['numero']              ,conductor.licencia['url'],Icon(Icons.call_to_action)),
                      Datos("Categorias"          ,conductor.licencia['categoria'].toString(),null                     ,Icon(Icons.list)),
                      Datos("Fecha de Vencimiento",f.formato(conductor.licencia['vigencia']) ,null                     ,Icon(Icons.calendar_view_day)),
                      Text ("Cursos",style: TextStyle(
                                            fontWeight: FontWeight.bold, 
                                            fontSize: 15.0
                                            )
                      ),
           ]
    );
  }

  
  
}