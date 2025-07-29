import 'package:go_router/go_router.dart';
import 'package:sales_system_demo/app/admin/features/search/presentation/view/search_view.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/pages/agent_dashboard.dart';

abstract class AppRouter {
  static const kSearchView = "/SearchView";
  static const kAgentDashBoardView = "/AgentDashBoardView";
  static const kAdminDashBoardView = "/AdminDashBoardView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => AgentDashboard()),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
