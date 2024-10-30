import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:torliga/feature/home/data/models/competition_model.dart';
import 'package:torliga/feature/home/data/models/competition_with_matches_model.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/repos/matches_repo.dart';

part 'matches_event.dart';
part 'matches_state.dart';

final matchesBloc = getIt<MatchesBloc>();

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  List<CompetitionModel>? _competitions;
  List<CompetitionModel>? get competitions => _competitions;
  MatchesBloc() : super(MatchesInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      emit(MatchesLoading());
      final result = await MatchesRepository().getMatches(event.matchesDate);
      result.when(
        success: (competitions) {
          _competitions = competitions;
          emit(MatchesLoaded());
        },
        failure: (error) {
          emit(MatchesError(message: error));
        },
      );
    });
  }
}
