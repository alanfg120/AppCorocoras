import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:flutter/material.dart';

class ConfiguracionPage extends StatelessWidget {
  
  final prefs=PreferenciasUsuario();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar          : AppBar(
                             leading : Image(
                                       image : AssetImage("img/home.png"),
                                       ),
           backgroundColor : Colors.white,
           title           : Text(
                             "Configuracion", 
                              style: TextStyle(color: Colors.red)
                            )
          ),
           body            : ListView(
                             padding: EdgeInsets.only(top:20.0),
                             children: <Widget>[
                                        Image.asset('img/logo2.png'),
                                        SizedBox(height: 20.0,),
                                        ListTile(
                                        leading : Icon(Icons.person_pin,size: 40.0),
                                        title   : Text(prefs.usuario),
                                    
                                        ),
                                        ListTile(
                                        leading : Icon(Icons.info_outline,size: 40.0),
                                        title   : Text("Trasnapp"),
                                        subtitle: Text("v 1.0.0"),
                                        ),   
                                        
                                        ListTile(
                                        onTap   : (){
                                                   prefs.eraseall();
                                                   Navigator.pushReplacementNamed(context, 'login'); 
                                                 },

                                        leading : Icon(
                                                  Icons.power_settings_new,
                                                  size  : 40.0,
                                                  color : Colors.red,
                                                  ),
                                        title   : Text("Cerra Sesion"),
                                      
                                        )    
                             ],
                             ),
    );
  }
}
 