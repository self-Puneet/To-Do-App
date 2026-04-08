import 'package:todo_app/eums/onboarding_status_type.dart';
import 'package:todo_app/models/onboarding_status.dart';

class OnboardingMapper {
  static OnboardingStatus toOnboardingStatus({
    required Map<String, dynamic> onboardingObject,
  }) {
    return OnboardingStatus(
      isOnboardingCompleted: OnboardingStatusType.toStatusType(
        onboardingObject["isOnboardingCompleted"] as String,
      ),
    );
  }

  static Map<String, dynamic> toOnboardingMap({
    required OnboardingStatus onboardingStatus,
  }) {
    return {
      "isOnboardingCompleted": onboardingStatus.isOnboardingCompleted.name,
    };
  }
}
