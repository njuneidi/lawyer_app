import 'package:sembast/sembast.dart';

enum Stores {
  clientInstances,
  employeeInstances,
  advocateInstances,
  judgeInstances,
  supplierInstances,
  courtsInstances,
}
StoreRef<int, Map<String, Object?>> store(e)=> intMapStoreFactory.store(e);