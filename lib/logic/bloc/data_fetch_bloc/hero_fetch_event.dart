part of 'hero_fetch_bloc.dart';

@immutable
abstract class HeroEvent extends Equatable {
  const HeroEvent();
  @override
  List<Object?> get props => [];
}

class FetchHeroEvent extends HeroEvent {}
