import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';
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
final employeesProvider = StreamProvider(
  (ref) => ref.watch(sembastDatabasProviderProvider).getAllEmployees(),
);

class EntityConroller {
  final LocalRepository entityRepository;
  EntityConroller({required this.entityRepository});

  Future<void> addClient(Map<String, dynamic> entity) async {
    final newEntity = Client(
      name: entity['name'],
      address: entity['address'],
      city: entity['city'],
      dob: entity['dob'],
      email: entity['email'],
      phone: entity['phone'],
      gender: entity['gender'],
    );

    await entityRepository.addClient(newEntity);
  }

  Future<void> addEmployee(Map<String, dynamic> entity) async {
    final newEntity = Client(
      name: entity['name'],
      address: entity['address'],
      city: entity['city'],
      dob: entity['dob'],
      email: entity['email'],
      phone: entity['phone'],
      gender: entity['gender'],
    );

    await entityRepository.addEmployee(newEntity);
  }

  Future<void> updateClient(
      Client entity, Map<String, dynamic> updateEntityData) async {
    debugPrint("dddd");
    final updatedClient = entity.copyWith(
      name: updateEntityData['name'],
      address: updateEntityData['address'],
      city: updateEntityData['city'],
      dob: updateEntityData['dob'],
      email: updateEntityData['email'],
      phone: updateEntityData['phone'],
      gender: updateEntityData['gender'],
    );
    await entityRepository.updateClient(updatedClient);
  }

  Future<void> updateEmployee(
      Client entity, Map<String, dynamic> updateEntityData) async {
    debugPrint("dddd");
    final updatedEmployee = entity.copyWith(
      name: updateEntityData['name'],
      address: updateEntityData['address'],
      city: updateEntityData['city'],
      dob: updateEntityData['dob'],
      email: updateEntityData['email'],
      phone: updateEntityData['phone'],
      gender: updateEntityData['gender'],
    );
    await entityRepository.updateEmployee(updatedEmployee);
  }

  Future<void> deleteClient(Client entity) async {
    await entityRepository.deleteClient(entity.id);
  }

  Future<void> deleteEmployee(Client entity) async {
    await entityRepository.deleteEmployee(entity.id);
  }
}
