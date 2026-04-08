import 'package:todo_app/costants.dart';
import 'package:todo_app/eums/onboarding_status_type.dart';
import 'package:todo_app/mapper/onboarding_mapper.dart';
import 'package:todo_app/models/onboarding_status.dart';
import 'package:todo_app/storage_util.dart';

class OnboardingRepository {
  static Future<OnboardingStatus> getOnboardingStatus() async {
    final onboardingObject = await StorageUtil.getData(onboarding);
    if (onboardingObject == null) {
      return OnboardingStatus(
        isOnboardingCompleted: OnboardingStatusType.pending,
      );
    }

    return OnboardingMapper.toOnboardingStatus(
      onboardingObject: onboardingObject,
    );
  }

  static Future<OnboardingStatus> setOnboardingStatusCompleted(
    OnboardingStatus onboardingStatus,
  ) async {
    await StorageUtil.saveData(
      OnboardingMapper.toOnboardingMap(onboardingStatus: onboardingStatus),
      onboarding,
    );
    return await getOnboardingStatus();
  }
}
