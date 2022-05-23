import 'package:cartefid/core/auth/connexion.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'core/onbolding.dart';
import 'firebase_options.dart';
//import 'connexion.dart';


//required import
final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void main()async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
    runApp((MaterialApp(debugShowCheckedModeBanner: false,home:await getAuthState())));}

   /*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: onbolding());
       // home: codebarre());
  }
}*/


//check user account status
Future<Widget> getAuthState()async{
  return  StreamBuilder<User?>(
    stream:_firebaseAuth.authStateChanges(),
    builder: (BuildContext context,snapshot){
      return onbolding();
      /*if(snapshot.hasData){
        return onbolding();

      }
      return profile();
*/
    }
  );

}
