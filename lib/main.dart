import 'package:apptrans/src/componentes/login/login.dart';
import 'package:apptrans/src/componentes/rutas.dart';
import 'package:apptrans/src/plugins/hintextSearch.dart';
import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:flutter/material.dart';



void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 final prefs = new PreferenciasUsuario();
 await prefs.initPrefs();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    print(prefs.token);
    return MaterialApp(
        localizationsDelegates: [CustomLocalizationDelegate(),],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
               primarySwatch : Colors.red,
               appBarTheme   : AppBarTheme(
                               elevation  : 0.0, 
                               color      : Colors.white,
                               brightness : Brightness.light
                               )
           
        ),
        home: Login(),
        initialRoute: prefs.token == '' ? 'login':'home',
        routes: route()
        );
  }
}
