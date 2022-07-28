import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';

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
}
