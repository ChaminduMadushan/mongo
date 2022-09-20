import 'package:flutter/material.dart';
import 'package:mongo/insert.dart';

import 'package:mongo/mongoose.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'mongo app',
      home: MongoDbInsert(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello titke'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Text('Hello World'),
      ),
    );
  }
}
