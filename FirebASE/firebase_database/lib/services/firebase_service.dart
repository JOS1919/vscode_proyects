import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;



//!LEEE LO DATOS DE LA BASE DE DATOS Y LOS MUESTRA ****************
Future <List> getPepole() async {

  List users =[];
 // CollectionReference collectionReferenceUsers = db.collection("users");
  QuerySnapshot  queryUsers = await db.collection("users").get();

  // ignore: avoid_function_literals_in_foreach_calls
  //queryUsers.docs.forEach((element) {
   // users.add(element.data());

 // });
  for(var doc in queryUsers.docs){
     final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
     final miUser={
        "name":data["name"],
        "uid":doc.id,
     };
     users.add(miUser);

  }

  return users;

}

//!GUARDA DATOS EN LA BASE DE DATOS *********************************
Future <void> addUsers(String name, String dpi,String tel) async{
  await db.collection("users").add({"name": name,"dpiPersonal":dpi,"phone":tel });

}

//!ACTUALIZAR LA BASE DE DATOS******************************************

Future<void> updateUsers(String uid, String newName) async{
    await db.collection("users").doc(uid).set({"name":newName});

}

//!BORRAR DATA FIREBASE----------------------------------------

Future<void> deleteUser(String uid) async{
    await db.collection("users").doc(uid).delete();

}
