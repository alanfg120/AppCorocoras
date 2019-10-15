import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apptrans/src/componentes/vehiculos/vehiculo_model.dart';
import 'package:apptrans/src/plugins/preferencias_user.dart';

import 'package:http/http.dart' as http;


class VehiculoProvider {
  final prefs    =  new PreferenciasUsuario();
  String _urlapi = 'https://corocoras.apptransportes.com';
 



  final _mulastreamcotroller           = StreamController<List>.broadcast();
  final _gruasestreamcotroller    = StreamController<List>.broadcast();

 
  
  Function(List) get mulasSink          => _mulastreamcotroller.sink.add;
  Stream<List>   get mulasStream        => _mulastreamcotroller.stream;
  

  
  Function(List) get gruasSink    => _gruasestreamcotroller.sink.add;
  Stream<List>   get gruasStream => _gruasestreamcotroller.stream;

  void disposeStreams(){
  _gruasestreamcotroller?.close();

  _mulastreamcotroller?.close();

 }
  
 

  Future<List> getmulas() async {
                           try {
                                final resp = await http.get(
                                             '$_urlapi/vehiculo/get/tipo/mula',
                                             headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                             );
                                if (resp.statusCode == 200){
                                    final decodedData = json.decode(resp.body);
                                    final vehiculos = new Vehiculos.fromJsonList(decodedData);
                                    mulasSink(vehiculos.items);
                                    return vehiculos.items; 
                                }
                             
                           } catch (e) {
                             Exception('$e');
                           }
                          
                           return [];
  }


  Future<List> getgrua() async {
                                 try {
                                      final resp = await http.get(
                                                  '$_urlapi/vehiculo/get/tipo/grua',
                                                   headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                                   );
                                      if (resp.statusCode == 200){
                                          final decodedData = json.decode(resp.body);
                                          final vehiculos = new Vehiculos.fromJsonList(decodedData);
                                          gruasSink(vehiculos.items);
                                          
                                          return vehiculos.items; 
                                      }
                                 } catch (e) {
                                   Exception('$e');
                                 }
                                 
                                 return [];
  }
}