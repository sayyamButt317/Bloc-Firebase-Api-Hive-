import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:msb_task3/Network/repository/firebase_repository.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/helper/Utils/navigation_bar.dart';
import 'package:msb_task3/bussinessLogic/bloc/api/api_bloc.dart';
import 'package:msb_task3/bussinessLogic/bloc/db/hive_bloc.dart';
import 'package:msb_task3/bussinessLogic/bloc/firebase/firebase_bloc.dart';
import 'package:msb_task3/bussinessLogic/cubit/navigation/bottom_nav_cubit.dart';
import 'helper/Utils/http.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(HivedbModelAdapter());

  HttpOverrides.global = MyHttpOverrides();
  final FirebaseRepository productRepository = FirebaseRepository();

  runApp(MyApp(firebaseRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final FirebaseRepository firebaseRepository;

  const MyApp({super.key, required this.firebaseRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => ApiBloc()),
        BlocProvider(create: (_) => HiveBloc()),
        BlocProvider(
          create: (_) => FirebaseBloc(firebaseRepository: firebaseRepository),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: MainWrapper(),
      ),
    );
  }
}
