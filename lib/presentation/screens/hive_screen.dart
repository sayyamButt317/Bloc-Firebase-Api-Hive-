import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/bussinessLogic/bloc/db/hive_state.dart';

import '../../bussinessLogic/bloc/db/hive_bloc.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});
  @override
  State<HiveScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HiveBloc>(context).add(const GetDataFromHive());
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
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter data ";
                        }
                        return null;
                      },
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Data',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newData = textEditingController.text;
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<HiveBloc>(context).add(
                          AddDataonHive(
                              hivedbModel: HivedbModel()..name = newData),
                        );
                        textEditingController.clear();
                      }
                    },
                    child: const Text('Add Data'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<HiveBloc, HiveState>(
              builder: (context, state) {
                if (state is DisplayData) {
                  if (state.hivedbModelList.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.hivedbModelList.length,
                    itemBuilder: (context, index) {
                      final data = state.hivedbModelList[index];
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
