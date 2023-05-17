import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';

class RemoteRepository implements BaseRepository {
  final String? baseUrl;
  final String? endpoint;
  final Map<String, String>? headers;

  RemoteRepository({this.baseUrl, this.endpoint, this.headers});

  @override
  Future<List> getAll() async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
      return data.map((json) => json).toList();
    } else {
      throw Exception('Erro ao obter os dados.');
    }
  }

  @override
  Future get(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint/$id'));

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Erro ao obter o dado.');
    }
  }

  @override
  Future<void> post(String id, value) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(value),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao criar o dado.');
    }
  }

  @override
  Future<void> put(String id, value) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint/$id'),
      headers: headers,
      body: jsonEncode(value),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar o dado.');
    }
  }

  @override
  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint/$id'));

    if (response.statusCode != 204) {
      throw Exception('Erro ao remover o dado.');
    }
  }
}
