import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/local_db.dart';
import '../widgets/first_aid_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<LocalDB>(context);
    final results = query.isEmpty ? db.items : db.search(query);

    return Scaffold(
      appBar: AppBar(
        title: const Text("QuickAid"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search first-aid topics...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return FirstAidCard(item: results[index]);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        o
