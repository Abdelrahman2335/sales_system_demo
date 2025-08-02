import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/repository/agent_dashboard_repo.dart';
import 'package:sales_system_demo/app/core/services/firebase_service.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

part 'agent_dashboard_state.dart';

class AgentDashboardCubit extends Cubit<AgentDashboardState> {
  AgentDashboardCubit(this.agentDashboardRepo) : super(AgentDashboardInitial());

  final AgentDashboardRepo agentDashboardRepo;
  // TODO: Use the agentId to add the customer.
  final FirebaseService firebaseService = FirebaseService();

  Future<void> fetchCustomerList() async {
    emit(AgentDashboardLoading());
    var result = await agentDashboardRepo.fetchCustomerList(agentId: "");
    result.fold(
      (error) {
        emit(AgentDashboardFailure(error.errorMessage));
      },
      (value) {
        emit(AgentDashboardSuccess(value));
      },
    );
  }

  void filterByInterestLevel({
    InterestLevel? level,
    required List<CustomerModel> allCustomers,
  }) {
    emit(AgentDashboardLoading());
    if (level == null) {
      // Show all customers
      emit(AgentDashboardSuccess(allCustomers));
    } else {
      final filtered =
          allCustomers.where((c) => c.interestLevel == level).toList();
      emit(AgentDashboardFiltered(filtered));
      DebugLogger.log(filtered.first.fullName);
    }
  }

  Map<InterestLevel, int> getLeadCountsByLevel() {
    if (state is AgentDashboardSuccess) {
      final customers = (state as AgentDashboardSuccess).customers;

      // Initialize counts for all enum values
      final counts = <InterestLevel, int>{};
      for (final level in InterestLevel.values) {
        counts[level] = customers.where((c) => c.interestLevel == level).length;
      }

      return counts;
    }

    // Return empty counts if no data
    return {for (final level in InterestLevel.values) level: 0};
  }

  int getTotalCustomerCount() {
    if (state is AgentDashboardSuccess) {
      return (state as AgentDashboardSuccess).customers.length;
    }
    return 0;
  }
}
