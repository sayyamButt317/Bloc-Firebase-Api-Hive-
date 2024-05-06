import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/firebase/firebase_bloc.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    BlocProvider.of<FirebaseBloc>(context).add(const GetData());
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Screen'),
        centerTitle: true,
      ),
      body: BlocListener<FirebaseBloc, FirebaseState>(
        listener: (context, state) {
          if (state is FirebaseAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Data Added")),
            );
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter Data',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _create(textEditingController.text),
              child: const Text('Add Data'),
            ),
            Expanded(
              child: BlocBuilder<FirebaseBloc, FirebaseState>(
                builder: (context, state) {
                  if (state is FirebaseLoaded) {
                    return ListView.builder(
                      itemCount: state.mydata.length,
                      itemBuilder: (_, index) {
                        final product = state.mydata[index];
                        return ListTile(
                          title: Text(product.name),
                        );
                      },
                    );
                  } else if (state is FirebaseLoading ||
                      state is FirebaseAdding) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FirebaseError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _create(String data) async {
    BlocProvider.of<FirebaseBloc>(context).add(Create(data));
    textEditingController.clear();
  }
}
