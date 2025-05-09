import 'cash_helper.dart';

class AuthHelper {
  static bool isUserLoggedIn() {
    final user = CashHelper.getCachedUser();
    return user != null;
  }
}