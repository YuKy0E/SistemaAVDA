import 'package:avda/administraci%C3%B3n/Menu_Almacenista.dart';
import 'package:avda/ventas/menu_ventas.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 174, 125, 219),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        title: const Text(
          'Login',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset('assets/login2.png',
                        width: 130, height: 130),
                  ),
                ),
              ],
            ),
            Column(
            //Container(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                width: 400, // Ajusta el ancho del campo de usuario
                child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20.0),
                  labelText: 'Usuario',
                  labelStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),

            SizedBox(
            width: 400, // Ajusta el ancho del campo de contraseña
            child: Container(
            //Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Contraseña',
                   labelStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            ),

            const SizedBox(height: 60),
            Center(
            child:SizedBox(
            width: 250, // ajusta el ancho del botón aquí
            child: ElevatedButton(
              onPressed: () async {
                String username = nameController.text;
                String password = passwordController.text;

                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: username,
                    password: password,
                  );

                  String userType = '';

                  if (username.startsWith('ven')) {
                    userType = 'ventas';
                  } else if (username.startsWith('alm')) {
                    userType = 'almacen';
                  }

                  if (userType == 'ventas') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu_Ventas()),
                    );
                  } else if (userType == 'almacen') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu_Almacenista()),
                    );
                  }
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error de inicio de sesión', 
                                style: TextStyle(
                                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        content: const Text('Usuario o contraseña incorrectos', style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 17), ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cerrar',
                            style: TextStyle(
                            color: Colors.black, fontSize: 17,),),
                            style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                 const Color.fromARGB(255, 208, 181, 230)),
                                 padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0.4, horizontal: 10.0)), // Ajusta el tamaño del botón cambiando el padding
                          ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                 const Color.fromARGB(255, 208, 181, 230)),
                                 padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0.4, horizontal: 10.0)), // Ajusta el tamaño del botón cambiando el padding
                          ),
              child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
              /*child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),*/
            ),
              ),
            ),
            Text(
              errorText,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
        ],
      ),
    ),
    );
  }
}
