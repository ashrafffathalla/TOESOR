import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/post_time_model.dart';
import 'package:toesor/models/time_screen_model.dart';
import 'package:toesor/modules/time_screen/cubit/states.dart';
import '../../../models/sponsor_category_model.dart';
import '../../../shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class TimeScreenCubit extends Cubit<TimeScreenStates> {
  TimeScreenCubit() : super(InitialTimeScreenState());

  static TimeScreenCubit get(context) => BlocProvider.of(context);
  List<Data> data = <Data>[];
  List<Lap> lap = <Lap>[];


  Future<void> getQuizInTimeScreen({
    required int Route_ID,

  })async{
    emit(LoadingTimeScreenState());
    await DioHelper.getData(
      methodUrl: '$SINGLE_ROUTE/$Route_ID',
    ).then((value){
      print(value.data.toString());
      lap = List<Lap>.from(
          value.data['lap'].map((item) => Lap.fromJson(item)));
      print(lap.length);
      print('********************* PLACE ***************');
      emit(SuccessTimeScreenState(lap));
    }).catchError((error){
      print(error.toString());
      emit(ErrorTimeScreenState(error.toString()));
    });
  }

  /////////////////////////////////
  static const countDowenDuration = Duration(minutes: 30);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountDown = false;
//bool addExtraTime = false;

  void reset() {
    if (isCountDown) {
      duration = countDowenDuration;
    } else {
        duration = const Duration();
    }
    emit(CountState());
  }
  int ? addSeconds ;
  void addTime() {
     addSeconds = isCountDown ? -1 : 1;
      final second = duration.inSeconds + addSeconds!;
      if (second < 1) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: second);
      }
      duration = Duration(seconds: second);
      emit(AddTimeState());
  }
///Add 10 Minutes
  int ? addOneAiuto ;
  void oneAiuto() {
    addOneAiuto = isCountDown ? -1 : 600;
    final second = duration.inSeconds + addOneAiuto!;
    if (second < 1) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: second);
    }
    duration = Duration(seconds: second);
    emit(AddOneAiutoState());
  }
///End Add 10 Minutes

  ///Add 20 Minutes
  int ? addTwoAiuto ;
  void TwoAiuto() {
    addTwoAiuto = isCountDown ? -1 : 600;
    final second = duration.inSeconds + addTwoAiuto!;
    if (second < 1) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: second);
    }
    duration = Duration(seconds: second);
    emit(AddTwoAiutoState());
  }
  ///End Add 20 Minutes
  ///
    ///Add 20 Minutes
    int ? addThreeAiuto ;
    void ThreeAiuto() {
      addThreeAiuto = isCountDown ? -1 : 600;
      final second = duration.inSeconds + addThreeAiuto!;
      if (second < 1) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: second);
      }
      duration = Duration(seconds: second);
      emit(AddThreeAiutoState());
    }
    ///End Add 20 Minutes
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    emit(StartTimeState());
  }

  ///Disable botton1
bool isButtonOneActive = true;
  void changeButtonActive(){
     isButtonOneActive = false;
    emit(ChangeisButtonActive());
  }
  ///Disable botton2
  bool isButtonTwoActive = true;
  void changeButtonTwoActive(){
    isButtonTwoActive = false;
    emit(ChangeisButtonActive());
  }
  ///Disable botton3
  bool isButtonThreeActive = true;
  void changeButtonThreeActive(){
    isButtonThreeActive = false;
    emit(ChangeisButtonThreeActive());
  }

  //START POST TIME AND ROUTE_ID AND TAP_ID FUNCTION
  PostTimeModel? postTimeModel;
  Future<void> saveTimeAndRouteIDAndTapId({
    required String route_id,
    required String Tap_id,
    required String Time,
  })async{
    emit(LoadingPostTimeState());
    DioHelper.postData(
        methodUrl: POST_TIME,
        data: {
          "route_id": route_id,
          "Tap_id": Tap_id,
          "Total_Time_Tap": Time,
        }
    ).then((value) {
      postTimeModel = PostTimeModel.fromJson(value.data);
       print(postTimeModel!.message.toString());
       print('#####################');
      emit(SuccessPostTimeState(postTimeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPostTimeState(error.toString()));
      // print(error.toString());
    });
  }
  //End POST TIME AND ROUTE_ID AND TAP_ID FUNCTION

}
