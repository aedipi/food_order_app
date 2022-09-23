import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/cubit/anasayfa_cubit.dart';
import 'package:food_order_app/cubit/giris_cubit.dart';
import 'package:food_order_app/cubit/kayit_cubit.dart';
import 'package:food_order_app/cubit/profil_cubit.dart';
import 'package:food_order_app/cubit/yemek_detay_cubit.dart';
import 'package:food_order_app/cubit/yemek_sepet_cubit.dart';
import 'package:food_order_app/views/giris_sayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YemekDetayCubit()),
        BlocProvider(create: (context) => YemekSepetCubit()),
        BlocProvider(create: (context) => GirisCubit()),
        BlocProvider(create: (context) => KayitCubit()),
        BlocProvider(create: (context) => ProfilCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const GirisSayfa(),
      ),
    );
  }
}
