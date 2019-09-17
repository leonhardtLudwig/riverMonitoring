import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/river.dart';

@immutable
abstract class RiverState extends Equatable {
  RiverState([List props = const <dynamic>[]]) : super(props);
}

class InitialRiverState extends RiverState {}
class RiversLoading extends RiverState {}

class RiversLoaded extends RiverState {
  List<River> rivers =  [
  new River(
    'Piave',
    DateTime.now(),
    2,
    'Questo è un test\nper vedere se\nle note funzionano',
  )
];

  RiversLoaded(this.rivers) : super([rivers]);
}