import 'package:firebase_database/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});


  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  //!CONTROLA EL INGRESO DE DATOS EN LOS INPUT TEXT

    TextEditingController nameControler = TextEditingController(text: "");
    TextEditingController dpiControler = TextEditingController(text: "");
   // TextEditingController dateControler = TextEditingController(text: "");
    TextEditingController telControler = TextEditingController(text: "");
    //DateTime currenDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Usuario"),
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
                hintText: "Nombre"
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
               await addUsers(
                nameControler.text, 
                dpiControler.text,
                telControler.text).then((_) {
                  Navigator.pop(context, "/add");

                });

              //await addUsers(dpiControler.text);
              //await addUsers(telControler.text);
             // await addUsers(dateControler.text);


                
              }, 
              child: const Text("Enviar"))
          ],
        ),
        
        
      )
    );
  }
}