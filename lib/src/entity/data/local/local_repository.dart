import 'package:lawyer_app/src/clients/domain/client.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class LocalRepository {


  Future<int> addClient(Client entity);

  Future updateClient(Client entity);

  Future deleteClient(int entityID);

  Stream<List<Client>> getAllClients();

  Future<int> addEmployee(Client entity);

  Future updateEmployee(Client entity);

  Future deleteEmployee(int entityID);

  Stream<List<Client>> getAllEmployees();
  Future<int> addAdvocate(Client entity);

  Future updateAdvocate(Client entity);

  Future deleteAdvocate(int entityID);

  Stream<List<Client>> getAllAdvocates();

  Future<int> addSupplier(Client entity);

  Future updateSupplier(Client entity);

  Future deleteSupplier(int entityID);

  Stream<List<Client>> getAllSuppliers();

  Future<int> addJudge(Client entity);

  Future updateJudge(Client entity);

  Future deleteJudge(int entityID);

  Stream<List<Client>> getAllJudges();
}
