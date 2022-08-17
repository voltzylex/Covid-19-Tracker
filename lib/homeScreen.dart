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
          //Whatsapp Title was mentioned
          title: const Text('Whats App'),
          //Actions for Search and option
          actions: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.search_rounded),
            ),
            //PopupMenuButton is used to give the button click able options
            PopupMenuButton(
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Setting'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: const Text('Profile'),
                ),
              ],
            )
          ],
          // Bottom carry camera , Calls ,Status
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt),
              ),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
        ),

        // Body area 🏅🏅🏅

        body: TabBarView(children: [
          const Center(
            child: Icon(Icons.camera_alt_rounded),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    subtitle: Text('how are you'),
                    title: Text('Welcome'),
                    trailing: Text('4:20'),
                  );
                }),
          ),

          //Status
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 3),
              ),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')),
            ),
            title: Text('Welcome'),
            subtitle: Text('35 min ago'),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('Welcome'),
            trailing: const Icon(Icons.call),
            subtitle: Row(
              children: const [
                Icon(
                  Icons.call_missed_outgoing,
                  color: Colors.green,
                ),
                Text(', August 11 , 1:34 PM'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
