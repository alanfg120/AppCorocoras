import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:http/http.dart' as http;
import 'conductor_model.dart';

class ConductorProvider {
  
   final prefs = new PreferenciasUsuario();
        
  String _urlapi         = 'http://corocoras.apptransportes.com';
 
  final _conductorstreamcotroller = StreamController<List<Conductor>>.broadcast();
  final _operadorstreamcotroller  = StreamController<List<Conductor>>.broadcast();
  
  
  Function(List<Conductor>) get conductoresSink   => _conductorstreamcotroller.sink.add;
  Stream<List<Conductor>>   get conductoresStream => _conductorstreamcotroller.stream;

  Function(List<Conductor>) get operadoresSink   => _conductorstreamcotroller.sink.add;
  Stream<List<Conductor>>   get operadoresStream => _conductorstreamcotroller.stream;


  
  void disposeStreams(){
       _conductorstreamcotroller?.close();
       _operadorstreamcotroller?.close();

  }
  
  Future<List<Conductor>> getconductores() async {
                          try { 
                                final resp = await http.get(
                                             '$_urlapi/conductor/get/tipo/conductor',
                                             headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                             );
                                if (resp.statusCode == 200){
                                final decodedData = json.decode(resp.body);
                                final conductores = new Conductores.fromJsonList(decodedData);
                                conductoresSink(conductores.items);
                                return conductores.items;
                                }
                          } catch (e) {
                            Exception('$e');
                          
                          }
                           return [];
  }
  Future<List<Conductor>> getoperadores() async {
                          try { 
                                final resp = await http.get(
                                             '$_urlapi/conductor/get/tipo/operario',
                                             headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                             );
                                if (resp.statusCode == 200){
                                final decodedData = json.decode(resp.body);
                                final conductores = new Conductores.fromJsonList(decodedData);
                                operadoresSink(conductores.items);
                                return conductores.items;
                                }
                          } catch (e) {
                            Exception('$e');
                          
                          }
                           return [];
  }
 
}
