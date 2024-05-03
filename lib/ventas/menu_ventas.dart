// ignore_for_file: camel_case_types

import 'package:avda/ventas/sol_ord_ventas.dart';
import 'package:avda/ventas/status_orden_ventas.dart';
import 'package:flutter/material.dart';

class Menu_Ventas extends StatelessWidget {
  const Menu_Ventas({super.key});

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
          'Menu de ventas',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
              width: 250, // Ancho fijo para el contenedor del botón
              height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=> const sol_ord_ventas()) //pendiente por conectar
                            ),
                          },
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
            
              child: const Text(
                'Realizar orden de venta',
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
              width: 250, // Ancho fijo para el contenedor del botón
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=> const EstadoOrdenVentas())
                            )
                          },
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
                  child: const Text(
                    'Ver ordenes de ventas',
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