import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/shared/components/navigationbar/cubit/states.dart';

class NavigationBarCubit extends Cubit<NavigationBarStates>{
  NavigationBarCubit() : super (InitialNavigationBarState());

}