import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';

class ClientRowNotifier extends StateNotifier<Client?> {
  ClientRowNotifier() : super(const Client(name: ''));
  

  void entityRow(Client? client) => state = client;
}

final clientRowProvider =
    StateNotifierProvider.autoDispose<ClientRowNotifier, Client?>((ref) {
  return ClientRowNotifier();
});

