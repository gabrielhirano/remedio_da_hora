import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:remedio_da_hora/src/data/medicine_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';

class TratamentoController extends ChangeNotifier {
  final BaseRepository<Medicine> _baseRepository;
  late final MedicineRepository _dataRepository;

  TratamentoController(this._baseRepository) {
    _dataRepository = MedicineRepository(_baseRepository);
  }

  late Function? reloadPage;

  List<Medicine> _medicamentos = [];

  UnmodifiableListView<Medicine> get medicamentos =>
      UnmodifiableListView(_medicamentos);

  buscarMedicamentos() async {
    _dataRepository.getAll().then((medicamentos) {
      DebugUtils.genericLog('sucess ${medicamentos} ${medicamentos.runtimeType}', Level.debug);
      _medicamentos.addAll(medicamentos!);
      notifyListeners();
    }).catchError((error) {
      DebugUtils.genericLog('Error ${error} ${medicamentos}', Level.error);
    });
  }
}
