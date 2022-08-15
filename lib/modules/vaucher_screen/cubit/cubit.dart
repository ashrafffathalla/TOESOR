import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/models/single_route_model.dart';
import 'package:toesor/modules/vaucher_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';

import '../../../models/sponsor_category_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

class AllSponsorCubit extends Cubit<GetAllSponsorStates> {
  AllSponsorCubit() : super(InitialGetAllSponsorState());

  static AllSponsorCubit get(context) => BlocProvider.of(context);

  List<Sponsor> sponsor = <Sponsor>[];
  List<Data> data = <Data>[];
  List<SponsorCategories> sponsorCategories = <SponsorCategories>[];

  SingleRouteModel? singleRouteModel;

  Future<void> getAllSponsor({
    required int Route_ID,

  })async{
    emit(LoadingGetAllSponsorState());
    await DioHelper.getData(
        methodUrl: '$SINGLE_ROUTE/$Route_ID',
     ).then((value){
       print(value.data.toString());
       emit(SuccessGetAllSponsorState());
      singleRouteModel = SingleRouteModel.fromJson(value.data);
       sponsor = List<Sponsor>.from(
           value.data['sponsor'].map((item) => Sponsor.fromJson(item)));
       sponsorCategories = List<SponsorCategories>.from(
           value.data['sponsor_categories'].map((item) => SponsorCategories.fromJson(item)));

      print(singleRouteModel!.sponsor![0].descr);
      print(singleRouteModel!.sponsor_categories![0].categoryName.toString());
      print('********************* sponsor ***************');
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetAllSponsorState(error.toString()));
    });
  }

  ///
  SponsorCategoryModel ? sponsorCategoryModel;
  Future<void> getAllSponsorCategory()async{
    emit(LoadingGetAllSponsorCategoryState());
    await DioHelper.getData(
      methodUrl: SPONSOR_CATEGORY,
    ).then((value){
      print(value.data);
      emit(SuccessGetAllSponsorCategoryState());
      sponsorCategoryModel = SponsorCategoryModel.fromJson(value.data);
      data = List<Data>.from(
          value.data['data'].map((item) => Data.fromJson(item)));
      print('********************* sponsorCAT ***************');
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetAllSponsorCategoryState(error.toString()));
    });
  }
}
