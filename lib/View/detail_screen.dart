import 'package:flutter/material.dart';
import 'package:whatsapp_ui/View/world_states.dart';

class DetailScreeen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreeen({
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
    required this.image,
  });

  @override
  State<DetailScreeen> createState() => _DetailScreeenState();
}

class _DetailScreeenState extends State<DetailScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .067),
                      ReusableRow(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReusableRow(
                          title: 'totalDeaths',
                          value: widget.totalDeaths.toString()),
                      ReusableRow(
                          title: 'totalRecovered',
                          value: widget.totalRecovered.toString()),
                      ReusableRow(
                          title: 'active', value: widget.active.toString()),
                      ReusableRow(
                          title: 'todayRecovered',
                          value: widget.todayRecovered.toString()),
                      ReusableRow(
                          title: 'critical', value: widget.critical.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
