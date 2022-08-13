import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Whats App'),
          bottom: const TabBar(
            tabs: [
              Icon(Icons.camera_alt),
              Text('Calls'),
              Text('Chats'),
              Text('status'),
            ],
          ),
        ),
      ),
    );
  }
}
