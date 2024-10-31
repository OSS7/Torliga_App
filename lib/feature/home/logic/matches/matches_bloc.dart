import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/competition_model.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/repos/matches_repo.dart';

part 'matches_event.dart';
part 'matches_state.dart';

final matchesBloc = getIt<MatchesBloc>();

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  String? _lastApi;
  List<CompetitionModel>? _competitions;
  List<CompetitionModel>? get competitions => _competitions;
  MatchesBloc() : super(MatchesInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      final _matchesRepo = MatchesRepository();
      emit(MatchesLoading());
      _lastApi = event.matchesDate;
      final result = await _matchesRepo.getMatches(event.matchesDate);
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
    on<UpdateMatchesEvent>((event, emit) async {
      final _matchesRepo = MatchesRepository();
      final result = await _matchesRepo.getMatches(_lastApi ?? 'todayMatches');
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
