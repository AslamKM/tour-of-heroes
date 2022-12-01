import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tour_of_heroes/model/hero_model.dart';

part 'add_hero_event.dart';
part 'add_hero_state.dart';

class AddHeroBloc extends Bloc<AddHeroEvent, AddHeroState> {
  HeroList heroList = HeroList();
  AddHeroBloc() : super(AddHeroInitial()) {
    on<AddHeroEvent>((event, emit) async {
      if (event is HeroAddEvent) {
        emit(AddingHero());
        await heroList.addHero(event.heroName);
      }
    });
  }
}
