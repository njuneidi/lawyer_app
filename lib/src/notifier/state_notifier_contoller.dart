import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/features/tasks/domain/task.dart';

class TabItemsNotifier extends StateNotifier<String> {
  TabItemsNotifier() : super('dashboard');
  void linkedPage(String menu) => state = menu;
}

final tabItemsNotifierProvider =
    StateNotifierProvider.autoDispose<TabItemsNotifier, String>((ref) {
  return TabItemsNotifier();
});

class SearchFilterNotifer extends StateNotifier<String?> {
  SearchFilterNotifer() : super(null);
  void searchFilterText(String search) => state = search;
}

final searchFilterNotifierProvider =
    StateNotifierProvider.autoDispose<SearchFilterNotifer, String?>((ref) {
  return SearchFilterNotifer();
});

class PreviousLinkNotifier extends StateNotifier<String> {
  PreviousLinkNotifier() : super('definition');
  void previousPage(String menu) => state = menu;
}

final previousLinkNotifierProvider =
    StateNotifierProvider.autoDispose<PreviousLinkNotifier, String>((ref) {
  return PreviousLinkNotifier();
});

class EntityItemNotifier extends StateNotifier<Client?> {
  EntityItemNotifier() : super(const Client(name: ''));

  void item(Client? client) => state = client;
}

final entityItemNotifierProvider =
    StateNotifierProvider.autoDispose<EntityItemNotifier, Client?>((ref) {
  return EntityItemNotifier();
});

class CourtItemNotifier extends StateNotifier<Court?> {
  CourtItemNotifier() : super(const Court(name: ''));

  void item(Court? court) => state = court;
}

final courtItemNotifierProvider =
    StateNotifierProvider.autoDispose<CourtItemNotifier, Court?>((ref) {
  return CourtItemNotifier();
});

class CaseItemNotifier extends StateNotifier<Case?> {
  CaseItemNotifier() : super( Case(title: ''));

  void item(Case? caseItem) => state = caseItem;
}

final caseItemNotifierProvider =
    StateNotifierProvider.autoDispose<CaseItemNotifier, Case?>((ref) {
  return CaseItemNotifier();
});

class CaseTypeItemNotifier extends StateNotifier<CaseTypeModel?> {
  CaseTypeItemNotifier() : super( CaseTypeModel(title: ''));

  void item(CaseTypeModel? caseTypeItem) => state = caseTypeItem;
}

final caseEntityNotifierProvider =
    StateNotifierProvider.autoDispose<CaseTypeItemNotifier, CaseTypeModel?>((ref) {
  return CaseTypeItemNotifier();
});

class ServiceTypeItemNotifier extends StateNotifier<CaseTypeModel?> {
  ServiceTypeItemNotifier() : super( CaseTypeModel(title: ''));

  void item(CaseTypeModel? service) => state = service;
}

final serviceItemNotifierProvider =
    StateNotifierProvider.autoDispose<ServiceTypeItemNotifier, CaseTypeModel?>((ref) {
  return ServiceTypeItemNotifier();
});
//tasktyp
class TaskTypeItemNotifier extends StateNotifier<CaseTypeModel?> {
  TaskTypeItemNotifier() : super( CaseTypeModel(title: ''));

  void taskItem(CaseTypeModel? service) => state = service;
}

final taskTypeItemNotifierProvider =
    StateNotifierProvider.autoDispose<TaskTypeItemNotifier, CaseTypeModel?>((ref) {
  return TaskTypeItemNotifier();
});
///task
class TaskItemNotifier extends StateNotifier<Task?> {
  TaskItemNotifier() : super( Task(title: ''));

  void item(Task? item) => state = item;
}

final taskItemNotifierProvider =
    StateNotifierProvider.autoDispose<TaskItemNotifier, Task?>((ref) {
  return TaskItemNotifier();
});

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(const Locale('ar', 'PS'));
  void setArabic() => state = const Locale('ar', 'PS');
  void setEnglish() => state = const Locale('en', 'US');
}

final localNotifierProvider =
    StateNotifierProvider.autoDispose<LocaleProvider, Locale>((ref) {
  return LocaleProvider();
});
