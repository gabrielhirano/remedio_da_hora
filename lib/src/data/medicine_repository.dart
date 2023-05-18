import 'dart:math';

import 'package:logger/logger.dart';
import 'package:remedio_da_hora/src/data/data_managment_repository.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/local_repository.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/remote_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';

import '../models/medicine_model.dart';

abstract class IMedicineRepository {
  Future<List<Medicine>?> getAll();
  Future<dynamic> cadastrar(Medicine medicine);
  Future<dynamic> modificar(Medicine medicine);
  Future<dynamic> remover(Medicine medicine);
}

enum Repository { local, remoto }

class MedicineRepository implements IMedicineRepository {
  late final BaseRepository _baseRepository;

  final BaseRepository baseRepository;
  late final DataManagmentRepository<Medicine> _repository;

  MedicineRepository(this.baseRepository) {

    if (baseRepository is RemoteRepository) {
      _baseRepository = RemoteRepository(
        baseUrl: 'https://3ac0-45-183-3-236.sa.ngrok.io',
        endpoint: 'medicines',
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } else {
      _baseRepository = baseRepository;
    }

    _repository = DataManagmentRepository(
        repository: _baseRepository, fromJson: Medicine.fromJson);
  }

  @override
  Future<List<Medicine>?> getAll() async {
    return _repository
        .getAll()
        .then((medicamentos) => medicamentos)
        .catchError((error, stack) {
      DebugUtils.log('into medicine repository',
          error: error.toString(), stackTrace: stack);
      throw error;
    });
  }

  @override
  Future<dynamic> cadastrar(Medicine medicine) {
    return _repository
        .post(name: medicine.id.toString(), object: medicine)
        .then((medicamentos) => medicamentos)
        .catchError((error) => error);
  }

  @override
  Future<dynamic> modificar(Medicine medicine) {
    return _repository
        .put(name: medicine.id, object: medicine)
        .then((medicamentos) => medicamentos)
        .catchError((error) => error);
  }

  @override
  Future remover(Medicine medicine) {
    return _repository
        .delete(name: medicine.id!, object: medicine)
        .then((medicamentos) => medicamentos)
        .catchError((error) => error);
  }
}


/*
    List<Medicine>? medicamentos;
    try {
      medicamentos = await _repository.getAll();
      return medicamentos;
    } catch (error) {
      rethrow;
    }
 */
