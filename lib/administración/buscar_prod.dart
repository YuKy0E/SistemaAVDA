import 'package:avda/administraci%C3%B3n/dispo_prod.dart';
import 'package:flutter/material.dart';




// ignore: camel_case_types
class Buscar_prod extends StatefulWidget {
  const Buscar_prod({super.key});

  @override
  State<Buscar_prod> createState() => _Buscar_prodState();
}

// ignore: camel_case_types
class _Buscar_prodState extends State<Buscar_prod> {
   TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 153, 223),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        title: const Text(
          'Buscar producto',
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
                  'Buscar producto',
                  style: TextStyle(fontSize: 20),
                  )
                ),*/


            Container(
              
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  //prefixIcon: const Icon(Icons.lock), // Icono para la contraseña
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                  labelText: 'Codigo del producto',
                ),
              ),
            ),
            
            //controlar altura de separacion entre botones
            const SizedBox(height: 40, width: 50,), // Añade un espacio entre el campo de texto y el botón
            Center( // Centro el botón horizontalmente
            child: Container(
              width: 250, // Ancho fijo para el contenedor del botón
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>const Dispo_pro())
                            ),
                          },
                          style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
                  child: const Text(
                  'Buscar',
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