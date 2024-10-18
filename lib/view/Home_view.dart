import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:social_sign/controller/Home_controller.dart';
import 'package:social_sign/view/Infos_usuario_view.dart';
import 'package:social_sign/view/Registrar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 80, 79, 79),
      appBar: AppBar(
        title: Text('Nubank', 
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple
            
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [     
              Text('Faça Login', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),           
                  label: Text('Email',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),           
                  label: Text('Senha',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: () {}, 
                child: Text('Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              SizedBox(height: 10),

              Text('ou',
                style: TextStyle(
                  color: Colors.white
              )),

              SizedBox(height: 10),
              SignInButton(
                Buttons.Google,
                  text: "Entrar com o Google",
                  onPressed: () async {
                    User? user = await controller.entrarComGoogle(); // Aguarda o login com Google
                  
                  if (user != null) {
                    // Se o login for bem-sucedido, navegue para a próxima tela
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfosUsuarioView(), // Tela de informações do usuário
                      ),
                    );
                  }
                  },
              ),
              SignInButton(
                Buttons.Facebook,
                  text: "Entrar com o Facebook",
                  onPressed: () {
                    
                  }
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarView()));
                },
                child: Text('Ainda não possui uma conta?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 184, 145, 196)
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}