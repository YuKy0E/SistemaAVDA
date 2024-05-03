// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';


class OrdenVenta_ALM extends StatelessWidget {
  const OrdenVenta_ALM({super.key});
  

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
          'Orden de Venta',
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
          title: Text("Solicitud Orden de venta N° $index"),
          subtitle: const Padding(
            padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text("Ver Solicitud "),
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
                  title: const Text("Detalles de la Solicitud de Orden",
                  style: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Text("Nombre del Producto: Producto $index"),
                      const SizedBox(height: 8),
                      const Text("Código del producto: 123456"),
                      const SizedBox(height: 8),
                      const Text("Cantidad: 5"),
                      const SizedBox(height: 8),
                      

                    ],
                  ),
                  actions: [

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(Colors.red), // Color verde
                            ),
                      child: const Text('Declinar',
                      style: TextStyle(color: Colors.black,fontSize: 17),
                      ),
                        ),


                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStateProperty.all(Colors.green), // Color verde
                                ),
                                child: const Text('Aceptar',
                                style: TextStyle(color: Colors.black,fontSize: 17),
                                ),
                          ),


                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                            ),
                            child: const Text("Salir",
                            style: TextStyle(color: Colors.black,fontSize: 17),
                            ),
                          ),
                  ],
                );
              },
             );
            }, //showdialog
          ),
        ),



    );
  }
}

class ODV{
  String title;
  int codigo_producto;
  int piezas_requeridas;

   ODV (
      {
       required this.title,
       required this.codigo_producto, 
       required this.piezas_requeridas,
       }
   );
}
