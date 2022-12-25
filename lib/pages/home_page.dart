
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  // con este objeto puedo apuntar a la coleccion en firebase 'tasks'
  CollectionReference tasksReference = FirebaseFirestore.instance.collection('tasks');


  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIREBASE FIRESTORE'),
      ),
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
              )
          ],
        ),
      ),
      
    );
  }
}