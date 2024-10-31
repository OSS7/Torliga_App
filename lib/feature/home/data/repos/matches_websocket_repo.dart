import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:torliga/core/networking/api_constants.dart';
import 'package:torliga/core/networking/api_services.dart';
import 'package:torliga/feature/home/logic/matches/matches_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/networking/api_result.dart';
import '../models/competition_model.dart';
import '../models/match_model.dart';

class MatchesWebsocketRepository {
  static WebSocketChannel? _channel;

  static WebSocketChannel initWebsocket() {
    if (_channel == null) {
      const String url =
          'wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false';

      _channel = WebSocketChannel.connect(Uri.parse(url));

      _channel?.stream.listen(
        (message) {
          final decodedMessage = jsonDecode(message);
          print(decodedMessage);
          if (decodedMessage['event'] == 'score-event') {
            _handleScoreEvent();
          }
        },
        onError: (error) => print('WebSocket error: $error'),
        onDone: () => print('WebSocket connection closed'),
      );
    }
    return _channel!;
  }

  static void _handleScoreEvent() {
    matchesBloc.add(UpdateMatchesEvent());
  }
}
