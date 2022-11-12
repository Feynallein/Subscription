import 'package:subscription/src/subscribee.dart';

class MyStream with Subscribee {
  void testNotification() async {
    notify<String>("First notification");
    print("Wait for 1 second");
    await Future.delayed(const Duration(seconds: 1));
    notify<int>(2);
    print("Wait for 2 seconds");
    await Future.delayed(const Duration(seconds: 2));
    notify<String>("Final notification");
  }
}