import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  entrarComGoogle() async {
    
    final GoogleSignInAccount? gUsuario = await GoogleSignIn().signIn();

    // usuario cancela login

    if(gUsuario == null) {
      return;
    }

    // obter detalhes da autencicação
    final GoogleSignInAuthentication gAuth = await gUsuario.authentication;

    // criar credenciais
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    // Entrar
    return await _firebaseAuth.signInWithCredential(credential);
    
    
      
      
    
  }
}