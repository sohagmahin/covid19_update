import 'package:coronavirustracker/provider/cases_provider.dart';
import 'package:coronavirustracker/provider/theme_provider.dart';
import 'package:coronavirustracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CasesProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: Consumer<ThemeProvider>(
          child: HomeScreen(),
          builder: (context, themeModel, ch) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Covid19 Updater!',
              theme: themeModel.getTheme,
              home: ch,
            );
          },
        ));
  }
}
