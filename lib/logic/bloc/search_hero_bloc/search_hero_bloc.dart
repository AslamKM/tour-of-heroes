import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_hero_event.dart';
part 'search_hero_state.dart';

class SearchHeroBloc extends Bloc<SearchHeroEvent, SearchHeroState> {
  SearchHeroBloc() : super(SearchHeroInitial()) {
    on<SearchHeroEvent>((event, emit) {
    });
  }
}
