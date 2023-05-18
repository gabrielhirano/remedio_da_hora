import 'package:remedio_da_hora/src/data/data_source.dart/local_repository.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/remote_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';

abstract class CONSTANT{
  static final  BaseRepository REPOSITORY = LocalRepository();
}
