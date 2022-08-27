import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';


/// API for reading, watching and writing local cart data (guest user)
abstract class LocalRepository {
  Future<int> addEntity(Client entity, String storeName);

  Future updateEntity(Client entity, String storeName);

  Future deleteEntity(int entityID, String storeName);

  Stream<List<Client>> getAllEntities(String storeName);
  Stream<List<Client>> getAllFilteredEntities(
      String searchText, String storeName);

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

}
