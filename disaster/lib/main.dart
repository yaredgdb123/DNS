import 'package:disaster/data/auth/login_provider.dart';
import 'package:disaster/data/disaster/provider.dart';
import 'package:disaster/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/down_services/down_services.dart';
import 'screens/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Provider.of<LoginProvider>(context).city == null
              ? LoginScreen()
              : ChangeNotifierProvider(
                  create: (_) => DisasterProvider()
                    ..getDisasters(
                      Provider.of<LoginProvider>(context).city ?? 1,
                      1,
                    ),
                  child: HomeScreen(),
                ),
        );
      }),
    );
  }
}
