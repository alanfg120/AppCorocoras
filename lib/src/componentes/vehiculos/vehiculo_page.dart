import 'package:apptrans/src/componentes/vehiculos/vehiculo_model.dart';
import 'package:apptrans/src/componentes/vehiculos/vehiculo_provaider.dart';
import 'package:apptrans/src/plugins/search.dart';
import 'package:flutter/material.dart';

class VehiculoPage extends StatefulWidget {
   @override
  _VehiculoPageState createState() => _VehiculoPageState();
}

class _VehiculoPageState extends State<VehiculoPage> {
  final vehiculoproveider = new VehiculoProvider();

  get  getmulas       => vehiculoproveider.getmulas;
  get  getgruas       => vehiculoproveider.getgrua;


  get  streammulas       => vehiculoproveider.mulasStream;
  get  streamgruas      => vehiculoproveider.gruasStream;
   
  String tipo="Vehiculos";
  Future<List> future;
  @override
  void initState() {
    super.initState();
    future=vehiculoproveider.getmulas();
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
                                                        'vehiculo'
                                                        ),
                                            );
                                            
                                         },
                              icon: Icon(Icons.search),
                              color: Colors.red,
                              )
                             ], 
                   title   : Text(tipo,style: TextStyle(color: Colors.red))
            ), 
          body : PageView(
                 onPageChanged: (value){
                                setState(() {
                                         
                                         if(value==0){
                                            future=vehiculoproveider.getmulas();
                                            tipo="Vehiculos";
                                          }
                                          if(value==1){
                                             future=vehiculoproveider.getgrua();
                                             tipo="Gruas";
                                          }
                                        
                                    });
                                 },
                 controller : pagecontroller,
                 children   : <Widget>[
                             
                           
                               vehiculos(getmulas,streammulas),
                               vehiculos(getgruas,streamgruas),
                       
                              ],
                 )
    );
   }

Widget vehiculos(future,stream) {
          return Container(
                 padding : EdgeInsets.only(top:20.0) ,
                 child   : RefreshIndicator(
                           onRefresh: future,
                           child: StreamBuilder(
                                  stream : stream,
                                  builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                            return snapshot.hasData
                                                  ? listavehiculos(snapshot.data)
                                                  : Center(child: CircularProgressIndicator());
                                },
                              ),
                         ),
                                
                        
                  );
   }


Widget listavehiculos(List<Vehiculo> volqueta) {
         return ListView.builder(
                itemCount: volqueta.length,
                itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                     onTap    : ()=> Navigator.pushNamed(context,'vehiculo',arguments: volqueta[i]),
                                     leading  : Hero(
                                                tag   : volqueta[i].placa,
                                                child : volqueta[i].fotofrontal == null 
                                                      ? CircleAvatar(
                                                        backgroundColor: Colors.red,
                                                        child: Text(
                                                               volqueta[i].placa[0],
                                                               style:TextStyle(color: Colors.white) ,
                                                              ),   
                                                        )
                                                      : CircleAvatar(
                                                        backgroundImage: NetworkImage(volqueta[i].fotofrontal),  
                                                      )
                                                ),
                                     title    : Text(volqueta[i].placa),
                                     subtitle : volqueta[i].marca == null
                                              ? Text("Sin Dato")         
                                              : Text(volqueta[i].marca)         
                                     );
                             },
         );
  }

}