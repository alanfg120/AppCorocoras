import 'package:flutter/material.dart';

Widget silverappbar(titulo,id,foto) {
    return SliverAppBar(
           iconTheme      :IconThemeData(
                           color: Colors.red
                           ),
           elevation      : 0.0,
           backgroundColor: Colors.white,
           expandedHeight : 200.0,
           floating       : false,
           pinned         : true,
           flexibleSpace  : FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            centerTitle : true,
                            title       : Text(
                                          titulo,
                                          style    : TextStyle(
                                                     color: Colors.red,
                                                     fontSize: 12.0,
                                                     )
                                          ),
                            background  : Center(
                                          child: Hero(
                                                 tag  : id,
                                                 child: foto == null
                                                      ? CircleAvatar(
                                                        radius         : 50.0,
                                                        backgroundColor: Colors.red,
                                                        child          : Text(
                                                                         titulo[0],
                                                                         overflow: TextOverflow.ellipsis,
                                                                         style: TextStyle(
                                                                                color   : Colors.white,
                                                                                fontSize: 50.0
                                                                                )
                                                                         ),
                                                        foregroundColor: Colors.red,
                                                        )
                                                      : CircleAvatar(
                                                        radius         : 50.0,
                                                        backgroundImage: NetworkImage(foto),
                                                        ),
                                                   )
                                                 ),
                              ),
    );
  }