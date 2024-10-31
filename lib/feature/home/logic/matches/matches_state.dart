part of 'matches_bloc.dart';

@immutable
sealed class MatchesState {}

final class MatchesInitial extends MatchesState {}

final class MatchesLoading extends MatchesState {}

final class MatchesLoaded extends MatchesState {}

final class MatchesError extends MatchesState {
  final String? message;
  MatchesError({this.message});
}
