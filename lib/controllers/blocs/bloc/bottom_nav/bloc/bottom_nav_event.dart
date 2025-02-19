part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavEvent {}

class ChangeTab extends BottomNavEvent {
  final int newIndex;
  ChangeTab({required this.newIndex});
}
