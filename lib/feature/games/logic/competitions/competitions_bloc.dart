import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'competitions_event.dart';
part 'competitions_state.dart';

class CompetitionsBloc extends Bloc<CompetitionsEvent, CompetitionsState> {
  CompetitionsBloc() : super(CompetitionsInitial()) {
    on<CompetitionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
