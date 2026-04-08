import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/onboarding_controller.dart';
import 'package:todo_app/state/onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Image.asset(
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                "assets/onboarding.png",
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Task Management &\nTo-Do List",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "This productive tool is designed to help you better manage your task project-wise conveniently!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Consumer<OnboardingProvider>(
                      builder: (context, provider, child) {
                        OnboardingController controller = OnboardingController(
                          provider: provider,
                        );
                        return ElevatedButton.icon(
                          onPressed: provider.isLoading
                              ? null
                              : () => controller.completeOnboarding(),
                          label: Text(
                            provider.isLoading ? "Stand By !" : "Let's Start",
                          ),
                          icon: provider.isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                  constraints: BoxConstraints(maxHeight: 10),
                                )
                              : Icon(Icons.arrow_forward),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
