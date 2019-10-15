import 'package:apptrans/src/componentes/vehiculos/vehiculo_model.dart';
import 'package:apptrans/src/plugins/format_date.dart';
import 'package:apptrans/src/plugins/listadedatos.dart';
import 'package:apptrans/src/plugins/silverappbar.dart';
import 'package:apptrans/src/plugins/tarjetas.dart';
import 'package:flutter/material.dart';



class VehiculoDetalle extends StatefulWidget {
  VehiculoDetalle({Key key}) : super(key: key);
  
  _VehiculoDetalleState createState() => _VehiculoDetalleState();
}

class _VehiculoDetalleState extends State<VehiculoDetalle> {
  final fecha = Format();
  @override
  Widget build(BuildContext context) {
     final Vehiculo vehiculo = ModalRoute.of(context).settings.arguments;
     List<Widget> informacion=[
                                  datosbasicos(vehiculo),
                                  documento(
                                  "Licencia",
                                   vehiculo.licencia['numero'],
                                   vehiculo.licencia['fecha'],
                                   vehiculo.licencia['url']
                                   ),
                                   documento(
                                  "Soat",
                                   vehiculo.soat['numero'],
                                   vehiculo.soat['fecha'],
                                   vehiculo.soat['url']
                                   ),
                                    documento(
                                   "Tecnomecanica",
                                   vehiculo.tecnomecanica['numero'],
                                   vehiculo.tecnomecanica['fecha'],
                                   vehiculo.tecnomecanica['url']
                                   ), 
                                   
                                   propetario(vehiculo),
                                   titulo("Polizas"),
                                   Tarjeta(vehiculo.poliza),
                                 
                                
                              ];
     return Scaffold(
           body: CustomScrollView(
                 slivers: <Widget>[
                           silverappbar(vehiculo.placa,vehiculo.placa,vehiculo.fotofrontal),
                           SliverList(
                           delegate: SliverChildListDelegate([
                                     datos(vehiculo,informacion)
                                    
                                   ]
                             ),
                           )
            ],
      ),
    );
  }

  Widget datos(Vehiculo vehiculo,List informacion) {
         
         if(vehiculo.tipo=="mula"){
           if(vehiculo.quintarueda.isNotEmpty)informacion.insert(4,quintarueda(vehiculo.quintarueda));
         }
         if(vehiculo.tipo=="grua"){
           if(vehiculo.quintarueda.isNotEmpty){
                       informacion.add(titulo("Certificados"));
                       informacion.add(Tarjeta(vehiculo.certificados));
           }
         }
        return Column(children: informacion);
  }

  Widget datosbasicos(Vehiculo vehiculo) {
   String tipo;
   if(vehiculo.tipo=='volqueta')   tipo = vehiculo.volqueta;
   if(vehiculo.tipo=='dobletroque')tipo = vehiculo.dobletroque;
   if(vehiculo.tipo=='mula')       tipo = vehiculo.mula;

  return Column(
         children: <Widget>[
                   SizedBox(height: 10.0,),
                   Text("Datos Basicos",style: TextStyle(
                                          fontWeight: FontWeight.bold, 
                                          fontSize: 15.0
                                          )
                        ),
                   Datos("Tipo"          ,tipo            ,null,Icon(Icons.directions_car)),
                   Datos("Modelo"        ,vehiculo.modelo ,null,Icon(Icons.view_module)),
                   Datos("Web GPS"       ,vehiculo.webgps ,null,Icon(Icons.web)),
                   Datos("Usuario GPS"   ,vehiculo.usergps,null,Icon(Icons.person)),
                   Datos("Contraseña GPS",vehiculo.pwdgps ,null,Icon(Icons.lock_open)),
                   Datos("Hoja De vida"  ,"Descargar"     ,vehiculo.hojadevida,Icon(Icons.file_download)),
                   ],
         );

  }
  Widget documento(tipo,numero,date,url) {
      
         return Column(
                children: <Widget>[
                          SizedBox(height: 10.0,),
                          Text(tipo,style: TextStyle(
                                           fontWeight: FontWeight.bold, 
                                           fontSize: 15.0
                                           )
                               ),
                          Datos("Numero"   ,numero              ,null,Icon(Icons.credit_card)),
                          Datos("Fecha"    ,fecha.formato(date) ,null,Icon(Icons.calendar_today)),
                          Datos("Documento","Descargar"         ,url ,Icon(Icons.file_download)),
                         ],
                 );

  }
  
  Widget quintarueda(Map quintarueda) {
         return Column(
         children: <Widget>[
                   SizedBox(height: 10.0,),
                   Text("Quinta Rueda",style: TextStyle(
                                          fontWeight: FontWeight.bold, 
                                          fontSize: 15.0
                                          )
                        ),
                   Datos("Entidad"  ,quintarueda['entidad']             ,null              ,Icon(Icons.credit_card)),
                   Datos("Resultado",quintarueda['resultado']           ,null              ,Icon(Icons.check)),
                   Datos("Fecha"    ,fecha.formato(quintarueda['fecha']),null              ,Icon(Icons.calendar_today)),
                   Datos("Documento","Descargar"                        ,quintarueda['url'],Icon(Icons.file_download)),
                   
                   ],
         );

  }

  Widget propetario(Vehiculo vehiculo) {
         return Column(
                children: <Widget>[
                         
                          Text("Propetario",style: TextStyle(
                                                   fontWeight: FontWeight.bold, 
                                                   fontSize: 15.0
                                                   )
                               ),
                          Datos("Nombre"            ,vehiculo.propetario['nombre']  ,null                              ,Icon(Icons.directions_car)),
                          Datos("NIT"               ,vehiculo.propetario['nit']     ,null                              ,Icon(Icons.view_module)),
                          Datos("Correo"            ,vehiculo.propetario['correo']  ,null                              ,Icon(Icons.web)),
                          Datos("Telefono"          ,vehiculo.propetario['telefono'],null                              ,Icon(Icons.person)),
                          Datos("Banco"             ,vehiculo.propetario['banco']   ,vehiculo.propetario['certificado'],Icon(Icons.lock_open)),
                          Datos("Camara de Comercio","Documento"                    ,vehiculo.propetario['urlcc']      ,Icon(Icons.lock_open)),
                          ],
         );



  }
  
  Widget titulo(texto)=>  Text(texto,style: TextStyle(
                                            fontWeight: FontWeight.bold, 
                                            fontSize: 15.0
                                          )
                         );

}