import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task3/Network/service/db_model.dart';

import '../bloc/db/db_bloc.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({super.key});

  @override
  State<HiveDatabaseScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DbBloc>(context).add(const GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Database'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Data',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final newData = textEditingController.text;
                    if (newData.isNotEmpty) {
                      BlocProvider.of<DbBloc>(context).add(
                        Create(hivedbModel: HivedbModel()..name = newData),
                      );
                      textEditingController.clear();
                    }
                  },
                  child: const Text('Add Data'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<DbBloc, DbState>(
              builder: (context, state) {
                if (state is DisplayAllDatas) {
                  if (state.hivedbModel.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.hivedbModel.length,
                    itemBuilder: (context, index) {
                      final data = state.hivedbModel[index];
                      return ListTile(
                        title: Text(data.name),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
