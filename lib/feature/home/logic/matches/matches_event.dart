part of 'matches_bloc.dart';

@immutable
sealed class MatchesEvent {}

class GetMatchesEvent extends MatchesEvent {
  final String matchesDate;

  GetMatchesEvent(this.matchesDate);
}
