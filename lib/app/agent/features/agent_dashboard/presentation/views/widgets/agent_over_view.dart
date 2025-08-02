import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/custom_lead_card.dart';

class AgentOverView extends StatelessWidget {
  const AgentOverView({super.key});

  @override
  Widget build(BuildContext context) {
    int? hotLeads, warmLeads, coldLeads, totalLeads;
    List<CustomerModel> customers = [];
    return BlocConsumer<AgentDashboardCubit, AgentDashboardState>(
      listener: (context, state) {
        final cubit = context.read<AgentDashboardCubit>();
        final counts = cubit.getLeadCountsByLevel();
        if (state is AgentDashboardSuccess) {
          hotLeads = counts[InterestLevel.hotLead]!;
          warmLeads = counts[InterestLevel.warm]!;
          coldLeads = counts[InterestLevel.notInterested]!;
          totalLeads = cubit.getTotalCustomerCount();
          customers = state.customers;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 180,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<AgentDashboardCubit>()
                            .filterByInterestLevel(allCustomers: customers);
                      },
                      child: CustomLeadCard(
                        title: 'Total Assigned Customers',
                        count: totalLeads ?? 0,
                        color: Colors.green.withAlpha(100),
                      ),
                    ),
                    const SizedBox(width: 77),
                    InkWell(
                      onTap:
                          () => context
                              .read<AgentDashboardCubit>()
                              .filterByInterestLevel(
                                level: InterestLevel.hotLead,
                                allCustomers: customers,
                              ),
                      child: CustomLeadCard(
                        title: 'Hot Leads',
                        count: hotLeads ?? 0,
                        color: Colors.red.withAlpha(100),
                      ),
                    ),
                    const SizedBox(width: 77),
                    InkWell(
                      onTap:
                          () => context
                              .read<AgentDashboardCubit>()
                              .filterByInterestLevel(
                                level: InterestLevel.warm,
                                allCustomers: customers,
                              ),

                      child: CustomLeadCard(
                        title: 'Warm Leads',
                        count: warmLeads ?? 0,
                        color: Colors.orange.withAlpha(90),
                      ),
                    ),
                    const SizedBox(width: 77),
                    InkWell(
                      onTap:
                          () => context
                              .read<AgentDashboardCubit>()
                              .filterByInterestLevel(
                                level: InterestLevel.notInterested,
                                allCustomers: customers,
                              ),

                      child: CustomLeadCard(
                        title: 'Not Interested Leads',
                        count: coldLeads ?? 0,
                        color: Colors.grey.withAlpha(100),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
