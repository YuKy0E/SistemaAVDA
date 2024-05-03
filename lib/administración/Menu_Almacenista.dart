// ignore_for_file: unused_import, camel_case_types, duplicate_ignore, file_names

import 'package:avda/administraci%C3%B3n/buscar_prod.dart';
import 'package:avda/principal/historialbus_vts.dart';
import 'package:flutter/material.dart';
import 'package:avda/administraci%C3%B3n/OrdenVenta_ALM.dart';
import 'package:avda/ventas/sol_ord_ventas.dart';


class Menu_Almacenista extends StatelessWidget {
  const Menu_Almacenista({super.key});

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
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        title: const Text(
          'Menu Almacenista',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      
            
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
              width: 210, // Ancho fijo para el contenedor del botón
              height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=> const OrdenVenta_ALM())
                            ),
                          },
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
            
              child: const Text(
                'Orden de Venta',
                style: TextStyle(color: Colors.black, fontSize: 17),
                ),
            ),

        ),
            const SizedBox(height: 40), // Separación entre los botones
            /*ElevatedButton(
              onPressed: () {
                // Lógica para la acción del botón "Buscar Producto"
              },
              child: const Text('Buscar Producto'),
            ),*/
            Container(
              width: 200, // Ancho fijo para el contenedor del botón
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
                    'Buscar Producto',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}



// ignore: camel_case_types
/*class almacen1 extends StatelessWidget {
  const almacen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almacen 1'),
        ),
    );
  }
}*/
/*
class Almacen2 extends StatelessWidget {
  const Almacen2({super.key});

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
          'Almacen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        ),
        body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              //LOGO -IMAGEN AGREGAR AQUI
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Opciones',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ALMACEN',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                 ),

              /*Image.asset(
                'assets/images/example_image.jpg', // Ruta de la imagen en tu proyecto
                width: 200,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,// Espacio entre la imagen y el texto
                children: [
                Expanded(
                  child: Center(
                  child: Image.asset('assets/Logo.png', width: 400, height: 300),
                    ),
                  ),
                ],
              ),*/

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: SizedBox(
                        height: 30.0, 
                        child: ElevatedButton(
                            onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>const Almacen2())
                            )
                          },
                          /*ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },*/
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                
                                'Iniciar Sesión',
                                style: TextStyle(color: Colors.black,fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              /*levatedButton(
                onPressed: (){
                   Navigator.pushNamed(context, 'Botón presionado');
                  // Acción a realizar cuando se presiona el botón
              },
               child: const Text('Iniciar Sesión'),
             ),*/
            ),
          ],
        ),
      ),
      ),
    );




  }
}
*/
