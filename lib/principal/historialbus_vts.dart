// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';


class historial extends StatefulWidget {
  const historial( {super.key});

  @override
  State<historial> createState() => _historialState();
}

class _historialState extends State<historial> {
  get index => null;
  
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
            'Historial de busqueda',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body:
        ListView.builder(
          itemCount: 10,
          itemBuilder:(context, index) => ListTile(
          title: Text("Orden de venta N° $index"),
          subtitle: const Padding(
            padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text("Ver Estado "),
              Text("de la orden"),
                ],
              ),
            ),
            leading: const Icon(
                  Icons.view_list_sharp,
                  color: Colors.green,
            ),
            onTap: () {
            // Abre la ventana emergente al hacer clic
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Detalles de la Orden"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Estado: Aceptada"),
                      const SizedBox(height: 8),
                      Text("Nombre del Producto: Producto $index"),
                      const SizedBox(height: 8),
                      const Text("Código del producto: 123456"),
                      const SizedBox(height: 8),
                      const Text("Cantidad: 5"),
                      const SizedBox(height: 8),
                      const Text("Precio: \$50"),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Salir"),
                    ),
                  ],
                );
              },
             );
            },
          ),
        ),
    );
  }
}