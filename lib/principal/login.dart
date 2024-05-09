import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:avda/principal/tipo_usuario.dart';


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
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  labelText: 'Usuario',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Contraseña',
                ),
              ),
            ),

            const SizedBox(height: 70, width: 50,),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                children: [
                ElevatedButton(
              onPressed: () async {
                String username = nameController.text;
                String password = passwordController.text;

                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: username,
                    password: password,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TipoUsuario()),
                  );
                } catch (e) {
                  setState(() {
                    //errorText = 'Error: Ocurrió un problema durante el inicio de sesión.';
                    errorText = 'Error: ${e.toString()}';
                    });
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text("Usuario o contraseña incorrectos."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                }
              },
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
             Text(
              errorText,
              style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),

          ],
        ),
      ),
    );
  }
}
