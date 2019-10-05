import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';

class PdfVisor extends StatefulWidget {
  final String url;
  PdfVisor({this.url});
  _PdfVisorState createState() => _PdfVisorState();
}

class _PdfVisorState extends State<PdfVisor> {
    
    final   Dio dio   = new Dio();
    bool   _isLoading = true;
    PDFDocument document;
    
    @override
    void initState(){ 
         super.initState();
         loadpdf(widget.url);
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(

                   iconTheme      : IconThemeData(
                                     color: Colors.red
                                    ) ,
                   backgroundColor: Colors.white,
                   title          : Text(
                                    "Documento",
                                    style: TextStyle(color: Colors.red),
                                    ),
                   actions        : <Widget>[
                                     IconButton(
                                     icon     : Icon(Icons.share),
                                     onPressed: () async {
                                                   dialog("Espere por favor",false);
                                                   if(Platform.isIOS){
                                                      Directory tempDir  = await getTemporaryDirectory();
                                                      String    tempPath = tempDir.path;
                                                      String    dir      = '$tempPath/file.pdf';
                                                      await dio.download(widget.url, dir);
                                                      ShareExtend.share(dir, "file");
                                                   }
                                                   if(Platform.isAndroid){
                                                      Directory tempDir  = await getExternalStorageDirectory();
                                                      String    tempPath = tempDir.path;
                                                      String    dir      = '$tempPath/file.pdf';
                                                      await dio.download(widget.url, dir);
                                                      ShareExtend.share(dir, "file");
                                                   }
                                                   Navigator.of(context).pop();
                                                  },  
                                      )
                             ],
                  ),
           body  : Center(
                   child: _isLoading ?
                          CircularProgressIndicator() 
                          :PDFViewer(
                          document  : document,
                          showPicker: false,
                          )
                  ),
           
         );
    
  }


void loadpdf(url) async {
    try {
      document = await PDFDocument.fromURL(url);
     } catch (e) {
        dialog("Error al Visualizar el Documento", true);
       }
     setState(()=>_isLoading =false);
  }
void dialog(mensaje,close){
     showDialog(
     barrierDismissible : close,
     context            : context,
     builder            : (BuildContext context) {
                           return AlertDialog(
                                  elevation       : 0,
                                  backgroundColor : Colors.transparent,
                                  title           : Text(
                                                    mensaje,
                                                    style     : TextStyle(color:Colors.white),
                                                    textAlign : TextAlign.center 
                                                  ),
                                
                                  );
                           }
     ); 


}
}