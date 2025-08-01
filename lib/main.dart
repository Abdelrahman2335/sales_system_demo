import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/repository/agent_dashboard_repo_impl.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';
import 'package:sales_system_demo/app/core/utls/app_router.dart';
import 'package:sales_system_demo/app/core/utils/bloc_observer.dart';
import 'package:sales_system_demo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up BLoC observer for debugging
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgentDashboardCubit(AgentDashboardRepoImpl()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Sales System Demo',
        theme: ThemeData().copyWith(textTheme: GoogleFonts.latoTextTheme()),
      ),
    );
  }
}
