import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../data/repos/matches_websocket_repo.dart';
import '../../logic/matches/matches_bloc.dart';
import 'home_competition_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  WebSocketChannel? _channel;

  @override
  void initState() {
    super.initState();
    _channel = MatchesWebsocketRepository.initWebsocket();
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesBloc, MatchesState>(
      /// call today's api as initial data
      bloc: matchesBloc..add(GetMatchesEvent('todayMatches')),
      builder: (context, state) {
        return (state is MatchesError)
            ? Center(
                child: Text(
                  state.message.toString(),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: matchesBloc.competitions?.length ?? 1,
                itemBuilder: (context, index) {
                  final _competition = matchesBloc.competitions?[index];
                  return HomeCompetitionCard(
                    /// shimmer effect when loading
                    competition: state is MatchesLoading ? null : _competition,
                    isLoading: state is MatchesLoading,
                  );
                },
              );
      },
    );
  }
}
