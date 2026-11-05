import 'dart:convert';

import 'package:base_flutter_proj/characters/api/characters_api_impl.dart';
import 'package:base_flutter_proj/core/config.dart';
import 'package:base_flutter_proj/core/errors/app_error_code.dart';
import 'package:base_flutter_proj/core/errors/app_exception.dart';
import 'package:base_flutter_proj/core/network/public_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

const _character = {
  'id': 1,
  'name': 'Rick Sanchez',
  'status': 'Alive',
  'species': 'Human',
  'image': 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
  'origin': {'name': 'Earth', 'url': ''},
  'location': {'name': 'Citadel', 'url': ''},
};

class _Adapter implements HttpClientAdapter {
  _Adapter(this.status, this.body);

  final int status;
  final String body;
  Uri? requestedUri;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestedUri = options.uri;
    return ResponseBody.fromString(body, status);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late PublicApi client;
  late CharactersApiImpl api;

  void setup(int status, String body, {bool online = true}) {
    client = PublicApi(
      config: const Config(
        apiUrlDomain: 'rickandmortyapi.com',
        apiUrlRelativePath: '/api/',
        isHttpsApi: true,
      ),
      packageInfo: PackageInfo(
        appName: 'test',
        packageName: 'test',
        version: '1',
        buildNumber: '1',
      ),
      checkConnection: () async => online,
    );
    client.client.httpClientAdapter = _Adapter(status, body);
    api = CharactersApiImpl(client);
  }

  tearDown(() => client.client.close());

  test('parses page and forwards page and search to API', () async {
    setup(
      200,
      jsonEncode({
        'info': {
          'count': 1,
          'pages': 2,
          'next': 'https://rickandmortyapi.com/api/character?page=2',
          'prev': null,
        },
        'results': [_character],
      }),
    );
    final page = await api.fetchCharacters(page: 1, name: ' Rick ');
    final uri = (client.client.httpClientAdapter as _Adapter).requestedUri!;
    expect(uri.path, '/api/character');
    expect(uri.queryParameters, {'page': '1', 'name': 'Rick'});
    expect(page.info.hasNext, isTrue);
    expect(page.results.single.origin.name, 'Earth');
    expect(page.results.single.location.name, 'Citadel');
  });

  test('parses a character by id', () async {
    setup(200, jsonEncode(_character));
    final character = await api.fetchCharacter(1);
    expect(character.name, 'Rick Sanchez');
    expect(
      (client.client.httpClientAdapter as _Adapter).requestedUri!.path,
      '/api/character/1',
    );
  });

  test('returns empty only for an unmatched first-page search', () async {
    setup(404, '{"error":"There is nothing here"}');
    final page = await api.fetchCharacters(page: 1, name: 'nonexistent');
    expect(page.results, isEmpty);
    expect(page.info.hasNext, isFalse);
    await expectLater(
      api.fetchCharacters(page: 2, name: 'nonexistent'),
      throwsA(
        isA<AppException>().having(
          (e) => e.code,
          'code',
          AppErrorCode.requestFailed,
        ),
      ),
    );
    await expectLater(
      api.fetchCharacter(123456),
      throwsA(
        isA<AppException>().having(
          (e) => e.code,
          'code',
          AppErrorCode.requestFailed,
        ),
      ),
    );
  });

  test('maps invalid responses and no connection to app errors', () async {
    setup(200, 'not json');
    await expectLater(
      api.fetchCharacters(page: 1),
      throwsA(
        isA<AppException>().having(
          (e) => e.code,
          'code',
          AppErrorCode.invalidJson,
        ),
      ),
    );
    client.client.close();
    setup(200, '{}');
    await expectLater(
      api.fetchCharacters(page: 1),
      throwsA(
        isA<AppException>().having(
          (e) => e.code,
          'code',
          AppErrorCode.parseError,
        ),
      ),
    );
    client.client.close();
    setup(200, '{}', online: false);
    await expectLater(
      api.fetchCharacters(page: 1),
      throwsA(
        isA<AppException>().having(
          (e) => e.code,
          'code',
          AppErrorCode.noInternet,
        ),
      ),
    );
  });
}
