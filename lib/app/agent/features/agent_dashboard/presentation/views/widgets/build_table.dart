import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/customer_dialog.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

class BuildTable extends StatelessWidget {
  const BuildTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomerModel> customers = [];

    const leadTableColumns = [
      "Name",
      "Phone",
      "City",
      "Region",
      "Interested Products",
      "Interest Level",
      "Interaction Date",
      "Contact Platform",
    ];
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1400 ? 280.0 : 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Header",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        BlocConsumer<AgentDashboardCubit, AgentDashboardState>(
          listener: (context, state) {
            if (state is AgentDashboardSuccess) {
              customers = state.customers;
              DebugLogger.log(
                "state is AgentDashboardSuccess: ${customers.first.fullName}",
              );
            } else if (state is AgentDashboardFiltered) {
              customers = state.customers;
              DebugLogger.log(
                "state is AgentDashboardFiltered: ${customers.first.fullName}",
              );
            }
          },
          builder: (context, state) {
            if (state is AgentDashboardSuccess) {
              customers = state.customers;
            } else if (state is AgentDashboardFiltered) {
              customers = state.customers;
            }
            if (customers.isNotEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: List.generate(leadTableColumns.length, (
                    columnIndex,
                  ) {
                    return DataColumn(
                      label: Text(leadTableColumns[columnIndex]),
                    );
                  }),
                  rows: List.generate(customers.length, (index) {
                    final customer = customers[index];

                    return DataRow(
                      onSelectChanged: (value) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomerDialog(customer: customer);
                          },
                        );
                      },

                      cells: [
                        DataCell(Text(customer.fullName)),
                        DataCell(Text(customer.phoneNumber.toString())),
                        DataCell(Text(customer.city)),
                        DataCell(Text(customer.region)),
                        DataCell(
                          Text(
                            customer.interestedProducts.join(', '),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(Text(customer.interestLevel.label)),
                        DataCell(Text(customer.interactionDateTime.toString())),
                        DataCell(Text(customer.contactPlatform)),
                      ],
                    );
                  }),
                ),
              );
            } else if (state is AgentDashboardFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
