import 'package:shared_preferences/shared_preferences.dart';



class checkOnboarding{
Future<void> checkOnboardingStatus() async {
  bool isOnboardingCompleted = await getIsOnboardingCompleted();
  if (isOnboardingCompleted) {
  }
}
}


Future<bool> getIsOnboardingCompleted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isOnboardingCompleted') ?? false;
}

void saveOnboardingCompleted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isOnboardingCompleted', true);
}