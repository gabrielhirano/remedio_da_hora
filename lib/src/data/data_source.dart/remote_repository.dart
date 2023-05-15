import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';

class RemoteRepository<T> implements BaseRepository<T> {
  final String _baseUrl;
  final String _endpoint;
  final Map<String, String> _headers;

  RemoteRepository({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
  })  : _baseUrl = baseUrl,
        _endpoint = endPoint,
        _headers = headers;

  @override
  Future delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String id, T value) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String id, T value) {
    // TODO: implement put
    throw UnimplementedError();
  }
  
  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
