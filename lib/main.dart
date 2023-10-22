import 'package:demo_users/database/database_helper.dart';
import 'package:demo_users/home.page.dart';
import 'package:demo_users/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _materialApp(context);
  }

  _materialApp(context){
    return MaterialApp(
      title: 'Users',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRoutes.navigatorKey,
      routes: AppRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const[
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      home: const HomePage(),
    );
  }
}