import 'package:logger/logger.dart';
import 'package:remedio_da_hora/src/data/data_managment_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';

import '../models/medicine_model.dart';

abstract class IMedicineRepository {
  Future<List<Medicine>?> getAll();
}

class MedicineRepository implements IMedicineRepository {
  late final BaseRepository<Medicine> _baseRepository;
  late final DataManagmentRepository<Medicine> _repository;

  MedicineRepository(this._baseRepository) {
    _repository = DataManagmentRepository(
        repository: _baseRepository, fromJson: Medicine.fromJson);
  }

  @override
  Future<List<Medicine>?> getAll() async {
    return _repository
        .getAll()
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
