
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  // con este objeto puedo apuntar a la coleccion en firebase 'tasks'
  CollectionReference tasksReference = FirebaseFirestore.instance.collection('tasks');

  // gestiona un flujo de eventos, objetos, enteros, podemos ir controlando
// es un future pero contiene una cadena 
Stream<int> counter() async*{
  for(int i = 0; i<10;i++){
    yield i;
    await Future.delayed(const Duration(seconds:2));
  }
}

// retorno de un valor unico
 Future<int> getNumber() async {
   return 1000;
 } // podemos construiro con un futurebuilder

  @override
  
  Widget build(BuildContext context) {
    /*counter().listen((event) { 
      print(event);
    });*/


    return Scaffold(
      appBar: AppBar(
        title: Text('FIREBASE FIRESTORE'),
      ),
      body: StreamBuilder(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
                int data = snapshot.data;
                return Center(child: Text(data.toString(), style: TextStyle(fontSize:50),),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
      
      /*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  /*
                  QuerySnapshot collection = value;
                  List<QueryDocumentSnapshot> docs = collection.docs;
                  QueryDocumentSnapshot doc = docs[0];
                  // se imprime el id y la data por separado 
                  print(doc.id);
                  print(doc.data());
                  */
                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) { 
                    Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                    //print(element.data());
                  });

                });
              }, 
              child: Text('obtener la data')
              ),
            
            ElevatedButton(
              onPressed: () {
                  tasksReference.add(
                    {
                      'title': 'ir de compras al super 3',
                      'description': 'debemos comprar comida para todo la mes',
                    },
                  ).then((DocumentReference value) {
                    print(value.id);
                  }).catchError((error){
                    print('ocurrio un error en el registro');
                  }).whenComplete((){
                    print('el resgistro ha terminado');
                  });
              }, 
              child:Text(
                'agregar documento',
            ),
            ),
           //actualizaciones 
            ElevatedButton(onPressed: (){
              tasksReference.doc('8ElHEKI7nifYRk6EYJhw').update(
                {
                  'title': 'ver la serie de dahmer',
                  'description' : 'empieza a las 8 pm',
                },
              ).catchError((error){
                    print('ocurrio un error en la actualizacion');
                  },
                  ).whenComplete(
                    (){
                    print('actualizacion terminada');
                  },
                  );
            }, 

            child: Text('actualizar documento'
            ),
            ),

            ElevatedButton(onPressed: () {
              tasksReference.doc('PNWDAEdSqHfVJMZkIVcZ').delete().catchError((error){
                print('ocurrio un error en la eliminacion');
              },
              ).whenComplete(() {
                  print('elimacion de documento completada');
              },
              );
            }, 
            
            child: Text(
              'eliminar documento',
            ),
            ),
              // crear documento personalizado
               ElevatedButton(onPressed: () {
              tasksReference.doc('personalizar003').set(
              {
                  'title': 'ir al concierto',
                  'descrption':'este fin de semana se presenta grupo 5, habra chela',

              },
              ).catchError((error){
                print('ocurrio un error en la creacion del documento personalizado');
              },
              ).whenComplete(() {
                  print('creacion del documento personalizado completo');
              },
              );
            }, 
            
            child: Text(
              'crear documento personalizado',
            ),
            ),


          ],
        ),
      ),
      */
      
    );
    
  }
}


/*
void main() {
 // stream
  counter ().listen((value){
    print(value);
  });
}
// retorno de un valor unico
 Future<int> getNumber() async {
   return 1000;
   //la funcion termina aqui
 }

// gestiona un flujo de eventos, objetos, enteros, podemos ir controlando
Stream<int> counter() async*{
  for(int i = 0; i<10;i++){
    yield i;
    await Future.delayed(Duration(seconds:2));
  }
  
}

*/