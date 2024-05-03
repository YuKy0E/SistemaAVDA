import 'package:avda/administraci%C3%B3n/Menu_Almacenista.dart';
import 'package:avda/ventas/menu_ventas.dart';
import 'package:flutter/material.dart';
//import 'package:avda/ventas/ordenuser_vts.dart';
// ignore: unused_import
import 'package:avda/principal/tipo_usuario.dart';


class TipoUsuario extends StatelessWidget {
  const TipoUsuario({super.key});

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
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        title: const Text(
          'Tipo de usuario',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
              width: 210, // Ancho fijo para el contenedor del botón
              height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=> const Menu_Almacenista()) //pendiente por conectar
                            ),
                          },
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
            
              child: const Text(
                'Usuario Almacen',
                style: TextStyle(color: Colors.black, fontSize: 17),
                ),
            ),

        ),
            const SizedBox(height: 40), // Separación entre los botones
            /*ElevatedButton(
              onPressed: () {
                // Lógica para la acción del botón "Buscar Producto"
              },
              child: const Text('Buscar Producto'),
            ),*/
            Container(
              width: 200, // Ancho fijo para el contenedor del botón
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: ()=>{
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>const Menu_Ventas())
                            )
                          },
                          style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                ),
                  child: const Text(
                    'Usuario Ventas',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
