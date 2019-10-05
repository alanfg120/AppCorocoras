

import 'package:flutter/material.dart';



class DataSearch extends SearchDelegate {

  String tipo;
  Future<List> future;

  DataSearch(this.future,this.tipo);
  
  @override
  List<Widget> buildActions(BuildContext context) {
  
    return [
             IconButton(
             onPressed : ()=>query='',
             icon      : Icon( Icons.clear ),
             )
           ];
  }

  @override
  Widget buildLeading(BuildContext context) {
         return IconButton(
                onPressed : ()=>close( context, null ),
                icon      : AnimatedIcon(
                            icon     : AnimatedIcons.menu_arrow,
                            progress : transitionAnimation,
                            ),
         );
  }

  @override
  Widget buildResults(BuildContext context)=>null;

  @override
  Widget buildSuggestions(BuildContext context) {
                          if ( query.isEmpty ) {
                               return Container();
                          }
                          return FutureBuilder(
                                 future  : future,
                                 builder : (BuildContext context, AsyncSnapshot<List> snapshot) {
                                            if( snapshot.hasData ) {
                                                List listaSugerida;
                                                if(tipo=='conductor'){
                                                   listaSugerida = snapshot.data.where( 
                                                                                    (p)=> p.nombre
                                                                                            .toLowerCase()
                                                                                            .startsWith(query.toLowerCase()))
                                                                                            .toList();
                                                  return listaconductores(listaSugerida);
                                                }
                                                if(tipo=='vehiculo' || tipo=='trailer'){
                                                   listaSugerida = snapshot.data.where( 
                                                                                    (p)=> p.placa
                                                                                            .toLowerCase()
                                                                                            .startsWith(query.toLowerCase()))
                                                                                            .toList();
                                                   return listavehiculos(listaSugerida);
                                                }
                                                return null;
                                                
                                                
                                            } 
                                            else return Center(child: CircularProgressIndicator());
                                 },
                          );


  }

 Widget listaconductores(conductores){
        return  ListView.builder(
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
 
 Widget listavehiculos(vehiculo) {
         return ListView.builder(
                itemCount: vehiculo.length,
                itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                     onTap    : ()=> Navigator.pushNamed(context,tipo,arguments: vehiculo[i]),
                                     leading  : Hero(
                                                tag   : vehiculo[i].placa,
                                                child : vehiculo[i].fotofrontal == null 
                                                      ? CircleAvatar(
                                                        backgroundColor: Colors.red,
                                                        child: Text(
                                                               vehiculo[i].placa[0],
                                                               style:TextStyle(color: Colors.white) ,
                                                              ),   
                                                        )
                                                      : CircleAvatar(
                                                        backgroundImage: NetworkImage(vehiculo[i].fotofrontal),  
                                                      )
                                                ),
                                     title    : Text(vehiculo[i].placa),
                                     subtitle : vehiculo[i].modelo == null
                                              ? Text("Sin Dato")         
                                              : Text(vehiculo[i].modelo)         
                                     );
                             },
         );
  }
}

