import 'package:lawyer_app/src/clients/domain/client.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class LocalRepository {


  Future<int> addClient(Client entity);

  Future updateClient(Client entity);

  Future deleteClient(int entityID);

  Stream<List<Client>> getAllClients();
  Stream<List<Client>> getAllFilteredClients(String searchText);

  Future<int> addEmployee(Client entity);

  Future updateEmployee(Client entity);

  Future deleteEmployee(int entityID);

  Stream<List<Client>> getAllEmployees();
  Stream<List<Client>> getAllFilteredEmployees(String searchText);
  Future<int> addAdvocate(Client entity);

  Future updateAdvocate(Client entity);

  Future deleteAdvocate(int entityID);

  Stream<List<Client>> getAllAdvocates();
  Stream<List<Client>> getAllFilteredAdvocates(String searchText);

  Future<int> addSupplier(Client entity);

  Future updateSupplier(Client entity);

  Future deleteSupplier(int entityID);

  Stream<List<Client>> getAllSuppliers();
  Stream<List<Client>> getAllFilteredSuppliers(String searchText);

  Future<int> addJudge(Client entity);

  Future updateJudge(Client entity);

  Future deleteJudge(int entityID);

  Stream<List<Client>> getAllJudges();
}
