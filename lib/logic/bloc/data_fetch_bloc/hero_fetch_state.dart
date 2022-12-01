part of 'hero_fetch_bloc.dart';

abstract class HeroFetchState {}

@immutable
class HeroFetchInitial extends HeroFetchState {}

class HeroFetching extends HeroFetchState {}

class HeroFetched extends HeroFetchState {
  //final HeroList allHeroesList = HeroList();
  List heroList = [];
  HeroFetched({required this.heroList});
}

class HeroFetchFailed extends HeroFetchState {}

class HeroDeleting extends HeroFetchState {}

class HeroDeleteSuccess extends HeroFetchState {}

class HeroDeleteFailed extends HeroFetchState {}
