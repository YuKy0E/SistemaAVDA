import 'package:avda/principal/login.dart';
import 'package:flutter/material.dart';

//importaciones fire base
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /*title: 'Mi aplicación',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      home: Inicio(title: 'AVDA'),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 209, 224),
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
          'Inicio',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        /*actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Ajustes(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.settings,
                size: 28,
              ),
            ),
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              //LOGO -IMAGEN AGREGAR AQUI
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'AVDA',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ALMACEN',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /*Image.asset(
                'assets/images/example_image.jpg', // Ruta de la imagen en tu proyecto
                width: 200,
                height: 200,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Espacio entre la imagen y el texto
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset('assets/Logo.png',
                          width: 400, height: 300),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: SizedBox(
                        height: 30.0,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login(
                                          key: null,
                                        )))
                          },
                          /*ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },*/
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 208, 181, 230)),
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
                        ),
                      ),
                    ),
                  ),
                ],
                /*levatedButton(
                onPressed: (){
                   Navigator.pushNamed(context, 'Botón presionado');
                  // Acción a realizar cuando se presiona el botón
              },
               child: const Text('Iniciar Sesión'),
             ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
