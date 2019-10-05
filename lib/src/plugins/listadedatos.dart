import 'package:apptrans/src/plugins/pdf_visor.dart';
import 'package:flutter/material.dart';


class Datos extends StatelessWidget {
  
 final String titulo;
 final String dato;
 final String url;
 final Icon   icono;
 Datos(this.titulo,this.dato,this.url,this.icono); 

  @override
  Widget build(BuildContext context) {
     return Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ListTile(
                leading  : icono,
                title    : titulo == null
                         ? Text("Sin Dato",style: TextStyle(fontSize: 20.0))
                         : Text(titulo    ,style: TextStyle(fontSize: 20.0)),
                subtitle : dato == null
                         ? Text("Sin Dato",style: TextStyle(fontSize: 16.0))
                         : Text(dato,      style: TextStyle(fontSize: 16.0)),
                trailing : url == null
                         ? null
                         : GestureDetector(
                           onTap: (){
                           Navigator.push(context,
                                          MaterialPageRoute(
                                          builder: (context) => PdfVisor(url: url),
                                          ),
                                        );
                           },
                           child:Image(height: 36.0,image: AssetImage('img/pdf.png'))
                          )
                    ),
            Divider(height: 1.0)
          ],
        )
    );
  }
}




