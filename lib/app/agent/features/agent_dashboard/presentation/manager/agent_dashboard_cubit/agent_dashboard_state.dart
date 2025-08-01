part of 'agent_dashboard_cubit.dart';

sealed class AgentDashboardState extends Equatable {
  const AgentDashboardState();

  @override
  List<Object> get props => [];
}

final class AgentDashboardInitial extends AgentDashboardState {}

final class AgentDashboardLoading extends AgentDashboardState {}

final class AgentDashboardSuccess extends AgentDashboardState {
  const AgentDashboardSuccess(this.customers);
  final List<CustomerModel> customers;
}

final class AgentDashboardFailure extends AgentDashboardState {
  const AgentDashboardFailure(this.errMessage);
  final String errMessage;
}
