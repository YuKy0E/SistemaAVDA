// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';



class sol_ord_ventas extends StatelessWidget {
  const sol_ord_ventas({super.key});

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
          'Solicitud de ordenes',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),



      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            
            padding: EdgeInsets.all(16.0),
            child: Text(
              
              'Realizar orden de venta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Código de producto'),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.code),
                  border: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(radius), // Radio de esquina grande para hacerlo ovalado
                  ),
                    hintText: 'Ingrese el código',
                  ),
                ),
                const SizedBox(height: 20), // Espacio entre elementos
                const Text('Piezas solicitadas'),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.production_quantity_limits_outlined),
                  border: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(radius), // Radio de esquina grande para hacerlo ovalado
                  ),
                    hintText: 'Ingrese el número de piezas',
                  ),
                ),
              ],
            ),
          ),
          /*const SizedBox(height: 20), // Espacio entre elementos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Enviar orden de ventas
              },
              child: const Text('Enviar Orden de Ventas'),
            ),
          ),*/

          Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(
      height: 120.0, // Altura del espacio en la parte superior
    ),
    Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title: const Text("Orden de venta"),
                  content: const Text("La orden de venta se ha realizado."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Aceptar"),
                    ),
                  ],
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
          ),
          child: const Text(
            'Enviar Orden de Ventas',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    ),
        ],
      ),
        ]
      ),
    );
  }
}
/*
        void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingrese el código de producto y las piezas requeridas', 
            style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Código de Producto'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Piezas Requeridas'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Declinar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

}*/