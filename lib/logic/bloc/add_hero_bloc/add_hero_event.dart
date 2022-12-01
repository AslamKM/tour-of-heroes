part of 'add_hero_bloc.dart';

@immutable
abstract class AddHeroEvent extends Equatable {
  const AddHeroEvent();
}

// ignore: must_be_immutable
class HeroAddEvent extends AddHeroEvent {
  String heroName = '';

  HeroAddEvent({required this.heroName});
  @override
  List<Object?> get props => [heroName];
}
