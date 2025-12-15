import 'package:flutter/material.dart';
import 'package:project_sathi/features/splash/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:project_sathi/core/themes/theme_notifier.dart';
import 'package:project_sathi/core/themes/light_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_sathi/core/themes/dark_theme.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ],
          child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.themeMode,
      home: SplashScreen(),
    );
  }
}
