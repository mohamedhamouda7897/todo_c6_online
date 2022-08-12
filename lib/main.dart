
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_online/layout/home_layout.dart';
import 'package:todo_c6_online/shared/my_provid.dart';
import 'package:todo_c6_online/shared/styles/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvid(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvid>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(pro.language),
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (c) => HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme:MyThemeData.DarkTheme ,
      themeMode: ThemeMode.light,
    );
  }
}
