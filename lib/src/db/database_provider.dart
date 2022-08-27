import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/global_provider.dart';
import 'package:lawyer_app/src/entity_controller/data/local/sembast_local_repository.dart';

final sembastDatabasProviderProvider = Provider(
  (ref) => SembastRepository(
    db: ref.watch(databaseProvider),
    
  ),
);


