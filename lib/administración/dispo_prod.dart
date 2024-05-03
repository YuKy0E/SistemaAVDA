// ignore_for_file: non_constant_identifier_names
// ignore: avoid_web_libraries_in_flutter

import 'package:avda/administraci%C3%B3n/Menu_Almacenista.dart';
import 'package:avda/administraci%C3%B3n/buscar_prod.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class Dispo_pro extends StatefulWidget {
  const Dispo_pro({super.key});

  @override
  State<Dispo_pro> createState() => _Dispo_pro();
}

// ignore: camel_case_types
class _Dispo_pro extends State<Dispo_pro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*title: const Text(
          'Inicio',
          ),*/
        backgroundColor: const Color.fromARGB(255, 174, 153, 223),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        title: const Text(
          'Disponibilidad del producto',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),


      body: //cuerpo(), 
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            /*Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ALMACEN',
                  style: TextStyle(
                      color: Color.fromARGB(255, 188, 119, 209),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
                
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Codigo del producto',
                  style: TextStyle(fontSize: 20),
                )),*/
                Container(
                  
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  //prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                   contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
                  labelText: 'Codigo del producto',
                ),
              ),
            ),
            Container(
              
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  //prefixIcon: const Icon(Icons.code),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                   contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
                  labelText: 'Piezas disponibles',
                ),
              ),
            ),
            

            const SizedBox(height: 40, ), // Añade un espacio entre el campo de texto y el botón
            Center( // Centro el botón horizontalmente
            child: Container(
                width: 230, // Ancho fijo para el contenedor del botón
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
      onPressed: ()=>{
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>const Buscar_prod())
                )
              },
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
    ),
      child: const Text(
        'Buscar otro producto',
          style: TextStyle(color: Colors.black, fontSize: 17),
          ),
    ),
            ),
            ),
            const SizedBox(height: 40, width: 50,), // Añade un espacio entre el campo de texto y el botón
            Center( // Centro el botón horizontalmente
            child: Container(
                width: 200, // Ancho fijo para el contenedor del botón
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  
                  onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>const Menu_Almacenista())
                            )
                          },
                          style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
                child: const Text('Regresar', 
                style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          ),
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}