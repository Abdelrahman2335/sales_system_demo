import 'package:go_router/go_router.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/pages/admin_dashboard.dart';
import 'package:sales_system_demo/app/admin/features/search/presentation/view/search_view.dart';

abstract class AppRouter {
  static const kSearchView = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => AdminDashBoardView()),
      GoRoute(path: "/kSearchView",builder: (context, state) => SearchView(),)
    ],
  );
}
