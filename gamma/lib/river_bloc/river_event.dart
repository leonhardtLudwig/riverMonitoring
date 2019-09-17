import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/river.dart';

@immutable
abstract class RiverEvent extends Equatable {
  RiverEvent([List props = const <dynamic>[]]) : super(props);
}
class LoadRivers extends RiverEvent {}

class AddRandomRiver extends RiverEvent {}

class UpdateWithRandomRiver extends RiverEvent {
  final River updatedRiver;

  UpdateWithRandomRiver(this.updatedRiver) : super([updatedRiver]);
}

class DeleteRiver extends RiverEvent {
  final River river;

  DeleteRiver(this.river) : super([river]);
}