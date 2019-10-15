import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apptrans/src/componentes/notificaciones/notificaciones_model.dart';
import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:http/http.dart' as http;


class NotificacionProvider {
   final prefs = new PreferenciasUsuario();
        
  String _urlapi         = 'https://corocoras.apptransportes.com';
 
  final _streamcotroller = StreamController<List<Notificacion>>.broadcast();
  
  Function(List<Notificacion>) get notificacionesSink => _streamcotroller.sink.add;
  Stream<List<Notificacion>>   get notificacionesStream => _streamcotroller.stream;
  
  void disposeStreams()=>_streamcotroller?.close();
  
  Future<List<Notificacion>> getnotificaciones() async {
                             try {
                                  final resp = await http.get(
                                                 '$_urlapi/notificaciones/get',
                                                 headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                                 );
                                  if (resp.statusCode == 200){
                                  final decodedData = json.decode(resp.body);
                                  final notificaciones = new Notificaciones.fromJsonList(decodedData);
                                  notificacionesSink(notificaciones.items);
                                  return notificaciones.items;
                                  }
                              
                             } catch (e) {
                               Exception('$e');
                             }
                             
                             return [];
  }
}
