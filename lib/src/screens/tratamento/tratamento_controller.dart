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

  String _nameMedicamento = '';

  UnmodifiableListView<Medicine> get medicamentos =>
      UnmodifiableListView(_medicamentos);

  String get nomeMedicamento => _nameMedicamento;

  void updateName(String newName) {
    _nameMedicamento = newName;
    notifyListeners();
  }

  buscarMedicamentos() async {
    _dataRepository.getAll().then((medicamentos) {
      _medicamentos = medicamentos!;
      notifyListeners();
    }).catchError((error, stackTrace) {
      DebugUtils.log(
        'Erro ao buscar medicamento',
        name: 'tratamento controller',
        error: '$error',
        stackTrace: stackTrace,
      );
    });
  }

  cadastrarMedicamento(Medicine medicine) async {
    _dataRepository.cadastrar(medicine).then((_) {
      DebugUtils.log(
        'Sucesso ao cadastrar medicamento',
        name: 'tratamento controller',
      );
      buscarMedicamentos();
    }).catchError((error, stackTrace) {
      DebugUtils.log('Erro ao cadastrar medicamento',
          name: 'tratamento controller',
          error: '$error',
          stackTrace: stackTrace);
    });
  }

  alterarMedicamento(Medicine medicine) async {
    print('Alterando');
    _dataRepository.modificar(medicine).then((_) {
      print('Sucess alteracao');
      buscarMedicamentos();
    }).catchError((error, stackTrace) {
      DebugUtils.log('Erro ao alterar medicamento',
          name: 'tratamento controller',
          error: '$error',
          stackTrace: stackTrace);
    });
  }

  removerMedicamento(Medicine medicine) async {
    _dataRepository.remover(medicine).then((_) {
            DebugUtils.log('Sucesso ao remover medicamento',
          name: 'tratamento controller',
            );
      buscarMedicamentos();
    }).catchError((error, stackTrace) {
      DebugUtils.log('Erro ao cadastrar medicamento',
          name: 'tratamento controller',
          error: '$error',
          stackTrace: stackTrace);
    });
  }
}
