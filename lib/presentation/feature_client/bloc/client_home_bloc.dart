import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomeBloc extends Cubit<int> {
  ClientHomeBloc() : super(0);

  void selectTab(int index) {
    emit(index);
  }
}
