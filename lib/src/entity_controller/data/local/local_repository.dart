import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/features/tasks/domain/task.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class LocalRepository {
  Future<int> addEntity(Client entity, String storeName);

  Future updateEntity(Client entity, String storeName);

  Future deleteEntity(int entityID, String storeName);

  Stream<List<Client>> getAllEntities(String storeName);
  Stream<List<Client>> getAllFilteredEntities(
      String searchText, String storeName);
  Stream<Client?> getEntityByID(String storeName, String id);

// court
  Future<int> addCourt(Court court, String storeName);

  Future updateCourt(Court court, String storeName);

  Future deleteCourt(int courtID, String storeName);

  Stream<List<Court>> getAllCourts(String storeName);
  Stream<List<Court>> getAllFilteredCourts(String searchText, String storeName);

  // cases
  Future<int> addCase(Case caseCase, String storeName);

  Future updateCase(Case caseCase, String storeName);

  Future deleteCase(int caseCaseID, String storeName);

  Stream<List<Case>> getAllCases(String storeName);
  Stream<List<Case>> getAllFilteredCases(String searchText, String storeName);
   Stream<Case?> getCaseByID(String storeName, String id);

   // case type
  Future<int> addCaseType(CaseTypeModel caseType, String storeName);

  Future updateCaseType(CaseTypeModel caseType, String storeName);

  Future deleteCaseType(int caseTypeID, String storeName);

  Stream<List<CaseTypeModel>> getAllCaseType(String storeName);
  Stream<List<CaseTypeModel>> getAllFilteredCaseType(String searchText, String storeName);
   Stream<CaseTypeModel?> getCaseTypeByID(String storeName, String id);
   // services
  Future<int> addService(CaseTypeModel service, String storeName);

  Future updateService(CaseTypeModel service, String storeName);

  Future deleteService(int serviceID, String storeName);

  Stream<List<CaseTypeModel>> getAllService(String storeName);
  Stream<List<CaseTypeModel>> getAllFilteredService(String searchText, String storeName);
   Stream<CaseTypeModel?> getServiceByID(String storeName, String id);
  //taks
  Future<int> addTask(Task task, String storeName);

  Future updateTask(Task task, String storeName);

  Future deleteTask(int taskID, String storeName);

  Stream<List<Task>> getAllTasks(String storeName);
  Stream<List<Task>> getAllFilteredTasks(String searchText, String storeName);
     Stream<Task?> getTaskByID(String storeName, String id);
  //taks type
  Future<int> addTaskType(CaseTypeModel task, String storeName);

  Future updateTaskType(CaseTypeModel task, String storeName);

  Future deleteTaskType(int taskTypeID, String storeName);

  Stream<List<CaseTypeModel>> getAllTaskTypes(String storeName);
  Stream<List<CaseTypeModel>> getAllFilteredTaskTypes(String searchText, String storeName);
     Stream<CaseTypeModel?> getTaskTypeByID(String storeName, String id);
}
