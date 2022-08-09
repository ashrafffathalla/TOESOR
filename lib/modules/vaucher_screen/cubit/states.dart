abstract class GetAllSponsorStates {}

class InitialGetAllSponsorState extends GetAllSponsorStates {}

class LoadingGetAllSponsorState extends GetAllSponsorStates{}

class SuccessGetAllSponsorState extends GetAllSponsorStates{}

class ErrorGetAllSponsorState extends GetAllSponsorStates{
  final String? error;
  ErrorGetAllSponsorState(this.error);
}
////////////////////////////////////
class LoadingGetAllSponsorCategoryState extends GetAllSponsorStates{}

class SuccessGetAllSponsorCategoryState extends GetAllSponsorStates{}

class ErrorGetAllSponsorCategoryState extends GetAllSponsorStates{
  final String? error;
  ErrorGetAllSponsorCategoryState(this.error);
}
