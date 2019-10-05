import 'package:apptrans/src/componentes/trailers/trailer_model.dart';
import 'package:apptrans/src/componentes/trailers/trailer_provider.dart';
import 'package:apptrans/src/plugins/search.dart';

import 'package:flutter/material.dart';

class TrailerPage extends StatefulWidget {
   @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState  extends State<TrailerPage> {
  final trailerproveider = new TrailerProvider();

  Future<List> future;
  String tipo="Tanques";

  @override
  void initState() {
    future=trailerproveider.gettanque();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     
    final pagecontroller = new PageController(initialPage: 0);

    
    return Scaffold(
          appBar : AppBar(
                   leading :  Image(
                              image: AssetImage("img/home.png"),
                              ),
                   actions : <Widget>[
                              IconButton(
                              onPressed: () {
                                             showSearch(
                                             context  : context,
                                             delegate : DataSearch(
                                                        future,
                                                        'trailer'
                                                        ),
                                            );
                              },
                              icon: Icon(Icons.search),
                              color: Colors.red,
                              )
                             ], 
                   title   : Text(
                             tipo, 
                             style: TextStyle(color: Colors.red)
                            )
            ), 
          body : PageView(
                 onPageChanged: (value){
                                setState(() {
                                             switch (value) {
                                                    
                                                     case 0 : future=trailerproveider.gettanque();
                                                              tipo="Tanques";
                                                              break;
                                                     case 1 : future=trailerproveider.getcamabaja();
                                                              tipo="Camas Bajas";
                                                              break;
                                                     case 2 : future=trailerproveider.getcamaalta();
                                                              tipo="Camas Altas";
                                                              break;
                                             }
                                 });
                              },
                 controller : pagecontroller,
                 children   : <Widget>[
    
                               trailers(trailerproveider.gettanque,trailerproveider.tanqueStream),
                               trailers(trailerproveider.getcamabaja,trailerproveider.camabajaStream),
                               trailers(trailerproveider.getcamaalta,trailerproveider.camaaltaStream),
                               
                              ],
                 )
    );
   }

Widget trailers(future,stream) {
          return Container(
                 padding : EdgeInsets.only(top:20.0) ,
                 child   : RefreshIndicator(
                           onRefresh: future,
                           child: StreamBuilder(
                                  stream :  stream,
                                  builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                            return snapshot.hasData
                                                  ? listatrailers(snapshot.data)
                                                  : Center(child: CircularProgressIndicator());
                                },
                              ),
                         ),
                );
   }

Widget listatrailers(List<Trailer> trailer) {
         return ListView.builder(
                itemCount   : trailer.length,
                itemBuilder : (BuildContext context, int i) {
                               return ListTile(
                                      onTap    : ()=> Navigator.pushNamed(context,'trailer',arguments: trailer[i]),
                                      leading  : Hero(
                                                 tag   : trailer[i].placa,
                                                 child : trailer[i].fotofrontal == null 
                                                       ? CircleAvatar(
                                                         backgroundColor: Colors.red,
                                                         child: Text(
                                                                trailer[i].placa[0],
                                                                style:TextStyle(color: Colors.white) ,
                                                               ),   
                                                         )
                                                       : CircleAvatar(
                                                         backgroundImage: NetworkImage(trailer[i].fotofrontal),  
                                                       )
                                                 ),
                                      title    : Text(trailer[i].placa),
                                      subtitle : trailer[i].modelo == null
                                               ? Text("Sin Dato")         
                                               : Text(trailer[i].modelo)         
                                      );
                             },
         );
  }

}