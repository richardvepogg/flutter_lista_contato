import 'dart:html';
import 'dart:io';
import 'dart:ui';
import 'dart:html';

import 'package:contatos/helpers/database_helper.dart';
import 'package:contatos/models/contatos.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

DatabaseHelper db = DatabaseHelper();
List<Contato> contatos = List<Contato>();


@override
void initState(){
  super.initState();

 
//Contato c = Contato(1,"Maria","maria@oul.com.br,teste.jpg");
//db.insertContato(c);
//Contato c1 = Contato(2,"Pedro","pedro@oul.com.br","teste2.jpg");
//db.insertContato(c1);

//db.getContatos().then( (lista){
  //print(lista);
//});

db.getContatos().then((lista){
  setState(() {
   contatos = lista; 
  });
});

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor:  Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contatos.length,
        itemBuilder: (context,index){
           return _listaContatos(context,index );
                   },
                 )
               );
             }
           
              _listaContatos(BuildContext context, int index) {
                return GestureDetector(
                  child : Card(
                    child : Padding(padding: EdgeInsets.all(10.0),
                    child : Row(
                      children: <Widget>[
                        Container(
                          width: 70.0, height: 70.0,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:contatos[index].imagem != null ?
                              FileImage(File(contatos[index].imagem)) :
                              AssetImage("images/pessoa.png")
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(contatos[index].nome ?? "",
                              style: TextStyle(fontSize: 20)
                              ),
                              Text(contatos[index].email ?? "",
                              style: TextStyle(fontSize: 15)
                              )
                            ],
                          )
                        )
                      ],
                    )
                  )
                ) ,
                );
                
              }






}

