// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


class EstadoOrdenVentas extends StatefulWidget {
  const EstadoOrdenVentas({super.key});

  @override
  State<EstadoOrdenVentas> createState() => _EstadoOrdenVentasState();
}

class _EstadoOrdenVentasState extends State<EstadoOrdenVentas> {
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
            'Estado de la orden de venta',
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

class EODV{
  String title;
  int codigo_producto;
  int piezas_requeridas;
  int precio;

   EODV (
      {
       required this.title,
       required this.codigo_producto, 
       required this.piezas_requeridas, 
       required this.precio,
       }
   );
}

//CODIGO PRUEBA DE LISTA
/*ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const ListTile(
                title: Text('Orden de venta'),
                subtitle: Text('Estado de orden'),
                leading: Icon(
                  Icons.view_list_sharp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          ),*/

/*
class EstadoOrdenVentas extends StatelessWidget {
  final List<String> orders = [
    '1. Orden...Producto',
    '2. Orden...Producto',
    '3. Orden...Producto',
    '4. Orden...Producto',
  ];

   EstadoOrdenVentas({super.key});

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
          'Estado de la orden',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Ordenes de Venta',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 34, 113, 149),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: Container(
              
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    child: ListTile(
                      title: Center(child: Text(orders[index])),
                      onTap: () {
                        _showDialog(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          
        },
        label: Text('Regresar'),
        icon: Icon(Icons.arrow_back),
        backgroundColor: const Color.fromARGB(255, 115, 206, 249),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

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
