import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/add_hero_bloc/add_hero_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/delete_hero_bloc/delete_hero_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/search_hero_bloc/search_hero_bloc.dart';
import 'package:tour_of_heroes/model/hero_model.dart';
import 'package:tour_of_heroes/presentation/screens/dashboard.dart';

import 'logic/bloc/data_fetch_bloc/hero_fetch_bloc.dart';

final HeroList allHeroesList = HeroList();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HeroFetchBloc>(
            create: (context) => HeroFetchBloc()..add(FetchHeroEvent())),
        //   BlocProvider<DataFetchBloc>(create: (context) => DataFetchBloc()),
        BlocProvider<AddHeroBloc>(create: (context) => AddHeroBloc()),
        BlocProvider<DeleteHeroBloc>(create: (context) => DeleteHeroBloc()),
        BlocProvider<SearchHeroBloc>(create: (context) => SearchHeroBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
