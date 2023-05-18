import 'dart:async';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';

class DataManagmentRepository<T> {
  final BaseRepository repository;

  final T Function(Map<String, dynamic>) fromJson;

  DataManagmentRepository({required this.repository, required this.fromJson});


  Future<T?> get({required String name}) async {
    return repository
        .get(name)
        .then((object) => fromJson(object))
        .catchError((error) => error);
  }

  Future<List<T>?> getAll() async {
    return repository
        .getAll()
        .then((listObjects) {
          print('sucess get all====');
          return _listObjects(listObjects);})
        .catchError((error){
          print('Error get all====');
          throw error;
        });
  }

  Future<dynamic> post({required String name, required T object}) async {
    return repository
        .post(name, object)
        .then((sucess) => sucess)
        .catchError((error) => error);
  }

  Future<dynamic> put({required dynamic name, required T object}) async {
    return repository.put(name.toString(), object).then((sucess) {
      print("suceess managmente $sucess");
      return sucess;
    }).catchError((error) {
      print("suceess managmente $error");
      throw error;
    });
  }

  Future<dynamic> delete({required dynamic name, required T object}) async {
    return repository
        .delete(name.toString())
        .then((sucess) => sucess)
        .catchError((error) => error);
  }

  List<T> _listObjects(listObjects) {
    List<T> list = [];

    for (var object in listObjects) {
      list.add(fromJson(object));
    }

    return list;
  }
}
