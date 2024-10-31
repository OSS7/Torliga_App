import 'package:get_it/get_it.dart';
import 'package:torliga/feature/home/logic/matches/matches_bloc.dart';

final getIt = GetIt.instance;

Future setupGetIt() async{
  // matches
  getIt.registerLazySingleton<MatchesBloc>(() => MatchesBloc());
}
