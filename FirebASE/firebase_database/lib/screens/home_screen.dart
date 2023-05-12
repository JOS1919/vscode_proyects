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
                   ListTile(
                    title: Text(snapshot.data![index]["name"]),
                    onTap: () {
                      Navigator.pushNamed(context, "/edit", arguments: {
                        "name":snapshot.data![index]["name"]
                      });
                    },
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

