import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apptrans/src/componentes/trailers/trailer_model.dart';
import 'package:apptrans/src/plugins/preferencias_user.dart';

import 'package:http/http.dart' as http;


class TrailerProvider {
  final prefs    =  new PreferenciasUsuario();
  String _urlapi = 'https://corocoras.apptransportes.com';
 
  

  final _tanquestreamcotroller            = StreamController<List>.broadcast();
  final _camabajatreamcotroller           = StreamController<List>.broadcast();
  final _camaaltastreamcotroller          = StreamController<List>.broadcast();

  Function(List) get tanqueSink           => _tanquestreamcotroller.sink.add;
  Stream<List>   get tanqueStream         => _tanquestreamcotroller.stream;
  
  Function(List) get camabajaSink         => _camabajatreamcotroller.sink.add;
  Stream<List>   get camabajaStream       => _camabajatreamcotroller.stream;
  
  Function(List) get camaaltaSink         => _camaaltastreamcotroller.sink.add;
  Stream<List>   get camaaltaStream       => _camaaltastreamcotroller.stream;


  void disposeStreams(){

  _tanquestreamcotroller?.close();
  _camabajatreamcotroller?.close();
  _camaaltastreamcotroller?.close();
  }
  


  Future<List> gettanque() async {
               try {
                    final resp = await http.get(
                                  '$_urlapi/trailer/get/tanque',
                                  headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                  );
                    if (resp.statusCode == 200){
                        final decodedData = json.decode(resp.body);
                        final trailers = new Trailers.fromJsonList(decodedData);
                   
                        tanqueSink(trailers.items);
                        return trailers.items; 
                    }
               } catch (e) {
                 Exception('$e');
               }
               
                return [];
  }

  Future<List> getcamabaja() async {
               try {
                    final resp = await http.get(
                                 '$_urlapi/trailer/get/camabaja',
                                 headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                 );
            
                     if (resp.statusCode == 200){
                         final decodedData = json.decode(resp.body);
                         final trailers = new Trailers.fromJsonList(decodedData);
                         camabajaSink(trailers.items);
                         
                         return trailers.items; 
                     }
               } catch (e) {
                 Exception('$e');
               }
               
               return [];
  }
  Future<List> getcamaalta() async {
                try {
                      final resp = await http.get(
                                 '$_urlapi/trailer/get/camaalta',
                                 headers: {HttpHeaders.authorizationHeader: 'Bearer ${ prefs.token }'}
                                 );
                      if (resp.statusCode == 200){
                          final decodedData = json.decode(resp.body);
                          final trailers = new Trailers.fromJsonList(decodedData);
                          camaaltaSink(trailers.items);
                          return trailers.items; 
                      }
                } catch (e) {
                  Exception('$e');
                }
               
               return [];
  }
}