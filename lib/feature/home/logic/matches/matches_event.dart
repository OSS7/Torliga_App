part of 'matches_bloc.dart';

@immutable
sealed class MatchesEvent {}

class GetMatchesEvent extends MatchesEvent {
  /// call specific date when call api
  final String matchesDate;
  GetMatchesEvent(this.matchesDate);
}

class UpdateMatchesEvent extends MatchesEvent {}
