import 'package:disaster/data/disaster/model.dart';
import 'package:disaster/data/down_service/model.dart';
import 'package:disaster/data/down_service/provider.dart';
import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';
import 'package:provider/provider.dart';

class DownServices extends StatefulWidget {
  const DownServices({Key? key}) : super(key: key);

  @override
  State<DownServices> createState() => _DownServicesState();
}

class _DownServicesState extends State<DownServices> {
  List<int> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downed Services"),
      ),
      body: Provider.of<DownServiceProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NativeDataTable(
              rows: Provider.of<DownServiceProvider>(context)
                  .downedServices
                  .map<DataRow>(
                    (e) => DataRow(
                      // selected: selectedIds.contains(e.id),
                      // onSelectChanged: (selected) {
                      //   setState(() {
                      //     if (selected ?? false) {
                      //       selectedIds.add(e.id);
                      //     } else {
                      //       selectedIds.remove(e.id);
                      //     }
                      //   });
                      // },
                      cells: [
                        DataCell(
                          Text("${e.id}"),
                        ),
                        DataCell(
                          Text(e.details),
                        ),
                        DataCell(
                          Text("${e.disasterId}"),
                        ),
                        DataCell(
                          Text("${e.serivce}"),
                        ),
                        DataCell(
                          Text(e.email),
                        ),
                        DataCell(
                          Text('${e.phone_1}'),
                        ),
                        DataCell(
                          Text('${e.phone_2}'),
                        ),
                        DataCell(
                          Text("${e.responseTime}"),
                        ),
                        DataCell(
                          Text("${e.downTime.toUtc()}"),
                        ),
                        DataCell(
                          Text("${e.upTime.toUtc()}"),
                        ),
                        DataCell(
                          Text("${e.isActive}"),
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
                  label: Text("service details"),
                ),
                DataColumn(
                  label: Text("disasterId"),
                ),
                DataColumn(
                  label: Text("service id"),
                ),
                DataColumn(
                  label: Text("service email"),
                ),
                DataColumn(
                  label: Text("service phone 1"),
                ),
                DataColumn(
                  label: Text("service phone 2"),
                ),
                DataColumn(
                  label: Text("service response time"),
                ),
                DataColumn(
                  label: Text("down time"),
                ),
                DataColumn(
                  label: Text("up time"),
                ),
                DataColumn(
                  label: Text("is active"),
                ),
              ],
            ),
    );
  }
}
