import 'package:remedio_da_hora/src/data/data_managment_repository.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/remote_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';

import '../models/medicine_model.dart';

abstract class IMedicineRepository {
  RemoteRepository generateRemoteInstance();
  Future<List<Medicine>?> getAll();
  Future<dynamic> cadastrar(Medicine medicine);
  Future<dynamic> modificar(Medicine medicine);
  Future<dynamic> remover(Medicine medicine);
}

class MedicineRepository implements IMedicineRepository {
  late final BaseRepository _baseRepository;
  late final DataManagmentRepository<Medicine> _repository;

  MedicineRepository({required BaseRepository baseRepository}) {
    _baseRepository = baseRepository is RemoteRepository
        ? generateRemoteInstance()
        : baseRepository;

    _repository = DataManagmentRepository(
      repository: _baseRepository,
      fromJson: Medicine.fromJson,
    );
  }

  @override
  RemoteRepository generateRemoteInstance() {
    return RemoteRepository(
      baseUrl: 'https://3ac0-45-183-3-236.sa.ngrok.io',
      endpoint: 'medicines',
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
