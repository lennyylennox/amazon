import 'package:amazon/controller/provider/auth_provider.dart';
import 'package:amazon/firebase_options.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/views/auth_screen/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        home: const AuthScreen(),
        debugShowCheckedModeBanner: false,
        theme: theme,
      ),
    );
  }
}
