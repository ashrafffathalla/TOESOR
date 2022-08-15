import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/modules/classifica_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../models/clasifica_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ClasificaCubit extends Cubit<ClasificaStates> {
  ClasificaCubit() : super (InitialClasificaScreenState());
  static ClasificaCubit get(context) => BlocProvider.of(context);

  List<Classifica> clasifica = <Classifica>[];
  List<BestPlayer> bestPlayer = <BestPlayer>[];
  List<TuoTempoTuoLivello> tuoTempo = <TuoTempoTuoLivello>[];
  ClasificaModel ? clasificaModel;


  Future<void> getClasifica({
    required int Route_ID,

  })async{
    emit(LoadingClasificaScreenState());
    await DioHelper.getData(
      methodUrl: '$CLASIFICA/$Route_ID',
    ).then((value){
      clasifica = List<Classifica>.from(
          value.data['Classifica'].map((item) => Classifica.fromJson(item)));

      bestPlayer = List<BestPlayer>.from(
          value.data['Best_Player'].map((item) => BestPlayer.fromJson(item)));

      tuoTempo = List<TuoTempoTuoLivello>.from(
          value.data['TuoTempo_TuoLivello'].map((item) => TuoTempoTuoLivello.fromJson(item)));
      clasificaModel =ClasificaModel.fromJson(value.data);
      print(bestPlayer[0].userNickNamePlayer.toString());
      print(tuoTempo[0].userLevelTempo.toString());
      print('********************* CLASIFICA ***************');
      emit(SuccessClasificaScreenState(clasifica));

    }).catchError((error){
      print(error.toString());
      emit(ErrorClasificaScreenState(error.toString()));
    });
  }


}