part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState {}

class BottomNavChanged extends BottomNavState {
  final int selectedIndex;
  BottomNavChanged({required this.selectedIndex});
}
