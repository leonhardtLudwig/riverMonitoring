import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../data/river_dao.dart';

class RiverBloc extends Bloc<RiverEvent, RiverState> {
  RiverDao _riverDao = RiverDao();
  @override
  RiverState get initialState => InitialRiverState();

  @override
  Stream<RiverState> mapEventToState(
    RiverEvent event,
  ) async* {
  if (event is LoadRivers) {
      yield RiversLoading();
      yield* _reloadRivers();
    } else if (event is DeleteRiver) {
      await _riverDao.delete(event.river);
      yield* _reloadRivers();
    }
  }

  Stream<RiverState> _reloadRivers() async* {
    final rivers = await _riverDao.getAllSortedByName();
    // Yielding a state bundled with the Rivers from the database.
    yield RiversLoaded(rivers);
  }
}/*
class RandomFruitGenerator {
  static final _fruits = [
    River(name: 'Banana', isSweet: true),
    River(name: 'Strawberry', isSweet: true),
    River(name: 'Kiwi', isSweet: false),
    River(name: 'Apple', isSweet: true),
    River(name: 'Pear', isSweet: true),
    River(name: 'Lemon', isSweet: false),
  ];

  static River getRandomRiver() {
    return _fruits[Random().nextInt(_rivers.length)];
  }
}*/