import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:whatsapp_ui/Model/worldModel.dart';
import 'package:whatsapp_ui/Services/Utilites/states_services.dart';
import 'package:whatsapp_ui/View/country_selection.dart';

class WorldsStatesScreen extends StatefulWidget {
  const WorldsStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldsStatesScreen> createState() => _WorldsStatesScreenState();
}

class _WorldsStatesScreenState extends State<WorldsStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorsList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              FutureBuilder(
                  future: statesServices.fetchWorldStatesRecords(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _controller,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "Deaths": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.cases!.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            chartRadius:
                                MediaQuery.of(context).size.width / 2.2,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorsList,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.06),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: "Total",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Deaths",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Recovered",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Active",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Critical",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Today Deaths",
                                      value: snapshot.data!.cases!.toString()),
                                  ReusableRow(
                                      title: "Today Recovered",
                                      value: snapshot.data!.cases!.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => CountryScreen())));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: colorsList[1],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text('Track Country'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 5, top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(),
      ],
    );
  }
}