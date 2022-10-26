import 'package:blood_donor/providers/dropdown_provider.dart';
import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:blood_donor/utilis/colors.dart';
import 'package:blood_donor/views/auth_views/login_view.dart';
import 'package:blood_donor/views/auth_views/signup_view.dart';
import 'package:blood_donor/views/homes/acceptor_home.dart';
import 'package:blood_donor/views/homes/admin_home.dart';
import 'package:blood_donor/views/homes/donor_home.dart';
import 'package:blood_donor/views/onboardin_screen.dart';
import 'package:blood_donor/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAMnJyo2Ko8oq-8VdDteNsLSmx7qLF-2yU",
          authDomain: "blood-bank-64de7.firebaseapp.com",
          projectId: "blood-bank-64de7",
          storageBucket: "blood-bank-64de7.appspot.com",
          messagingSenderId: "416182093342",
          appId: "1:416182093342:web:837f99f96bd4728a13d00f"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((_) => UserProvider())),
    ChangeNotifierProvider(create: ((_) => DropDownProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // theme: ThemeData.light().copyWith(
      //   // scaffoldBackgroundColor: backgroundColor,
      //   // appBarTheme: AppBarTheme.of(context).copyWith(
      //   //     backgroundColor: backgroundColor,
      //   //     elevation: 0,
      //   //     titleTextStyle: const TextStyle(
      //   //         color: primaryColor,
      //   //         fontSize: 18,
      //   //         fontWeight: FontWeight.bold)),
      //   // iconTheme: const IconThemeData(color: Colors.black),
      // ),
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            //If someone is trying to login. And he has an account
            //For that we are storing data to our provider
            AuthMethods().setToProvider(context);
            String role = Provider.of<UserProvider>(context).user.role;
            if (role == 'Acceptor') {
              return const AcceptorHome();
            } else if (role == 'Donor') {
              return const DonorHome();
            } else if (role == 'Admin') {
              return const AdminHome();
            }
            return Container();
          }
          return const SplashScreen();
        },
      ),
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        DonorHome.routeName: (context) => const DonorHome(),
        AdminHome.routeName: (context) => const AdminHome(),
        AcceptorHome.routeName: (context) => const AcceptorHome(),
      },
    );
  }
}
