import 'dart:convert';


import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:http/http.dart' as http;

class LoginProvaider {
String _urlapi = 'http://itl.apptransportes.com';
final prefs    = PreferenciasUsuario();

LoginProvaider();

Future<bool> login(user,pwd) async {
                   bool  logeado = false;

                   final  body   = json.encode({'username':user,'pwd':pwd});
                   try {
                        final  resp    = await http.post(
                                               '$_urlapi/usuario/login',
                                                headers : {"Content-Type": "application/json",},
                                                body    : body
                                                );
                   if (resp.statusCode == 200){
                                               final decodeData = json.decode(resp.body);
                                               prefs.token      = decodeData['token'];
                                               prefs.usuario    = user;
                                               logeado          = true;
                                              }
                   if(resp.statusCode == 400) logeado=false;
                   
                   
                   } catch (e) {
                     Exception('$e');
                     print("$e");
                   }
                
                    return logeado;
}

  
}