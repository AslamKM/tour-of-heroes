part of 'delete_hero_bloc.dart';

@immutable
abstract class DeleteHeroEvent extends Equatable {
  const DeleteHeroEvent();
}

// ignore: must_be_immutable
class HeroDeleteEvent extends DeleteHeroEvent {
  HeroModel heroModel;
  HeroDeleteEvent({required this.heroModel});

  @override
  List<Object?> get props => [heroModel];
}
