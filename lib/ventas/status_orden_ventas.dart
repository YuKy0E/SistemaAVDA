import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EstadoOrdenVentas extends StatefulWidget {
  @override
  _EstadoOrdenVentasState createState() => _EstadoOrdenVentasState();
}

class _EstadoOrdenVentasState extends State<EstadoOrdenVentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado de Ordenes de Ventas'),
      ),
      body: _buildOrdenesList(),
    );
  }

  Widget _buildOrdenesList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('ordenes')
          .orderBy('id_ord', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return CircularProgressIndicator();
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) {
            return ListTile(
              title: Text('Orden de Venta: ${doc['id_ord']}'),
              onTap: () {
                _mostrarDetallesOrden(context, doc);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _mostrarDetallesOrden(BuildContext context, DocumentSnapshot doc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de la Orden de Venta: ${doc['id_ord']}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID de Producto: ${doc['id_prod']}'),
              Text('Cantidad solicitada: ${doc['cant_ven']}'),
              Text('Costo total de Venta: ${doc['cost_ven']}'),
              Text('Estado de la Orden: ${doc['est_ord']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
