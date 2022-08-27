import 'package:flutter/foundation.dart';
import 'package:lawyer_app/src/constants/store_definition.dart';
import 'package:lawyer_app/src/entity_controller/data/local/local_repository.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastRepository implements LocalRepository {
  final Database db;
  //final store = StoreRef.main;

  SembastRepository({
    required this.db,
  });

  static Future<Database> createDatabse(String filename) async {
    if (!kIsWeb) {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
    } else {
      return databaseFactoryWeb.openDatabase(filename);
    }
  }

  static Future<SembastRepository> makeDefault() async {
    return SembastRepository(db: await createDatabse('default.db'));
  }

// cliets
  @override
  Future deleteEntity(int entityID, String storeName) =>
      store(storeName).record(entityID).delete(db);

  @override
  Stream<List<Client>> getAllEntities(String storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );

          
  @override
  Stream<List<Client>> getAllFilteredEntities(sarchText, storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );



  @override
  Future<int> addEntity(Client entity, String storeName) =>
      store(storeName).add(db, entity.toJson());

  @override
  Future<void> updateEntity(Client entity, String storeName) =>
      store(storeName).record(entity.id).update(db, entity.toJson());

//court
  @override
  Future<int> addCourt(Court court, String storeName) =>
      store(storeName).add(db, court.toJson());

  @override
  Future deleteCourt(int courtID, String storeName) =>
      store(storeName).record(courtID).delete(db);

    @override
  Stream<List<Court>> getAllCourts(String storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Court.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );

  @override
  Stream<List<Court>> getAllFilteredCourts(
          String searchText, String storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Court.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(searchText))
                .toList(growable: false),
          );
  @override
  // Future updateCourt(Court court) =>
  //   storeCourt.record(court.id).update(db, court.toJson());
  Future updateCourt(Court court, String storeName) =>
      store(storeName).record(court.id).update(db, court.toJson());

//case
  @override
  Future<int> addCase(Case caseEntity, String storeName) =>
      store(storeName).add(db, caseEntity.toJson());

  @override
  Future deleteCase(int caseID, String storeName) =>
      store(storeName).record(caseID).delete(db);

    @override
  Stream<List<Case>> getAllCases(String storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Case.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );

  @override
  Stream<List<Case>> getAllFilteredCases(
          String searchText, String storeName) =>
      store(storeName).query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Case.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(searchText))
                .toList(growable: false),
          );
  @override
  // Future updateCase(Case case) =>
  //   storeCase.record(case.id).update(db, case.toJson());
  Future updateCase(Case caseEntity, String storeName) =>
      store(storeName).record(caseEntity.id).update(db, caseEntity.toJson());




}
