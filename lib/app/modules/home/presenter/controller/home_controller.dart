import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const HomeState.initial());
}
