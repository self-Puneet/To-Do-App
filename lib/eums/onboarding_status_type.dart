enum OnboardingStatusType {
  completed,
  pending;

  static OnboardingStatusType toStatusType (String statusType) {
    switch (statusType.toLowerCase()) {
      case "completed":
        return OnboardingStatusType.completed;
      default:
        return OnboardingStatusType.pending;
    }
  }

  static bool isOnboardingCompeleted (OnboardingStatusType statusType) {
    switch (statusType) {
      case OnboardingStatusType.completed:
        return true;
      default:
        return false;
    }
  }
}



