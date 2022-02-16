import 'package:disaster/data/disaster/model.dart';
import 'package:disaster/data/disaster/provider.dart';
import 'package:disaster/data/down_service/provider.dart';
import 'package:disaster/screens/down_services/down_services.dart';
import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disasters"),
      ),
      body: Provider.of<DisasterProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NativeDataTable(
              selectedActions: [
                RaisedButton(
                  child: const Text(
                    "View Down Services",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => DownServiceProvider()
                            ..getDownedServices(
                              selectedIds,
                              1,
                            ),
                          child: DownServices(),
                        ),
                      ),
                    );
                  },
                )
              ],
              rows: Provider.of<DisasterProvider>(context)
                  .disasters
                  .map<DataRow>(
                    (e) => DataRow(
                      selected: selectedIds.contains(e.id),
                      onSelectChanged: (selected) {
                        setState(() {
                          if (selected ?? false) {
                            selectedIds.add(e.id);
                          } else {
                            selectedIds.remove(e.id);
                          }
                        });
                      },
                      cells: [
                        DataCell(
                          Text("${e.id}"),
                        ),
                        DataCell(
                          Text(e.description),
                        ),
                        DataCell(
                          Text("${e.type}"),
                        ),
                        DataCell(
                          Text("${e.level}"),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              columns: const [
                DataColumn(
                  label: Text("id"),
                ),
                DataColumn(
                  label: Text("description"),
                ),
                DataColumn(
                  label: Text("type"),
                ),
                DataColumn(
                  label: Text("level"),
                )
              ],
            ),
    );
  }
}
