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
          'Estado de Ordenes de Ventas',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
              title: Text('Orden de Venta: ${doc['id_ord']}',
              style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
              ),
              ),
              leading: const Icon(
                      Icons.view_list_sharp,
                      color: Color.fromARGB(255, 172, 45, 223),
                    ),
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
          title: Text('Detalles de la Orden de Venta: ${doc['id_ord']}',
          textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 46, 42, 94)
              ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  const Text('ID de Producto: ',
                style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 1, 70, 13)
                  ),
              ),

              Text(' ${doc['id_prod']}',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
              ),
                ],
              ),
              
              
             /* Text('ID de Producto: ${doc['id_prod']}',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
              ),*/
              SizedBox(height: 8),

              Row(
                children: [
                  const Text('Cantidad solicitada: ',
                style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 1, 70, 13)
                  ),
              ),

              Text('${doc['cant_ven']} piezas',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
              ),
                ],
              ),


              /*Text('Cantidad solicitada: ${doc['cant_ven']} piezas',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),*/

              SizedBox(height: 8),

              Row(
                children: [
                  const Text('Costo total de Venta: ',
                style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 1, 70, 13)
                  ),
              ),

              Text('${doc['cost_ven']} pesos',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
              ),
                ],
              ),

              /*Text('Costo total de Venta: ${doc['cost_ven']} pesos',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),*/
              
              SizedBox(height: 8),

              Row(
                children: [
                  const Text('Estado de la Orden: ',
                style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 1, 70, 13)
                  ),
              ),

              Text('${doc['est_ord']}',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
              ),
                ],
              ),

              /*Text('Estado de la Orden: ${doc['est_ord']}',
                style: const TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),*/
              SizedBox(height: 8),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar',
              style: TextStyle(
              color: Colors.black, fontSize: 17,),),
                            style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                 const Color.fromARGB(255, 208, 181, 230)),
                                 padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0.4, horizontal: 10.0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
