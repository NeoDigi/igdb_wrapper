library igdb_wrapper.igdb_wrapper;

import 'dart:async';

import 'package:http/http.dart' as http;

import 'enums.dart';
import 'parameters.dart';

class IGDBWrapper {
  final String _apiKey;
  final Version version;
  final bool debug;
  var _apiURL = "https://api-endpoint.igdb.com/";
  static const _apiHeader = "user-key";

  IGDBWrapper(this._apiKey, {this.version = Version.PRO, this.debug = false}) {
    if (version == Version.PRO) {
      _apiURL += "pro/";
    }
  }

  Future<http.Response> getJSONArray(String url) async {
    final completeURL = _apiURL + url;

    if (debug) {
      print(completeURL);
    }

    return await http.get(Uri.encodeFull(completeURL),
        headers: {_apiHeader: _apiKey, "Accept": "application/json"});
  }

  Future<http.Response> search(Endpoint endpoint, Parameters parameters) {
    return getJSONArray(parameters.buildQuery(endpoint));
  }

  Future<http.Response> games(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.GAMES));
  }

  Future<http.Response> pulses(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PULSES));
  }

  Future<http.Response> characters(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.CHARACTERS));
  }

  Future<http.Response> collections(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.COLLECTIONS));
  }

  Future<http.Response> companies(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.COMPANIES));
  }

  Future<http.Response> franchises(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.FRANCHISES));
  }

  Future<http.Response> feeds(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.FEEDS));
  }

  Future<http.Response> pages(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PAGES));
  }

  Future<http.Response> gameEngines(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.GAME_ENGINES));
  }

  Future<http.Response> gameModes(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.GAME_MODES));
  }

  Future<http.Response> genres(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.GENRES));
  }

  Future<http.Response> keywords(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.KEYWORDS));
  }

  Future<http.Response> people(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PEOPLE));
  }

  Future<http.Response> platforms(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PLATFORMS));
  }

  Future<http.Response> playerPerspectives(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PLAYER_PERSPECTIVES));
  }

  Future<http.Response> releaseDates(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.RELEASE_DATES));
  }

  Future<http.Response> pulseGroups(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PULSE_GROUPS));
  }

  Future<http.Response> pulseSources(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.PULSE_SOURCES));
  }

  Future<http.Response> themes(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.THEMES));
  }

  Future<http.Response> reviews(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.REVIEWS));
  }

  Future<http.Response> titles(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.TITLES));
  }

  Future<http.Response> credits(Parameters parameters) {
    return getJSONArray(parameters.buildQuery(Endpoint.CREDITS));
  }
}
