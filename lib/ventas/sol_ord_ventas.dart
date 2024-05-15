import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sol_ord_ventas extends StatefulWidget {
  const sol_ord_ventas({Key? key}) : super(key: key);

  @override
  _sol_ord_ventasState createState() => _sol_ord_ventasState();
}

class _sol_ord_ventasState extends State<sol_ord_ventas> {
  final TextEditingController _searchController = TextEditingController();
  String productId = '';
  int costProduct = 0;
  int cantProduct = 0;
  int? requestedQuantity;
  var collection = FirebaseFirestore.instance.collection('productos');

  Future<void> _getProductByIdPro() async {
    // Realiza la consulta a Firestore buscando documentos que tengan la propiedad 'id_pro' igual al valor proporcionado
    QuerySnapshot productQuery =
        await collection.where('id_pro', isEqualTo: productId).get();

    // Verifica si se encontraron documentos
    if (productQuery.docs.isNotEmpty) {
      // Accede a los documentos encontrados
      for (DocumentSnapshot doc in productQuery.docs) {
        Map<String, dynamic> productData = doc.data() as Map<String, dynamic>;

        print('Nombre del producto: ${productData['nom_pro']}');
        print('Precio del producto: ${productData['cost_pro']}');
        print('Cantidad del producto: ${productData['cant_pro']}');
        costProduct = productData['cost_pro'] as int;
        cantProduct = productData['cant_pro'] as int;
      }
      _generateOrder();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("El código de producto ingresado no existe."),
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
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 52, 34, 212)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Buscar producto por ID',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      productId = value;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Ingrese el ID del producto',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Piezas solicitadas',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                TextFormField(
                  onChanged: (value) => requestedQuantity = int.tryParse(value),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.production_quantity_limits_outlined),
                    hintText: 'Ingrese el número de piezas',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: ElevatedButton(
                onPressed: _getProductByIdPro,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 208, 181, 230)),
                ),
                child: const Text(
                  'Generar Orden de Ventas',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateOrder() async {
    if (productId.isNotEmpty &&
        requestedQuantity != null &&
        requestedQuantity! > 0) {
      // Obtener el último ID de orden generado
      DocumentSnapshot lastOrder = await FirebaseFirestore.instance
          .collection('ordenes')
          .orderBy('id_ord', descending: true)
          .limit(1)
          .get()
          .then((value) => value.docs.first);

      int lastOrderId = (lastOrder.exists)
          ? (lastOrder.data() as Map<String, dynamic>)['id_ord']
          : 0;

      final orderCost = costProduct * requestedQuantity!;

      // Generar nueva orden con el ID incrementado
      await FirebaseFirestore.instance.collection('ordenes').add({
        'id_ord': lastOrderId + 1,
        'id_prod': productId,
        'cant_ven': requestedQuantity!,
        'cost_ven': orderCost,
        'est_ord': false,
        'acept_ord': false,
        'com_ord': "Solicitud no evaluada"
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Orden de venta generada",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 46, 42, 94)),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text(
                      "Numero de orden: ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 70, 13)),
                    ),
                    Text(
                      "$lastOrderId",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Espacio entre los textos

                Row(
                  children: [
                    const Text(
                      "Costo total de la orden: ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 70, 13)),
                    ),
                    Text(
                      "$orderCost pesos",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),

                SizedBox(height: 8), // Espacio entre los textos

                Row(
                  children: [
                    const Text(
                      "Cantidad solicitada: ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 70, 13)),
                    ),
                    Text(
                      "$requestedQuantity piezas",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),

                SizedBox(height: 8), // Espacio entre los textos,

                Row(
                  children: [
                    const Text(
                      "Producto solicitado: ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 70, 13)),
                    ),
                    Text(
                      " $productId",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Aceptar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 208, 181, 230)),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 0.4,
                      horizontal:
                          10.0)), // Ajusta el tamaño del botón cambiando el padding
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
