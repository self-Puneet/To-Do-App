import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/costants.dart';
import 'package:todo_app/eums/onboarding_status_type.dart';
import 'package:todo_app/models/onboarding_status.dart';
import 'package:todo_app/services/onboarding_service.dart';
import 'package:todo_app/storage_util.dart';
import 'package:todo_app/state/onboarding_provider.dart';
import 'package:todo_app/theme.dart';
import 'package:todo_app/ui/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();
  OnboardingStatus onboardingStatus =
      await OnboardingService.getOnboardingStatus();
  bool isOnboarded = OnboardingStatusType.isOnboardingCompeleted(
    onboardingStatus.isOnboardingCompleted,
  );

  runApp(
    MaterialApp(
      initialRoute: isOnboarded
          ? AppRouteName.home
          : AppRouteName.onboardingRoute,
      routes: {
        AppRouteName.onboardingRoute: (context) => ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
          child: OnboardingScreen(),
        ),
        AppRouteName.home: (context) => ToDoApp(),
      },
      theme: lightTheme,
      darkTheme: lightTheme,
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Placeholder(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
      ),
    );
  }
}
