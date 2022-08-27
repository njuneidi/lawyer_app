import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';

import 'package:lawyer_app/src/db/database_provider.dart';
import 'package:lawyer_app/src/entity_controller/data/local/local_repository.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';

final entityControllerProvider = Provider(
  (ref) => EntityConroller(
    entityRepository: ref.watch(sembastDatabasProviderProvider),
  ),
);

final clientsProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllEntities(AppRoute.clients.name),
);

final employeesProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllEntities(AppRoute.employees.name),
);
final advocatesProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllEntities(AppRoute.advocates.name),
);
final judgesProvider = StreamProvider((ref) => ref
    .watch(sembastDatabasProviderProvider)
    .getAllEntities(AppRoute.judges.name));
final suppliersProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllEntities(AppRoute.suppliers.name),
);

final filteredClientsProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.clients.name),
);
final filteredClientsProvider2 =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.clients.name),
);

final filteredEmployeesProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.employees.name),
);
final filteredAdvocatesProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.advocates.name),
);
final filteredSuppliersProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.suppliers.name),
);
final filteredJudgesProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredEntities(searchText, AppRoute.judges.name),
);
final courtsProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllCourts(AppRoute.courts.name),
);
final filteredCourtsProvider =
    StreamProvider.autoDispose.family<dynamic, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredCourts(searchText, AppRoute.courts.name),
);
final casesProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllCases(AppRoute.cases.name),
);
final filteredCasesProvider =
    StreamProvider.autoDispose.family<List<Case>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredCases(searchText!, AppRoute.cases.name),
);
final filteredCasesProvider1 =
    StreamProvider.autoDispose.family<List<Case>, String>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredCases(searchText, AppRoute.cases.name),
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

  updatedEntityData(updateEntityData, entity) => entity.copyWith(
        name: updateEntityData['name'],
        address: updateEntityData['address'],
        city: updateEntityData['city'],
        dob: updateEntityData['dob'],
        email: updateEntityData['email'],
        phone: updateEntityData['phone'],
        mobile: updateEntityData['mobile'],
        gender: updateEntityData['gender'],
        //gender2: updateEntityData['gender2'],
      );

  Future<void> addEntity(Map<String, dynamic> entity, String storeName) async {
    await entityRepository.addEntity(newEntity(entity), storeName);
  }

  Future<void> updateEntity(Client entity,
      Map<String, dynamic> updateEntityData, String storeName) async {
    await entityRepository.updateEntity(
        updatedEntityData(updateEntityData, entity), storeName);
  }

  Future<void> deleteEntity(Client entity, String storeName) async {
    await entityRepository.deleteEntity(entity.id, storeName);
  }

  //court

  newCourt(entity) => Court(
        name: entity['name'],
        address: entity['address'],
        city: entity['city'],
        location: entity['location'],
        phone: entity['phone'],
      );

  updatedCourt(updateData, entity) => entity.copyWith(
        name: updateData['name'],
        address: updateData['address'],
        city: updateData['city'],
        // location: updateData['location'],
        phone: updateData['phone'],
      );

  Future<void> addCourt(Map<String, dynamic> court, String storeName) async {
    await entityRepository.addCourt(newCourt(court), storeName);
  }

  Future<void> updateCourt(Court court, Map<String, dynamic> updateCourtData,
      String storeName) async {
    await entityRepository.updateCourt(
        updatedCourt(updateCourtData, court), storeName);
  }

  Future<void> deleteCourt(Court court, String storeName) async {
    await entityRepository.deleteCourt(court.id, storeName);
  }

  //case
  newCase(entity) => Case(
        title: entity['title'],
        description: entity['description'],
        clientID: entity['clientID'],
        attachmentID: entity['attachmentID'].toString(),
        //type: entity['type'],
       // others: entity['others'],
      );

  updatedCase(updateData, entity) => entity.copyWith(
        name: updateData['title'],
        description: updateData['description'],
        clientID: updateData['clientID'],
        // location: updateData['location'],
        attachmentID: updateData['attachmentID'],
       // type: updateData['type'],
       // others: updateData['others'],
      );

  Future<void> addCase(Map<String, dynamic> caseEntit, String storeName) async {
    await entityRepository.addCase(newCase(caseEntit), storeName);
  }

  Future<void> updateCase(Case caseEntit, Map<String, dynamic> updateCaseData,
      String storeName) async {
    await entityRepository.updateCase(
        updatedCase(updateCaseData, caseEntit), storeName);
  }

  Future<void> deleteCase(Case caseEntit, String storeName) async {
    await entityRepository.deleteCase(caseEntit.id, storeName);
  }
}
