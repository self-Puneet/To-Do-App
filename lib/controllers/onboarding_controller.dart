import 'package:todo_app/eums/onboarding_status_type.dart';
import 'package:todo_app/models/onboarding_status.dart';
import 'package:todo_app/services/onboarding_service.dart';
import 'package:todo_app/state/onboarding_provider.dart';

class OnboardingController {
  OnboardingProvider provider;

  OnboardingController({required this.provider});

  Future<void> completeOnboarding() async {
    try {
      provider.setOnboardingStatus(true);
      OnboardingStatus onboardingStatus =
          await OnboardingService.setOnboardingCompleted();
      if (OnboardingStatusType.isOnboardingCompeleted(
        onboardingStatus.isOnboardingCompleted,
      )) {
        provider.setOnboardingStatus(false);
      } else {
        provider.setOnboardingStatus(false);
        provider.setError(
          errorMessage:
              "Can't onboard you due to some internal error. Close app and try again.",
        );
      }
    } catch (e) {
      provider.setOnboardingStatus(false);
      provider.setError(errorMessage: "Something went wrong");
    }
  }
}
