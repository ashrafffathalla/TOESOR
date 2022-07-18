import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/get_all_routes_model.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class MapScreenCubit extends Cubit<MapScreenStates>{
  MapScreenCubit() : super (InitialMapScreenState());
  static MapScreenCubit get(context)=>BlocProvider.of(context);
  
  List<DataModel> data = <DataModel>[];
  bool? success;
  String? message;


  Future<void> getAllRotes() async {
    emit(LoadingTabTwoMapScreenState());
    DioHelper.getData(
        methodUrl: GET_ALLROUTE
    ).then((value) {
      success = value.data['success'];
      message = value.data['message'];
      data = List<DataModel>.from(value.data['data'].map((element) =>DataModel.fromJson(element)));

      emit(SuccessTabTwoMapScreenState(data));
    }).catchError((error) {
      emit(ErrorTabTwoMapScreenState(error));
    });
  }
}