import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tour_of_heroes/model/hero_model.dart';

part 'delete_hero_event.dart';
part 'delete_hero_state.dart';

class DeleteHeroBloc extends Bloc<DeleteHeroEvent, DeleteHeroState> {
  HeroList heroList = HeroList();

  DeleteHeroBloc() : super(DeleteHeroInitial()) {
    on<DeleteHeroEvent>((event, emit) async {
      if (event is HeroDeleteEvent) {
        emit(HeroDeleting());
        await heroList.remHero(heroList.allHeroes[event.heroModel.id]);
      }
    });
  }
}
