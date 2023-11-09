import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyager_1/services/auth.dart';
import 'package:voyager_1/services/product.dart';
import 'package:voyager_1/views/login/auth_page.dart';
import 'package:voyager_1/views/widgets/navbar/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences sharedPreferences;

  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _getInitData();
  }

  void _getInitData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isLogin = sharedPreferences.getBool('isLogin') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 11, 153)),
          useMaterial3: true,
        ),
        home: isLogin ? ScreenMainPage() : const AuthPage(),
      ),
    );
  }
}
