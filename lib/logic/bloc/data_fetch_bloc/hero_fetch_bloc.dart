import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:tour_of_heroes/model/hero_model.dart';

part 'hero_fetch_event.dart';
part 'hero_fetch_state.dart';

class HeroFetchBloc extends Bloc<HeroEvent, HeroFetchState> {
  HeroList heroList = HeroList();
  List _list = [];
  List get list => _list;

  HeroFetchBloc() : super(HeroFetchInitial()) {
    on<HeroEvent>((event, emit) async {
      if (event is FetchHeroEvent) {
        emit(HeroFetching());
        _list = heroList.allHeroes;
        //print(_list.length);
        if (_list.isNotEmpty) {
          //    print("list not empty");
          emit(HeroFetched(heroList: list));
        } else {
          emit(HeroFetchFailed());
        }
      } 
    });
  }
}
