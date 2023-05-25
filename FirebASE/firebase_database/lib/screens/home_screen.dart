import 'package:flutter/material.dart';

import '../services/firebase_service.dart';


class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      //DateTime currenDate = DateTime.now();

    return Scaffold(

     
     appBar: AppBar(
       title:  const Text("Ejemplo App"),
     ),
     body: FutureBuilder(
      future: getPepole(),
      builder: ((context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder:(context, index) {
            return
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                   Dismissible(
                    //!BORRA LOS DATOS DE LA BASE DE DATOS
                    onDismissed: (direction)async {
                        await deleteUser(snapshot.data![index]["uid"]);

                        //!ACUALIZA EL ARREGLO PARA QUE NO GENER ERROR AL REFRESCAR AL VISTA
                        snapshot.data?.removeAt( index);
                      
                    },
                    //!GENERA LA ACCION DE BORRAR PARA ACEPTAR O CANCELAR
                    confirmDismiss:(direction)async {
                      bool result = false;
                      result= await showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title:  Text("Alerta estas borrando a : ${snapshot.data![index]["name"]}"),
                          actions: [
                            TextButton(onPressed: (){
                              return Navigator.pop(
                                context,false
                              );
                            }, child: const Text("Cancelar")),

                            TextButton(onPressed: (){
                              return Navigator.pop(
                                context,true
                              );
                            }, child: const Text("Aceptar"))
                          ],
                        );
                      },);

                      return result;
                    }, 
                    direction: DismissDirection.endToStart,
                    key: Key(snapshot.data![index]["uid"]),
                    background: Container(
                      color: Colors.amber,
                     child:  const Icon(Icons.delete),
                    ),

                     child: ListTile(
                      title: Text(snapshot.data![index]["name"]),
                      onTap: () async {
                          await   Navigator.pushNamed(context, "/edit", arguments: {
                          "name":snapshot.data![index]["name"],
                          "uid": snapshot.data![index]["uid"]
                        });
                        setState(() {
                          
                        });
                      },
                     ),
                   ),
                   //Text(snapshot.data![index]["name"]),
                // Text(snapshot.data![index]["phone"]),
                  
                ]
              ),
            );

          } ,

          );
        }else{
          return const Center(
            //! CIRCULAR PROGRESS INDICADOR ******************************************************************
            child: CircularProgressIndicator(),
          );

        }

       
        
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         await  Navigator.pushNamed(context, "/add");
         setState(() {
           
         });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

