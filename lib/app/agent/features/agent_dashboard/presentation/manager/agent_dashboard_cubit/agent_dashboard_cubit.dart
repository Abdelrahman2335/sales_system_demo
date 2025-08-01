import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/repository/agent_dashboard_repo.dart';
import 'package:sales_system_demo/app/core/services/firebase_service.dart';

part 'agent_dashboard_state.dart';

class AgentDashboardCubit extends Cubit<AgentDashboardState> {
  AgentDashboardCubit(this.agentDashboardRepo) : super(AgentDashboardInitial());

  final AgentDashboardRepo agentDashboardRepo;
  final FirebaseService firebaseService = FirebaseService();
  Future<void> fetchCustomerList() async {
    var result = await agentDashboardRepo.fetchCustomerList(agentId: "");
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
