import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/modules/classifica_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../models/clasifica_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ClasificaCubit extends Cubit<ClasificaStates> {
  ClasificaCubit() : super (InitialClasificaScreenState());
  static ClasificaCubit get(context) => BlocProvider.of(context);

  List<Classifica> clasifica = <Classifica>[];

  Future<void> getClasifica({
    required int Route_ID,

  })async{
    emit(LoadingClasificaScreenState());
    await DioHelper.getData(
      methodUrl: '$CLASIFICA/$Route_ID',
    ).then((value){
      print(value.data.toString());
      clasifica = List<Classifica>.from(
          value.data['Classifica'].map((item) => Classifica.fromJson(item)));
      print(clasifica.length);
      print('********************* CLASIFICA ***************');
      emit(SuccessClasificaScreenState(clasifica));
    }).catchError((error){
      print(error.toString());
      emit(ErrorClasificaScreenState(error.toString()));
    });
  }


}