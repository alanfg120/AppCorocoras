import 'package:apptrans/src/componentes/conductores/conductor_model.dart';
import 'package:apptrans/src/componentes/conductores/conductor_provider.dart';
import 'package:apptrans/src/plugins/search.dart';
import 'package:flutter/material.dart';

class ConductoresPage extends StatefulWidget {
  const ConductoresPage({Key key}) : super(key: key);

  @override
  _ConductoresPageState createState() => _ConductoresPageState();
}

class _ConductoresPageState extends State<ConductoresPage> {
  final conductorproveider = new ConductorProvider();
   
  get  getconductores   => conductorproveider.getconductores;
  get  getoperadores    => conductorproveider.getoperadores;


  get  streamconductores   => conductorproveider.conductoresStream;
  get  streamoperadores    => conductorproveider.operadoresStream;
 

  String tipo="Conductores";
  Future<List> future;

  @override
  void initState() {
    super.initState();
    future=conductorproveider.getconductores();
  }
  @override
  Widget build(BuildContext context) {
    final pagecontroller = new PageController(initialPage: 0);
    return Scaffold(
           appBar: AppBar(
                   leading        : Image.asset('img/home.png'),
                   actions        : <Widget>[
                                    IconButton(
                                    onPressed :  () {
                                                    showSearch(
                                                    context  : context,
                                                    delegate : DataSearch(
                                                               future,
                                                              'conductor'
                                                              ),
                                                   );
                                                },
                                    icon      : Icon(Icons.search),
                                    color     : Colors.red,
                                    )
                                   ],
                   title          : Text(tipo, style: TextStyle(color: Colors.red))
                  ),
           body:  PageView(
                 onPageChanged: (value){
                                setState(() {
                                         if(value==0){
                                            future=conductorproveider.getconductores();
                                            tipo="Conductores";
                                          }
                                         if(value==1){
                                            future=conductorproveider.getoperadores();
                                            tipo="Operadores";
                                          }
                                         
                                        
                                    });
                                 },
                 controller : pagecontroller,
                 children   : <Widget>[
                               conductores(getconductores,streamconductores),
                               conductores(getoperadores,streamoperadores),
                              
                             
                       
                              ],
                 )
           
           
           
            /* Container(
                 padding: EdgeInsets.only(top: 20.0),
                 child:   RefreshIndicator(
                          onRefresh: conductorproveider.getconductores,
                          child: StreamBuilder(
                                 stream :  conductorproveider.conductoresStream,
                                 builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                           return snapshot.hasData
                                           ? listaconductores(snapshot.data)
                                           : Center(child: CircularProgressIndicator());
                                },
                              ),
                         ),
                  ), */
     );
  }
  
Widget conductores(future,stream) {
          return Container(
                 padding : EdgeInsets.only(top:20.0) ,
                 child   : RefreshIndicator(
                           onRefresh: future,
                           child: StreamBuilder(
                                  stream : stream,
                                  builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                            return snapshot.hasData
                                                  ? listaconductores(snapshot.data)
                                                  : Center(child: CircularProgressIndicator());
                                },
                              ),
                         ),
                                
                        
                  );
   }

  Widget listaconductores(List<Conductor> conductores) {
    return ListView.builder(
           itemCount   : conductores.length,
           itemBuilder : (BuildContext context, int i) {
                          return ListTile(
                                 onTap: () {
                                 Navigator.pushNamed(context,'conductor',arguments: conductores[i]);
                                 },
                                 leading: Hero(
                                          tag   : conductores[i].cedula,
                                          child : conductores[i].urlfoto == null
                                                ? CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  child          : Text(
                                                                   conductores[i].nombre[0],
                                                                   style: TextStyle(color:Colors.white),
                                                                   ),
                                                  )
                                                : CircleAvatar(
                                                  backgroundImage: NetworkImage(conductores[i].urlfoto),
                                                  ),
                                           ),
                                 title    : Text(conductores[i].nombre),
                                 subtitle : Text(conductores[i].email),
          );
        }
    );
  }
}
