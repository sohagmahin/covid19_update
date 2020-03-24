import 'package:coronavirustracker/provider/cases_provider.dart';
import 'package:coronavirustracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CasesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus statistics!',
        theme: ThemeData.dark().copyWith(cardColor: Colors.black54),
        home: HomeScreen(),
      ),
    );
  }
}
