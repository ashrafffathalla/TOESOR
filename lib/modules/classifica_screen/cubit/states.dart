import 'package:toesor/models/clasifica_model.dart';

abstract class ClasificaStates {}

class InitialClasificaScreenState extends ClasificaStates {}

class LoadingClasificaScreenState extends ClasificaStates {}

class SuccessClasificaScreenState extends ClasificaStates {
  final List<Classifica> calsifica;
  SuccessClasificaScreenState(this.calsifica);
}

class ErrorClasificaScreenState extends ClasificaStates {
  final String error;

  ErrorClasificaScreenState(this.error);
}

