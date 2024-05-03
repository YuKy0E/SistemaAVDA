// ignore_for_file: non_constant_identifier_names, cast_from_nullable_always_fails
// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
import 'package:avda/principal/tipo_usuario.dart';
import 'package:flutter/material.dart';



// ignore: camel_case_types
/*class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        ),
    );
  }
}*/

// ignore: camel_case_types
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// ignore: camel_case_types
class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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



      body: //cuerpo(), 
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10),
            
            /*Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'AVDA ALMACEN',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),*/
                
            Row(
              mainAxisAlignment: MainAxisAlignment.center,// Espacio entre la imagen y el texto
                children: [
                Expanded(
                  child: Center(
                  child: Image.asset('assets/login2.png', width: 130, height: 130),
                    ),
                  ),
                ],
            ),
               /* Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                   contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
                  labelText: 'Tipo de usuario',
                ),
              ),
            ),*/
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                   contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
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
                  prefixIcon: const Icon(Icons.lock), // Icono para la contraseña
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajusta el relleno interno
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Radio de esquina grande para hacerlo ovalado
                  ),
                  labelText: 'Contraseña',
                ),
              ),
            ),
           /* TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Olvido la contraseña',),
            ),*/
           Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(
      height: 120.0, // Altura del espacio en la parte superior
    ),
    Center(
      child: FractionallySizedBox(
        widthFactor: 0.4,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=>const TipoUsuario())
              //MaterialPageRoute(builder: (context)=>const Almacen1())
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
          ),
          child: const Text(
            'Iniciar Sesión',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    ),
  ],
),
          
            
          ],
        ),
      ),
    );
  }
}

Widget cuerpo(){
  return Center (
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        nombre(),
        campoTipoUsuario(),
        campoUsuario(),
        campoContra(),
        Ingresar(),
      ],
    ),
  );
}

Widget nombre(){
  
  return const Text(
        'Inicio de sesión', 
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 1, 0, 2),
          ),
      );
}

Widget campoTipoUsuario(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'Tipo de Usuario',
        fillColor: Color.fromARGB(31, 0, 0, 0),
        filled: true,
      ),
    ),
  );
}

Widget campoUsuario(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'Usuario',
        fillColor: Color.fromARGB(31, 0, 0, 0),
        filled: true,
      ),
    ),
  );
}

Widget campoContra(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'Contraseña',
        fillColor: Color.fromARGB(31, 0, 0, 0),
        filled: true,
      ),
    ),
  );
}


Widget Ingresar(){
  var context;
  return FractionallySizedBox(
    widthFactor: 0.6,
      child: SizedBox(
      height: 30.0, 
        child: ElevatedButton(
          onPressed: ()=>{
            Navigator.push(
              context as BuildContext, 
                MaterialPageRoute(builder: (context)=> const TipoUsuario())
                          )
                        },
                        /*ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },*/
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 208, 181, 230)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              
                              'Iniciar Sesión',
                              style: TextStyle(color: Colors.black,fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
}