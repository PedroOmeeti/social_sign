import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_sign/controller/Home_controller.dart';

class InfosUsuarioView extends StatefulWidget {
  const InfosUsuarioView({super.key});

  @override
  State<InfosUsuarioView> createState() => _InfosUsuarioViewState();
}

class _InfosUsuarioViewState extends State<InfosUsuarioView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informações do Usuário'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<User?>(
                future: controller.entrarComGoogle(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Mostra um indicador de carregamento enquanto o login está acontecendo
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Se ocorrer um erro, exiba uma mensagem de erro
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data != null) {
                    // Se o login for bem-sucedido e tivermos os dados do usuário
                    User? user = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nome: ${user?.displayName ?? 'Não disponível'}'),
                        Text('Email: ${user?.email ?? 'Não disponível'}'),
                        user?.photoURL != null
                            ? Image.network(user!.photoURL!)
                            : const Icon(Icons.account_circle, size: 100),
                        ElevatedButton(
                          onPressed: () async {
                            await controller.sair();
                            Navigator.pop(context);
                          },
                          child: const Text('Sair'),
                        ),
                      ],

                    );
                  } else {
                    // Caso o login tenha sido cancelado ou falhado
                    return const Center(
                        child: Text('Login cancelado ou falhou.'));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
