// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Venta>> getVentas() async {
  List<Venta> ventas = [];
  CollectionReference collectionReferenceVentas = db.collection("ordenes");
  CollectionReference collectionReferenceProductos = db.collection("productos");

  QuerySnapshot queryVentas = await collectionReferenceVentas.get();
  QuerySnapshot queryProductos = await collectionReferenceProductos.get();

  for (var element in queryVentas.docs) {
    for (var element1 in queryProductos.docs) {
      if (element['id_prod'] is String && element1['id_pro'] is String) {
        if (element['id_prod'] == element1['id_pro']) {
          Venta venta = Venta(
            id: element.id, // ID del documento
            nom_prod: element1['nom_pro'], // Nombre del producto
            id_prod: element['id_prod'], // Código del producto
            cant_ven: element['cant_ven'], // Cantidad vendida
            est_ord: element['est_ord'], // Estado de la orden
          );
          if (!venta.est_ord) {
            ventas.add(venta);
          }
        }
      }
    }
  }
  return ventas;
}

class Venta {
  final String id; // ID del documento
  final String nom_prod; // Nombre del producto
  final String id_prod; // Código del producto
  final int cant_ven; // Cantidad vendida
  final bool est_ord; // Estado de la orden
  final String com_ord; //Comentario de la orden
  final bool acept_ord;

  Venta({
    required this.id,
    required this.nom_prod,
    required this.id_prod,
    required this.cant_ven,
    required this.est_ord,
    this.com_ord = '',
    this.acept_ord = true,
  });
}

Future<void> updateField(String documentId, String comentario) async {
  try {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('ordenes').doc(documentId);

    await docRef.update({
      'est_ord': true,
      'com_ord': comentario,
      'acept_ord': false,
    });

    print('Campo actualizado correctamente en la base de datos.');
  } catch (error) {
    print('Error al actualizar el campo en la base de datos: $error');
  }
}

Future<void> acceptOrder(String documentId, int cantidadVendida) async {
  try {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('ordenes').doc(documentId);

    await docRef.update({
      'acept_ord': true,
    });

    // Obtener el ID del producto vendido
    DocumentSnapshot orderSnapshot = await docRef.get();
    Map<String, dynamic>? orderData =
        orderSnapshot.data() as Map<String, dynamic>?;

    if (orderData != null && orderData.containsKey('id_prod')) {
      String productId = orderData['id_prod'];

      // Actualizar la cantidad de productos en la colección "productos"
      DocumentReference productRef =
          FirebaseFirestore.instance.collection('productos').doc(productId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot productSnapshot = await transaction.get(productRef);
        Map<String, dynamic>? productData =
            productSnapshot.data() as Map<String, dynamic>?;

        if (productData != null && productData.containsKey('cant_pro')) {
          int currentQuantity = productData['cant_pro'] ?? 0;
          int newQuantity = currentQuantity - cantidadVendida;
          if (newQuantity >= 0) {
            transaction.update(productRef, {'cant_pro': newQuantity});
          } else {
            throw Exception('No hay suficientes productos en inventario.');
          }
        }
      });

      print(
          'Orden aceptada correctamente y cantidad de productos actualizada.');
    } else {
      throw Exception('No se pudo obtener el ID del producto de la orden.');
    }
  } catch (error) {
    print(
        'Error al aceptar la orden y actualizar la cantidad de productos: $error');
  }
}

class OrdenVenta_ALM extends StatefulWidget {
  const OrdenVenta_ALM({Key? key}) : super(key: key);

  @override
  _OrdenVenta_ALMState createState() => _OrdenVenta_ALMState();
}

class _OrdenVenta_ALMState extends State<OrdenVenta_ALM> {
  late TextEditingController textFieldController;

  @override
  void initState() {
    super.initState();
    textFieldController = TextEditingController();
  }

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
        body: FutureBuilder(
            future: getVentas(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  //Aqui empieza la construccion de las solicitudes
                  itemBuilder: (context, index) => ListTile(
                      title: Text("Solicitud Orden de venta N° ${index + 1}"),
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
                      //Aqui acaba la parte de la solicitud (almenos de la vista pricipal)
                      onTap: () {
                        // Abre la ventana emergente al hacer clic
                        // Abre la ventana emergente al hacer clic
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                // Limpia el TextField cuando se toca fuera del área del menú
                                textFieldController.clear();
                                Navigator.of(context).pop();
                              },
                              child: AlertDialog(
                                title: const Text(
                                  "Detalles de la Solicitud de Orden",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        "Nombre del Producto: ${snapshot.data?[index].nom_prod}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Código del producto: ${snapshot.data?[index].id_prod}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Cantidad: ${snapshot.data?[index].cant_ven}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Estado: ${snapshot.data?[index].est_ord}"),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'Escribe aquí',
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      String nuevaDescripcion =
                                          textFieldController.text;
                                      updateField(snapshot.data![index].id,
                                          nuevaDescripcion);
                                      textFieldController.clear();
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    style: ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red), // Color verde
                                    ),
                                    child: const Text(
                                      'Declinar',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      acceptOrder(snapshot.data![index].id,
                                          snapshot.data![index].cant_ven);
                                      textFieldController.clear();
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    style: ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green), // Color verde
                                    ),
                                    child: const Text(
                                      'Aceptar',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      textFieldController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 208, 181, 230)),
                                    ),
                                    child: const Text(
                                      "Salir",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } //showdialog
                      ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }))

        // ListView.builder(
        //   itemCount: 10,
        //   //Aqui empieza la construccion de las solicitudes
        //   itemBuilder: (context, index) => ListTile(
        //     title: Text("Solicitud Orden de venta N° $index"),
        //     subtitle: const Padding(
        //       padding: EdgeInsets.only(left: 8),
        //       child: Row(
        //         children: [
        //           Text("Ver Solicitud "),
        //           Text("de la orden"),
        //         ],
        //       ),
        //     ),
        //     leading: const Icon(
        //       Icons.view_list_sharp,
        //       color: Colors.green,
        //     ),
        //     //Aqui acaba la parte de la solicitud (almenos de la vista pricipal)
        //     onTap: () {
        //       // Abre la ventana emergente al hacer clic
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return AlertDialog(
        //             title: const Text(
        //               "Detalles de la Solicitud de Orden",
        //               style: TextStyle(color: Colors.black, fontSize: 20),
        //             ),
        //             content: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Text("Nombre del Producto: Producto $index"),
        //                 const SizedBox(height: 8),
        //                 const Text("Código del producto: 123456"),
        //                 const SizedBox(height: 8),
        //                 const Text("Cantidad: 5"),
        //                 const SizedBox(height: 8),
        //               ],
        //             ),
        //             actions: [
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 style: ButtonStyle(
        //                   alignment: Alignment.center,
        //                   backgroundColor: MaterialStateProperty.all(
        //                       Colors.red), // Color verde
        //                 ),
        //                 child: const Text(
        //                   'Declinar',
        //                   style: TextStyle(color: Colors.black, fontSize: 17),
        //                 ),
        //               ),
        //               ElevatedButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 style: ButtonStyle(
        //                   alignment: Alignment.center,
        //                   backgroundColor: MaterialStateProperty.all(
        //                       Colors.green), // Color verde
        //                 ),
        //                 child: const Text(
        //                   'Aceptar',
        //                   style: TextStyle(color: Colors.black, fontSize: 17),
        //                 ),
        //               ),
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 style: ButtonStyle(
        //                   alignment: Alignment.center,
        //                   backgroundColor: MaterialStateProperty.all(
        //                       const Color.fromARGB(255, 208, 181, 230)),
        //                 ),
        //                 child: const Text(
        //                   "Salir",
        //                   style: TextStyle(color: Colors.black, fontSize: 17),
        //                 ),
        //               ),
        //             ],
        //           );
        //         },
        //       );
        //     }, //showdialog
        //   ),
        // ),
        );
  }
}

class ODV {
  String title;
  int codigo_producto;
  int piezas_requeridas;

  ODV({
    required this.title,
    required this.codigo_producto,
    required this.piezas_requeridas,
  });
}
