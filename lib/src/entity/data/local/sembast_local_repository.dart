import 'package:flutter/foundation.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';
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
  Stream<List<Client>> getAllClients() =>
      store.query().onSnapshots(db).map(
            (snapshot) => snapshot
                .map((entity) =>
                    Client.fromJson(entity.value).copyWith(id: entity.key))
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

}
