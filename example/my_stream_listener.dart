import 'package:subscription/subscription.dart';

import 'my_stream.dart';

class MyStreamListener with Subscriber {
  MyStream myStream;

  MyStreamListener(this.myStream){
    subscribe<int>(myStream); // Subscription to the MyStream class on the int type
    myStream.addSubscriber<String>(this); // Adding this as a subscriber to MyStream over the String type

    // Both methods works
    // You can also call unsubscribe or removeSubscriber to cancel a subscription
  }

  @override
  void notify<T>(T notification){
    switch(T) {
      case int:
        print("Notification of type int. Value: $notification");
        break;
      case String:
        print("Notification of type string. Value: $notification");
        break;
    }
  }
}