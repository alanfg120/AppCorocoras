import 'package:apptrans/src/componentes/login/login_provaider.dart';
import 'package:apptrans/src/plugins/preferencias_user.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String usuario;
  String pwd;

  double c             = 0;
  BorderRadius border  = BorderRadius.circular(50);
  final scaffoldKey    = GlobalKey<ScaffoldState>();
  final _login         = GlobalKey<FormState>();
  final prefs          = PreferenciasUsuario();
  final post           = LoginProvaider();
  final _focousuario   = FocusNode();
  final _focopassword  = FocusNode();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
           key  : scaffoldKey,
           body : GestureDetector(
                  onTap: ()=>FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                         padding : EdgeInsets.all(30),
                         child   : Form(
                                   key   : _login,
                                   child : Column(
                                           crossAxisAlignment : CrossAxisAlignment.stretch,
                                           children           : <Widget>[
                                                                 image(),
                                                                 input("Usuario",Icon(Icons.person),false,_focousuario),
                                                                 SizedBox(height: 20),
                                                                 input("Contraseña", Icon(Icons.lock),true,_focopassword),
                                                                 SizedBox(height: 60),
                                                                 boton(context)
                                                               ],
                                           ),
                                   
                                         ),
                             ),
           )
                
       );
        
  }

  Widget input(String text, Icon icono, bool password,FocusNode foco) {

         TextInputAction textinput;
         if(password)textinput=TextInputAction.send;
         else        textinput=TextInputAction.next;

         return TextFormField(
                 onChanged         : (value){
                                       if(password)pwd=value;
                                       else usuario=value;
                                     },
                 validator         : (value) {
                                      if(value.isEmpty)return "Es requerido";
                                      return null;
                                     },
                 onEditingComplete :(){
                                     if(password) onsubmit(context);
                                     else FocusScope.of(context).requestFocus(_focopassword);
                                     },                  
                 focusNode         : foco,
                 textInputAction   : textinput,
                 obscureText       : password,
                 decoration        : InputDecoration(
                                     errorStyle : TextStyle(color: Colors.pink),
                                     hintText   : text,
                                     border     : OutlineInputBorder(borderRadius: border),
                                     prefixIcon : icono
                                     ),
                                      );
   
  }

  Widget boton(context) {
         return RaisedButton(
                onPressed : ()=>onsubmit(context),
                shape     : RoundedRectangleBorder(borderRadius: border),
                padding   : EdgeInsets.all(15.0),
                textColor : Colors.white,
                color     : Colors.red,  
                child     : Text(
                            "Ingresar",
                             style: TextStyle(fontSize: 20.0),
                            ),         
                                        
              );
        
  }

Widget image() {
    return Container(
           width     : 250,
           height    : 250,
           padding   : EdgeInsets.all(50),
           alignment : Alignment.center,
           child     : Image(
                       image: AssetImage("img/logo2.png"),
                       ),
           );
  }

  void onsubmit(context) async {
       if (_login.currentState.validate()) {
                  final logeado= await post.login(usuario,pwd);
                  
                  if(logeado) Navigator.pushReplacementNamed(context, 'home');
                  else        scaffoldKey.currentState.showSnackBar(
                                                   SnackBar(
                                                   behavior : SnackBarBehavior.floating,
                                                   content  : Text('Datos Incorrectos'),
                                                   duration : Duration(seconds: 3),
                                                   action   : SnackBarAction(
                                                              textColor: Colors.pink,
                                                              onPressed: (){},
                                                              label: "Aceptar",
                                                             ),
                                                   )
                               );    
       }
}   
}


