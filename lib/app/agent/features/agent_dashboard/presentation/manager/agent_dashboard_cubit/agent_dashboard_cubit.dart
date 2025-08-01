import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/repository/agent_dashboard_repo.dart';

part 'agent_dashboard_state.dart';

class AgentDashboardCubit extends Cubit<AgentDashboardState> {
  AgentDashboardCubit(this.agentDashboardRepo) : super(AgentDashboardInitial());

  final AgentDashboardRepo agentDashboardRepo;

  Future<void> fetchCustomerList({required String agentId}) async {
    var result = await agentDashboardRepo.fetchCustomerList(agentId: agentId);
    emit(AgentDashboardLoading());
    result.fold(
      (error) {
        emit(AgentDashboardFailure(error.errorMessage));
      },
      (value) {
        emit(AgentDashboardSuccess(value));
      },
    );
  }
}
