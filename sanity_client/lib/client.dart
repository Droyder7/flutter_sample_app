import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanity_client/sanity_client.dart';

const sanityApiVersion = "v2021-10-21";

class SanityClient {
  String dataset;
  final _HttpClient _client; // private http client for fetching data
  final String projectId;
  final String? token;
  final bool useCdn;
  final bool allowDraft;

  factory SanityClient({
    // factory constructor to call to create an object
    required String projectId,
    required String dataset,
    required String token,
    bool useCdn = true,
    bool allowDraft = true,
  }) {
    return SanityClient._createInstance(
      projectId: projectId,
      dataset: dataset,
      token: token,
      useCdn: useCdn,
      allowDraft: allowDraft,
    );
  }

  SanityClient._createInstance({
    // private named cosntructor which can't be called
    required this.projectId,
    required this.dataset,
    required this.token,
    this.useCdn = true,
    required this.allowDraft,
  }) : _client = _HttpClient(token!);

  // fetch documents with given query
  Future<dynamic> fetch({
    required String query,
    Map<String, dynamic>? params,
  }) async {
    final Uri uri = _buildUri(query: query, params: params);
    final http.Response response = await _client.get(uri);
    return _returnResponse(response);
  }

  // get imageUrl from imageRefId
  String imageUrl(
    String imageRefId, {
    int? width,
    int? height,
    int? devicePixelRatio,
  }) {
    return urlFor(
      imageRefId,
      client: this,
      width: width,
      height: height,
      devicePixelRatio: devicePixelRatio,
    );
  }

  // get documentUrl from documentRefId
  String documentUrl(String documentRefId) {
    return urlForDocument(documentRefId, client: this);
  }

  /// Fetches the associated datasets with this project
  Future<List<SanityDataset>> datasets() async {
    final uri = Uri(
      scheme: 'https',
      host: 'api.sanity.io',
      path: '/$sanityApiVersion/projects/$projectId/datasets',
    );

    final http.Response response = await _client.get(uri);
    final datasets = (jsonDecode(response.body) as List<dynamic>)
        .map((json) => SanityDataset.fromJson(json))
        .toList(growable: false);

    return datasets;
  }

  // building Uri for fetching query results
  Uri _buildUri({required String query, Map<String, dynamic>? params}) {
    final Map<String, dynamic> queryParameters = <String, dynamic>{
      'query': query,
      if (params != null) ...params,
    };

    return Uri(
      scheme: 'https',
      host: '$projectId.${useCdn ? 'apicdn' : 'api'}.sanity.io',
      path: '/$sanityApiVersion/data/query/$dataset',
      queryParameters: queryParameters,
    );
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        return responseJson['result'];
      case 400:
        throw BadRequestException(response.body.toString());
      // case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      // case 500:
      default:
        throw FetchDataException(
          '${response.statusCode}: ${response.body.toString()}',
        );
    }
  }
}

class _HttpClient extends http.BaseClient {
  factory _HttpClient(String token) {
    final http.Client client = http.Client();
    return _HttpClient._createInstance(client, token);
  }
  _HttpClient._createInstance(this._inner, this.token);

  final http.Client _inner;
  final String token;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }
}
