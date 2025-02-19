import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavChanged(selectedIndex: 0)) {
    on<ChangeTab>((event, emit) {
      emit(BottomNavChanged(selectedIndex: event.newIndex));
    });
  }
}
