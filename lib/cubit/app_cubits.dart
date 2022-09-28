import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_app/cubit/app_cubit_states.dart';
import 'package:good_app/model/data_model.dart';
import 'package:good_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  DataServices data;
  late final places;
  void getData() async
  {
    try{
        emit(LoadingState());
        places=await data.getInfo();
        emit(LoadedState(places));
    }
    catch(e)
    {
      
    }
  }

  detailPage(DataModel data){
    emit(DetailState( data));

  }

  goHome(){
    emit(LoadedState(places));
  }


}