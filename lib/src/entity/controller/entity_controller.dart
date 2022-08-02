import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/entity/controller/entity_state.dart';
import 'package:lawyer_app/src/entity/data/local/local_repository.dart';

final entityControllerProvider = Provider(
  (ref) => EntityConroller(
    entityRepository: ref.watch(sembastDatabasProviderProvider),
  ),
);

final clientsProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllClients(),
);

final filteredClientsProvider = StreamProvider.autoDispose.family<dynamic,String>(
  (ref,searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredClients(searchText),
);

final filteredEmployeesProvider = StreamProvider.autoDispose.family<dynamic,String>(
  (ref,searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEmployees(searchText),
);
final filteredAdvocatesProvider = StreamProvider.autoDispose.family<dynamic,String>(
  (ref,searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredAdvocates(searchText),
);
final filteredSuppliersProvider = StreamProvider.autoDispose.family<dynamic,String>(
  (ref,searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredSuppliers(searchText),
);
final filteredJudgesProvider = StreamProvider.autoDispose.family(
  (ref,searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredJudges(searchText),
);

final employeesProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllEmployees(),
);
final advocatesProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllAdvocates(),
);
final judgesProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllJudges(),
);
final suppliersProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllSuppliers(),
);

class EntityConroller {
  final LocalRepository entityRepository;
  EntityConroller({required this.entityRepository});

  newEntity(entity) => Client(
        name: entity['name'],
        address: entity['address'],
        city: entity['city'],
        dob: entity['dob'],
        email: entity['email'],
        phone: entity['phone'],
        mobile: entity['mobile'],
        gender: entity['gender'],
      );

  updatedClient(updateEntityData, entity) => entity.copyWith(
        name: updateEntityData['name'],
        address: updateEntityData['address'],
        city: updateEntityData['city'],
        dob: updateEntityData['dob'],
        email: updateEntityData['email'],
        phone: updateEntityData['phone'],
        mobile: updateEntityData['mobile'],
        gender: updateEntityData['gender'],
      );

  Future<void> addClient(Map<String, dynamic> entity) async {
    // final newEntity(entity) = newEntity(entity)(entity);

    await entityRepository.addClient(newEntity(entity));
  }

  Future<void> addEmployee(Map<String, dynamic> entity) async {
    await entityRepository.addEmployee(newEntity(entity));
  }

  Future<void> addJudge(Map<String, dynamic> entity) async {
    await entityRepository.addJudge(newEntity(entity));
  }

  Future<void> addAdvocate(Map<String, dynamic> entity) async {
    await entityRepository.addAdvocate(newEntity(entity));
  }

  Future<void> addSupplier(Map<String, dynamic> entity) async {
    await entityRepository.addSupplier(newEntity(entity));
  }

  Future<void> updateClient(
      Client entity, Map<String, dynamic> updateEntityData) async {
    await entityRepository
        .updateClient(updatedClient(updateEntityData, entity));
  }

  Future<void> updateEmployee(
      Client entity, Map<String, dynamic> updateEntityData) async {
    await entityRepository
        .updateEmployee(updatedClient(updateEntityData, entity));
  }

  Future<void> updateSupplier(
      Client entity, Map<String, dynamic> updateEntityData) async {
    await entityRepository
        .updateSupplier(updatedClient(updateEntityData, entity));
  }

  Future<void> updateAdvocate(
      Client entity, Map<String, dynamic> updateEntityData) async {
    await entityRepository
        .updateAdvocate(updatedClient(updateEntityData, entity));
  }

  Future<void> updateJudge(
      Client entity, Map<String, dynamic> updateEntityData) async {
    await entityRepository.updateJudge(updatedClient(updateEntityData, entity));
  }

  Future<void> deleteClient(Client entity) async {
    await entityRepository.deleteClient(entity.id);
  }

  Future<void> deleteEmployee(Client entity) async {
    await entityRepository.deleteEmployee(entity.id);
  }

  Future<void> deleteAdvocate(Client entity) async {
    await entityRepository.deleteAdvocate(entity.id);
  }

  Future<void> deleteJudge(Client entity) async {
    await entityRepository.deleteJudge(entity.id);
  }

  Future<void> deleteSupplier(Client entity) async {
    await entityRepository.deleteSupplier(entity.id);
  }
}
