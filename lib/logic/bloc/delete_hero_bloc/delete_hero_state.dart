part of 'delete_hero_bloc.dart';

@immutable
abstract class DeleteHeroState extends Equatable {}

class DeleteHeroInitial extends DeleteHeroState {
  @override
  List<Object?> get props => [];
}

class HeroDeleting extends DeleteHeroState {
  @override
  List<Object?> get props => [];
}

class HeroDeleteSuccess extends DeleteHeroState {
  @override
  List<Object?> get props => [];
}

class HeroDeleteFailed extends DeleteHeroState {
  @override
  List<Object?> get props => [];
}
