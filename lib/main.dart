import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:professional_dark_personal_portfolio/constants.dart';
import 'package:professional_dark_personal_portfolio/responsive_menu.dart';
import 'package:professional_dark_personal_portfolio/start.dart';
import 'package:professional_dark_personal_portfolio/waitress.dart';
import 'error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorPage(error: details.exception.toString());
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyB_AlsWipjxywI7FI91bTj-nx8hlrOGb20",
            authDomain: "gunichihafedh-8031d.firebaseapp.com",
            projectId: "gunichihafedh-8031d",
            storageBucket: "gunichihafedh-8031d.appspot.com",
            messagingSenderId: "272525951460",
            appId: "1:272525951460:web:e6c4436bfd8d85793f47f1",
            measurementId: "G-LT67VE81F8",
          ),
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            showToast("Welcome User!");
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.minWidth > 720 && constraints.maxHeight > 283) {
                  return const Start(widget: ResponsiveMenu(state: 1));
                } else {
                  return const Start(widget: ResponsiveMenu(state: 0));
                }
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Waitress();
          } else {
            return ErrorPage(error: snapshot.error.toString());
          }
        },
      ),
    );
  }
}
