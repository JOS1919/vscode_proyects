import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;



//!LEEE LO DATOS DE LA BASE DE DATOS Y LOS MUESTRA ****************
Future <List> getPepole() async {

  List users =[];
  CollectionReference collectionReferenceUsers = db.collection("users");
  QuerySnapshot  queryUsers = await collectionReferenceUsers.get();

  // ignore: avoid_function_literals_in_foreach_calls
  queryUsers.docs.forEach((element) {
    users.add(element.data());

  });

  await Future.delayed(const Duration(seconds:1) );

  return users;

}

//!GUARDA DATOS EN LA BASE DE DATOS *********************************
Future <void> addUsers(String name, String dpi,String tel) async{
  await db.collection("users").add({"name": name,"dpiPersonal":dpi,"phone":tel });

}

Future<void> updateUsers(String uid, String newName) async{
    await db.collection("users").doc(uid).update({"name":newName});
}