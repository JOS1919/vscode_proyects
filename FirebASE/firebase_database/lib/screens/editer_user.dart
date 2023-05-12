//import 'package:firebase_database/services/firebase_service.dart';
import 'package:firebase_database/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditerUser extends StatefulWidget {
  const EditerUser({super.key});


  @override
  State<EditerUser> createState() => _EditerUserState();
}

class _EditerUserState extends State<EditerUser> {

  //!CONTROLA EL INGRESO DE DATOS EN LOS INPUT TEXT

    TextEditingController nameControler = TextEditingController(text: "");
    TextEditingController dpiControler = TextEditingController(text: "");
   // TextEditingController dateControler = TextEditingController(text: "");
    TextEditingController telControler = TextEditingController(text: "");
    //DateTime currenDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
        final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
        nameControler.text = arguments["name"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children:  [
            TextField(
              controller: dpiControler,
              decoration:  const InputDecoration(
                hintText: "Ingrese  DPI name"
              ),
            ),
            const  SizedBox(height: 20,),

             TextField(
            controller: nameControler,
              decoration: const InputDecoration(
                hintText: "Nombre a modificar"
              ),
            ),
            const  SizedBox(height: 20,),
             TextField(
             controller: telControler,
              decoration: const InputDecoration(
                hintText: "Telefono"
              ),
            ),

            const  SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async{
               await updateUsers(arguments["uid"], nameControler.text);


                
              }, 
              child: const Text("Actualizar"))
          ],
        ),
        
        
      )
    );
  }
}