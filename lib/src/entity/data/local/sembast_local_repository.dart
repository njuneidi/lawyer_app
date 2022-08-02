

import 'package:flutter/foundation.dart';

import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/entity/data/local/local_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastRepository implements LocalRepository {
  final Database db;
  //final store = StoreRef.main;
  final store = intMapStoreFactory.store(clientInstancesKey);
  static const clientInstancesKey = 'clientInstances';

  final storeEmployee = intMapStoreFactory.store(employeeInstancesKey);
  static const employeeInstancesKey = 'employeeInstances';

  final storeAdvocate = intMapStoreFactory.store(advocateInstancesKey);
  static const advocateInstancesKey = 'advocateInstances';

  final storeSupplier = intMapStoreFactory.store(supplierInstancesKey);
  static const supplierInstancesKey = 'supplierInstances';

  final storeJudge = intMapStoreFactory.store(judgeInstancesKey);
  static const judgeInstancesKey = 'judgeInstances';

  SembastRepository({required this.db});

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
  Future deleteClient(int entityID) => store.record(entityID).delete(db);
  @override
  Future deleteEmployee(int entityID) =>
      storeEmployee.record(entityID).delete(db);

  @override
  Stream<List<Client>> getAllClients() => store.query().onSnapshots(db).map(
        (snapshot) => snapshot
            .map((entity) =>
                Client.fromJson(entity.value).copyWith(id: entity.key))
            .toList(growable: false),
      );
  @override
  Stream<List<Client>> getAllFilteredClients(sarchText) =>
      store.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );
  @override
  Stream<List<Client>> getAllFilteredEmployees(sarchText) =>
      storeEmployee.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );

  @override
  Stream<List<Client>> getAllFilteredAdvocates(sarchText) =>
      storeAdvocate.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );
  @override
  Stream<List<Client>> getAllFilteredSuppliers(sarchText) =>
      storeSupplier.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );
  Stream<List<Client>> getAllFilteredJudges(sarchText) =>
      storeJudge.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .where((element) => element.toString().contains(sarchText))
                .toList(growable: false),
          );

  @override
  Stream<List<Client>> getAllEmployees() =>
      storeEmployee.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );
          int x(entity)=> entity.length;
  //   throw UnimplementedError();
  // }

  @override
  Future<int> addClient(Client entity) => store.add(db, entity.toJson());
  @override
  Future<int> addEmployee(Client entity) =>
      storeEmployee.add(db, entity.toJson());

  @override
  Future<void> updateClient(Client entity) =>
      store.record(entity.id).update(db, entity.toJson());

  @override
  Future updateEmployee(Client entity) =>
      storeEmployee.record(entity.id).update(db, entity.toJson());

  @override
  Future<int> addAdvocate(Client entity) =>
      storeAdvocate.add(db, entity.toJson());

  @override
  Future<int> addJudge(Client entity) => storeJudge.add(db, entity.toJson());

  @override
  Future<int> addSupplier(Client entity) =>
      storeSupplier.add(db, entity.toJson());

  @override
  Future deleteAdvocate(int entityID) =>
      storeAdvocate.record(entityID).delete(db);

  @override
  Future deleteJudge(int entityID) => storeJudge.record(entityID).delete(db);

  @override
  Future deleteSupplier(int entityID) =>
      storeSupplier.record(entityID).delete(db);

  @override
  Future updateSupplier(Client entity) =>
      storeSupplier.record(entity.id).update(db, entity.toJson());

  @override
  Stream<List<Client>> getAllAdvocates() =>
      storeAdvocate.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );

  @override
  Stream<List<Client>> getAllJudges() => storeJudge.query().onSnapshots(db).map(
        (snapshot) => snapshot
            .map((entity) =>
                Client.fromJson(entity.value).copyWith(id: entity.key))
            .toList(growable: false),
      );

  @override
  Stream<List<Client>> getAllSuppliers() =>
      storeSupplier.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
                .toList(growable: false),
          );

  @override
  Future updateAdvocate(Client entity) =>
      storeAdvocate.record(entity.id).update(db, entity.toJson());

  @override
  Future updateJudge(Client entity) =>
      storeJudge.record(entity.id).update(db, entity.toJson());
}
