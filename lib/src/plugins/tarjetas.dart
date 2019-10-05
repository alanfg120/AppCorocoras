import 'package:apptrans/src/plugins/pdf_visor.dart';
import 'package:flutter/material.dart';

import 'format_date.dart';


class Tarjeta extends StatelessWidget {
  final List parametro;
  Tarjeta(this.parametro);
  final f = Format();
 @override
  Widget build(BuildContext context) {
    final pagecontroller      = new PageController(initialPage: 0);
    return  Container(
            height     : 400.0,
            child      : PageView.builder(
                         controller : pagecontroller,
                         itemCount  : parametro.length,
                         itemBuilder: (context, i) => tarjeta(parametro[i],context)
                                                  ),
                                           );
                           }
                         
    tarjeta(parametro,BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
                     top    : 15.0,
                     left   : 20.0,
                     right  : 20.0,
                     bottom : 35.0
                    ),
           child: SafeArea(
                    child: Card( 
                           elevation:5.0,
                         shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                         child: Column(
                                  children: <Widget>[
                                              Container(
                                              padding   : EdgeInsets.only(top: 20.0),
                                            alignment : Alignment.center,
                                            child     : Text(parametro['tipo'],style: TextStyle(color: Colors.red, fontSize: 20.0)),
                                             ),
                                            ListTile(
                                              leading  : Icon(Icons.description),
                                            title    : Text("Numero",        style: TextStyle(fontSize: 20.0)),
                                            subtitle : parametro['numero']== null
                                                     ? Text("Sin Dato",      style: TextStyle(fontSize: 15.0))
                                                     : Text(parametro['numero'], style: TextStyle(fontSize: 15.0)),
                                             ),
                                            ListTile(
                                              leading  : Icon(Icons.calendar_today),
                                            title    : Text("Fecha de vencimiento",   style: TextStyle(fontSize: 20.0)),
                                            subtitle : parametro['fecha'] == null
                                                     ? Text("Sin Fecha",              style: TextStyle(fontSize: 15.0))
                                                     : Text(f.formato(parametro['fecha']),style: TextStyle(fontSize: 15.0))
                                             ),
                                            ListTile(
                                              leading  : Icon(Icons.file_download),
                                            title    : Text("Documento", style: TextStyle(fontSize: 20.0)),
                                            subtitle : parametro['url'] == null
                                                     ? Text("Sin Documento")
                                                     : null,
                                            trailing : parametro['url'] == null
                                                     ? null
                                                     : GestureDetector(
                                                         onTap: (){
                                                           Navigator.push(context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => PdfVisor(url:parametro['url']  ),
                                                                        ),
                                                                      );

                                                       },
                                                        child:Image(height: 36.0,image: AssetImage('img/pdf.png'))
                                                      )
                                              ),
                                 ],
                          ),
                   ),
           ),
    );



    }
}
