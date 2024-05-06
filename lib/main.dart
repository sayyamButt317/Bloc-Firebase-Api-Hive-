import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:msb_task3/Network/repository/firebaserepository.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/Utils/navigation_bar.dart';
import 'package:msb_task3/bloc/api/api_bloc.dart';
import 'package:msb_task3/bloc/db/db_bloc.dart';
import 'package:msb_task3/bloc/firebase/firebase_bloc.dart';
import 'package:msb_task3/navigation/bottom_nav_cubit.dart';
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

  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final FirebaseRepository productRepository;

  const MyApp({super.key, required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => DbBloc()),
        BlocProvider(
          create: (_) => FirebaseBloc(productRepository: productRepository),
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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
