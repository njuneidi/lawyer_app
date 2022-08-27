List<String> entityList = [
  AppRoute.employees.name,
  AppRoute.clients.name,
  AppRoute.advocates.name,
  AppRoute.judges.name,
  AppRoute.suppliers.name
];

List<String> editEntityList = [
  AppRoute.editEmployees.name,
  AppRoute.editClients.name,
  AppRoute.editAdvocates.name,
  AppRoute.editJudges.name,
  AppRoute.editSuppliers.name
];
List<String> caseList = [
  AppRoute.courts.name,
  AppRoute.services.name,
  AppRoute.cases.name,
  AppRoute.documents.name,
  AppRoute.tasks.name
];


enum AppRoute {
  root,
  home,
  dashboard,
  definition,
  transaction,
  finance,
  reports,
  setting,
  signIn,
  user,

  accounts,

  clients,
  editClients,
  employees,
  editEmployees,
  advocates,
  editAdvocates,
  suppliers,
  editSuppliers,
  services,

  courts,
  editCourts,
  judges,
  editJudges,
  cases,
  editCases,
  casesType,
  powerOfAttorney,
  documents,
  tasks,
  alerts,
  invoice,
  relatedActs,
  relatedJudgments,
}
