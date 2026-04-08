import 'package:flutter/foundation.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool errorRaised = false;
  String error = "";
  bool get isLoading => _isLoading;

  void setOnboardingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void setError({required String errorMessage}) {
    errorRaised = true;
    error = errorMessage;
    notifyListeners();
  }

  void removeError() {
    error = "";
    errorRaised = false;
    notifyListeners();
  }
}
