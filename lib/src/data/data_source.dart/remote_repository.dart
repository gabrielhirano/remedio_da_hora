import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';

class RemoteRepository implements BaseRepository {
  late final String? baseUrl;
  late final String? endpoint;
  final Map<String, String>? headers;

  RemoteRepository({this.baseUrl, this.endpoint, this.headers});

  @override
  Future<List> getAll() async {
    DebugUtils.genericLog('$baseUrl  \n$endpoint', Level.warning);
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    
    DebugUtils.inspec(response);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
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
  Future<void> post(String id, dynamic value) async {
    // Medicine medicine = value as Medicine;

    DebugUtils.genericLog('cadastro $value', Level.wtf);
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: value.toString(),
    );

    DebugUtils.genericLog('cadastro $value', Level.error);
    DebugUtils.inspec(response);

    if (response.statusCode != 201) {
      throw Exception('Erro ao criar o dado.');
    }
  }

  @override
  Future<void> put(String id, value) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint/$id'),
      headers: headers,
      body: value.toString(),
    );
        DebugUtils.genericLog('Sucess modificar', Level.wtf);
    DebugUtils.inspec(response);
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar o dado.');
    }
  }

  @override
  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint/$id'));
    DebugUtils.genericLog('', Level.wtf);
    DebugUtils.inspec(response);

    if (response.statusCode != 204) {
      throw Exception('Erro ao remover o dado.');
    }
  }
}
