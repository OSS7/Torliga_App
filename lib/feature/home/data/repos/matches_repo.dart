import 'package:torliga/core/networking/api_constants.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/competition_model.dart';
import '../models/match_model.dart';

class MatchesRepository {
  Future<ApiResult> getMatches(String matchesDate) async {
    final String _apiUrl = "${ApiConstants.apiBaseUrl}/home/$matchesDate";

    try {
      final response = await ApiServices.get(_apiUrl);

      /// Parse the competitions list and map each to a CompetitionModel with matches
      List<CompetitionModel> competitions =
          (response.data['data'] as List).map((competitionData) {
        final competitionJson = competitionData['competition'];
        final matchesJson = competitionData['matches'] as List;

        /// Parse the matches list and convert each item to a MatchModel
        List<MatchModel> matches = matchesJson
            .map((matchData) => MatchModel.fromJson(matchData))
            .toList();

        /// Create the CompetitionModel, adding the matches list to it
        return CompetitionModel.fromJson(competitionJson)
            .copyWith(matches: matches);
      }).toList();

      /// send the list of competitions to the bloc with the matches inside
      return ApiResult.success(competitions);
    } catch (error) {
      return ApiResult.failure('Error fetching competitions: $error');
    }
  }
}
