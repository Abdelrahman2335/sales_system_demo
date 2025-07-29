import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/agent_card_top_section.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/agent_leads.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/bottom_section.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_admin_dialog.dart';

class CustomAgentCard extends StatelessWidget {
  const CustomAgentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600, minHeight: 300),
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),

            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      child: AspectRatio(
        aspectRatio: 3 / 2,

        child: Padding(
          padding: const EdgeInsets.only(top: 22, left: 13, right: 33.6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AgentCardTopSection(),
                const SizedBox(height: 10),
                const Divider(
                  color: Color.fromARGB(255, 197, 197, 197),
                  height: 10,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                const SizedBox(height: 9.5),
                const AgentLeads(),

                const Divider(
                  color: Color.fromARGB(255, 197, 197, 197),
                  height: 50,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),

                const SizedBox(height: 9.5),
                AgentCardBottomSection(
                  // onHistoryPressed: () {},
                  onViewDetailsPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAdminDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
