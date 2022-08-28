import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';

import 'package:lawyer_app/src/db/database_provider.dart';
import 'package:lawyer_app/src/entity_controller/data/local/local_repository.dart';
import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/features/tasks/domain/task.dart';

final dateFormatterProvider = Provider<DateFormat>((ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
});

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
final judgesProvider = StreamProvider.autoDispose((ref) => ref
    .watch(sembastDatabasProviderProvider)
    .getAllEntities(AppRoute.judges.name));
final suppliersProvider = StreamProvider(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllEntities(AppRoute.suppliers.name),
);

final getClientByIDProvider =
    StreamProvider.autoDispose.family<Client?, String>(
  (ref, id) => ref
      .watch(sembastDatabasProviderProvider)
      .getEntityByID(id, AppRoute.clients.name),
);
final getAdvocateByIDProvider =
    StreamProvider.autoDispose.family<Client?, String>(
  (ref, id) => ref
      .watch(sembastDatabasProviderProvider)
      .getEntityByID(id, AppRoute.advocates.name),
);
final getCaseByIDProvider = StreamProvider.autoDispose.family<Case?, String>(
  (ref, id) => ref
      .watch(sembastDatabasProviderProvider)
      .getCaseByID(id, AppRoute.cases.name),
);

final filteredClientsProvider =
    StreamProvider.autoDispose.family<List<Client>, String>(
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
final tasksProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllTasks(AppRoute.tasks.name),
);
final filteredTasksProvider =
    StreamProvider.autoDispose.family<List<Task>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredTasks(searchText!, AppRoute.tasks.name),
);
//
final caseTypesProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllCaseType(AppRoute.casesType.name),
);
final filteredCaseTypesProvider =
    StreamProvider.autoDispose.family<List<CaseTypeModel>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredCaseType(searchText!, AppRoute.casesType.name),
);
final taskTypesProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllTaskTypes(AppRoute.tasksType.name),
);
final filteredTaskTypesProvider =
    StreamProvider.autoDispose.family<List<CaseTypeModel>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredTaskTypes(searchText!, AppRoute.tasksType.name),
);
final servicesProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllService(AppRoute.services.name),
);
final filteredServiceProvider =
    StreamProvider.autoDispose.family<List<CaseTypeModel>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredService(searchText!, AppRoute.services.name),
);
final taskTypeProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllTaskTypes(AppRoute.tasksType.name),
);
final filteredTaskTypeProvider =
    StreamProvider.autoDispose.family<List<CaseTypeModel>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredTaskTypes(searchText!, AppRoute.tasksType.name),
);
final taskProvider = StreamProvider.autoDispose(
  (ref) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllTasks(AppRoute.tasks.name),
);
final filteredTaskProvider =
    StreamProvider.autoDispose.family<List<Task>, String?>(
  (ref, searchText) => ref
      .watch(sembastDatabasProviderProvider)
      .getAllFilteredTasks(searchText!, AppRoute.tasks.name),
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
        clientID: entity['clientID'].id.toString(),
        others: entity['others'],
        clientName: entity['clientID'].name.toString(),
        // clientID: entity['title'],
        // attachmentID: entity['attachmentID'].toString(),
        // type: entity['type'],

        date: DateTime.now(),

        //type: entity['type'],
        // others: entity['others'],
      );

  updatedCase(updateData, entity) => entity.copyWith(
        title: updateData['title'],
        description: updateData['description'],
        //description: entity['description'],
        clientID: updateData['clientID'].id.toString(),
        clientName: updateData['clientID'].name.toString(),
        others: updateData['others'],
        date: DateTime.now(),
      );

/*
  updatedCase(updateData, entity) => entity.copyWith(
        name: 'fff',
        //name: updateData['title'],
        description: updateData['description'] ?? '',
        clientID: updateData['clientID'].id.toString(),
        //  clientID: (updateData['clientID'].id).toString(),
        location: updateData['location'] ?? '',
        attachmentID: updateData['attachmentID'] ?? '',
        type: entity['type'] ?? '',
        date: DateTime.now(),
        others: updateData['others'] ?? '',
      );
*/
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

  //Task
  Future<void> addTask(Map<String, dynamic> task, String storeName) async {
    await entityRepository.addTask(newTask(task), storeName);
  }

  Future<void> updateTask(Task caseEntit, Map<String, dynamic> updateCaseData,
      String storeName) async {
    await entityRepository.updateTask(
        updatedTask(updateCaseData, caseEntit), storeName);
  }


  Future<void> deleteTask(Task task, String storeName) async {
    await entityRepository.deleteTask(task.id, storeName);
  }

  newTask(entity) => Task(
        title: entity['title'],
        //description: entity['description'],
        //clientID: entity['clientID'].id.toString(),

       // clientName: entity['clientID'].name.toString(),
        // clientID: entity['titleP'],
        // attachmentID: entity['attachmentID'].toString(),
        // type: entity['type'],

        createdDate: DateTime.now(),

        //type: entity['type'],
        // others: entity['others'],
      );
  updatedTask(updateData, entity) => entity.copyWith(
        title: updateData['title'],
        // description: updateData['description'],
        // //description: entity['description'],
        // clientID: updateData['clientID'].id.toString(),
        // clientName: updateData['clientID'].name.toString(),
        // others: updateData['others'],
        // date: DateTime.now(),
      );
  //Case Type
  Future<void> addCaseType(
      Map<String, dynamic> caseType, String storeName) async {
    await entityRepository.addService(newService(caseType), storeName);
  }

  Future<void> updateCaseType(CaseTypeModel caseType,
      Map<String, dynamic> updateCaseTypeData, String storeName) async {
    await entityRepository.updateCaseType(
        updatedCaseType(updateCaseTypeData, caseType), storeName);
  }

  Future<void> deleteCaseType(CaseTypeModel caseType, String storeName) async {
    await entityRepository.deleteCaseType(caseType.id, storeName);
  }

  newService(entity) => CaseTypeModel(
        title: entity['title'],
        description: entity['description']??'',
        date: DateTime.now(),
        updatedDate:DateTime.now(),

      );
  updatedCaseType(updateData, entity) => entity.copyWith(
        title: updateData['title'],
        description: updateData['description']??'',
        updatedDate:DateTime.now(),
      );
  //Task Type
  Future<void> addService(
      Map<String, dynamic> service, String storeName) async {
    await entityRepository.addService(newService(service), storeName);
  }

  Future<void> updateService(CaseTypeModel caseType,
      Map<String, dynamic> updateServiceData, String storeName) async {
    await entityRepository.updateService(
        updatedTaskType(updateServiceData, caseType), storeName);
  }

  Future<void> deleteService(CaseTypeModel service, String storeName) async {
    await entityRepository.deleteService(service.id, storeName);
  }

  newTaskType(entity) => CaseTypeModel(
        title: entity['title'],
        description: entity['description']??'',
        date: DateTime.now(),
        updatedDate:DateTime.now(),

      );
  updatedTaskType(updateData, entity) => entity.copyWith(
        title: updateData['title'],
        description: updateData['description']??'',
        updatedDate:DateTime.now(),
      );

       Future<void> addTaskType(
      Map<String, dynamic> service, String storeName) async {
    await entityRepository.addTaskType(newService(service), storeName);
  }

  Future<void> updateTaskType(CaseTypeModel caseType,
      Map<String, dynamic> updateServiceData, String storeName) async {
    await entityRepository.updateTaskType(
        updatedTaskType(updateServiceData, caseType), storeName);
  }

  Future<void> deleteTaskType(CaseTypeModel taskTyp, String storeName) async {
    await entityRepository.deleteTaskType(taskTyp.id, storeName);
  }

}
