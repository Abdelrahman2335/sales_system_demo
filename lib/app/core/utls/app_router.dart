import 'package:go_router/go_router.dart';
import 'package:sales_system_demo/app/admin/presentation/views/admin_overview.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: "/",builder: (context, state)=> AdminOverview()) ,
  ]);
}