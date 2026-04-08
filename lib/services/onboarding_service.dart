import 'package:todo_app/eums/onboarding_status_type.dart';
import 'package:todo_app/models/onboarding_status.dart';
import 'package:todo_app/repositories/onboarding_repository.dart';

class OnboardingService {
  static Future<OnboardingStatus> getOnboardingStatus() async {
    return await OnboardingRepository.getOnboardingStatus();
  }

  static Future<OnboardingStatus> setOnboardingCompleted() async {
    return await OnboardingRepository.setOnboardingStatusCompleted(
      OnboardingStatus(isOnboardingCompleted: OnboardingStatusType.completed),
    );
  }
}
