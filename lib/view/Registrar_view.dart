import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:social_sign/controller/Home_controller.dart';

class RegistrarView extends StatefulWidget {
  const RegistrarView({super.key});

  @override
  State<RegistrarView> createState() => _RegistrarViewState();
}

class _RegistrarViewState extends State<RegistrarView> {
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
              Text('Crie a sua conta', 
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
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: () {}, 
                child: Text('Criar conta',
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
                  onPressed: () {
                    controller.entrarComGoogle();
                  },
              ),
              SignInButton(
                Buttons.Facebook,
                  text: "Entrar com o Facebook",
                  onPressed: () {
                    
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}