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
  int? requestedQuantity;

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
                const Text('Buscar producto por ID'),
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
                const Text('Piezas solicitadas'),
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
              widthFactor: 0.6,
              child: ElevatedButton(
                onPressed: _generateOrder,
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
      final productQuery = await FirebaseFirestore.instance
          .collection('productos')
          .where('id_pro', isEqualTo: productId)
          .get();
      final productDocs = productQuery.docs;

      if (productDocs.isNotEmpty) {
        final productData = productDocs.first.data() as Map<String, dynamic>?;
        if (productData != null) {
          final productCost = productData['costo_pro'] as double?;
          if (productCost != null) {
            final orderCost = productCost * requestedQuantity!;
            await FirebaseFirestore.instance.collection('ordenes').add({
              'id_prod': productId,
              'cant_ven': requestedQuantity!,
              'cost_ven': orderCost,
              'est_ord': false,
            });

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Orden de venta generada"),
                  content: Text("El costo de la orden es: $orderCost"),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text(
                "Por favor, ingrese un ID de producto válido y una cantidad válida."),
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
}
