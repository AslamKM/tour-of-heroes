part of 'add_hero_bloc.dart';

@immutable
abstract class AddHeroState extends Equatable {}

class AddHeroInitial extends AddHeroState {
  @override
  List<Object?> get props => [];
}

class AddingHero extends AddHeroState {
  @override
  List<Object?> get props => [];
}

class AddHeroSuccess extends AddHeroState {
  @override
  List<Object?> get props => [];
}

class AddHeroFailed extends AddHeroState {
  @override
  List<Object?> get props => [];
}
