import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/local_db.dart';
import 'models/first_aid.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = LocalDB();
  await db.init(); // initialize sqlite and preload data
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final LocalDB db;
  const MyApp({required this.db, super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<LocalDB>.value(
      value: db,
      child: MaterialApp(
        title: 'QuickAid',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
