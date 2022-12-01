part of 'search_hero_bloc.dart';

abstract class SearchHeroState extends Equatable {
  const SearchHeroState();

  @override
  List<Object> get props => [];
}

class SearchHeroInitial extends SearchHeroState {}

class SearchingHero extends SearchHeroState {}

class SearchHeroSuccess extends SearchHeroState {}

class SearchHeroFailed extends SearchHeroState {}
