import 'package:sembast/sembast.dart';
import 'package:gamma/data/app_database.dart';
import 'package:gamma/models/river.dart';

class RiverDao {
  static const String RIVER_STORE_NAME = 'rivers';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are river objects converted to Map
  final _riverStore = intMapStoreFactory.store(RIVER_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(River river) async {
    await _riverStore.add(await _db, river.toJson());
  }

  Future update(River river) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(river.id));
    await _riverStore.update(
      await _db,
      river.toJson(),
      finder: finder,
    );
  }

  Future delete(River river) async {
    final finder = Finder(filter: Filter.byKey(river.id));
    await _riverStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<River>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _riverStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<River> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final river = River.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      river.id = snapshot.key;
      return river;
    }).toList();
  }
}