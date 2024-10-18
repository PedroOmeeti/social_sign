import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> entrarComGoogle() async {
    print("Iniciando login com Google");
    
    // Iniciar o processo de login com o Google
    final GoogleSignInAccount? gUsuario = await GoogleSignIn().signIn();

    // Usuário cancelou o login
    if (gUsuario == null) {
      print("Login cancelado");
      return null;
    }

    // Obter detalhes da autenticação
    final GoogleSignInAuthentication gAuth = await gUsuario.authentication;

    // Criar credenciais para Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
  
    // Fazer login no Firebase com as credenciais do Google
    UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

    // Obter o usuário logado
    User? user = userCredential.user;

    print("Login bem-sucedido, usuário: ${user?.displayName}");
    
    return user;
  }

  Future<void> sair() async {
    await GoogleSignIn().signOut();
  }
}
