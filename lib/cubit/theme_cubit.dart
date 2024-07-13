import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeState.initialValue());


  
  
  void CheckTheme(bool checkTheme){
    emit(state.copyWith(isTheme: checkTheme));
  }
}