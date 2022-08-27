import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whatsapp_ui/Services/Utilites/states_services.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices stateService = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: textController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: " Search With Country Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: stateService.fetchCountriesRecord(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      leading: Container(
                                        height: 100,
                                        width: 80,
                                        color: Colors.white,
                                      ),
                                      title: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (textController.text.isEmpty) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      leading: Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                                  ['flag']
                                              .toString(),
                                        ),
                                      ),
                                      title: Text(snapshot.data![index]
                                              ["country"]
                                          .toString()),
                                      subtitle: Text(
                                          "Total Cases : ${snapshot.data![index]["cases"]}"),
                                    ),
                                  ),
                                ],
                              );
                            } 
                            else if (name
                                .toLowerCase()
                                .contains(textController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      leading: Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                                  ['flag']
                                              .toString(),
                                        ),
                                      ),
                                      title: Text(snapshot.data![index]
                                              ["country"]
                                          .toString()),
                                      subtitle: Text(
                                          "Total Cases : ${snapshot.data![index]["cases"]}"),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
