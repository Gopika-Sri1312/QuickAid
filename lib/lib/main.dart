import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/local_db.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = LocalDB();
  await db.init();
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
        ),
        home: const HomeScreenWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeScreenWrapper extends StatefulWidget {
  const HomeScreenWrapper({super.key});
  @override
  State<HomeScreenWrapper> createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final db = Provider.of<LocalDB>(context, listen: false);
    await db.init();
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return const HomeScreen();
  }
}
