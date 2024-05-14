// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:avda/administraci%C3%B3n/Menu_Almacenista.dart';
import 'package:avda/administraci%C3%B3n/buscar_prod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dispo_pro extends StatefulWidget {
  final String codigoProducto;

  const Dispo_pro({super.key, required this.codigoProducto});

  @override
  State<Dispo_pro> createState() => _Dispo_proState();
}

class _Dispo_proState extends State<Dispo_pro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget
        .codigoProducto; // Asigna el valor de codigoProducto al campo de texto

    // Realiza la búsqueda en la base de datos y actualiza el valor de passwordController
    buscarProducto(widget.codigoProducto);
  }

  Future<void> buscarProducto(String codigoProducto) async {
    try {
      // Realiza la consulta en la colección "productos" con el código del producto
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('productos')
          .where('id_pro', isEqualTo: codigoProducto)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Si se encuentra el producto, obtén el valor de cant_pro y conviértelo a entero
        int piezasDisponibles = querySnapshot.docs.first['cant_pro'];

        // Actualiza el valor de passwordController
        setState(() {
          passwordController.text = piezasDisponibles.toString();
        });
      } else {
        // Si no se encuentra el producto, muestra un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Producto no encontrado'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // En caso de error, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al buscar el producto: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 125, 219),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                enabled: false,
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.barcode_reader), // Icono para codigo 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  labelText: 'Codigo del producto',
                  labelStyle: const TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                enabled: false,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  labelText: 'Piezas disponibles',
                  labelStyle: const TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 300,
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Buscar_prod()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 208, 181, 230)),
                  ),
                  child: const Text(
                    'Buscar otro producto',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 300,
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Menu_Almacenista()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 208, 181, 230)),
                  ),
                  child: const Text(
                    'Regresar',
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
