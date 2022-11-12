import 'package:singleton/singleton.dart';

import '../subscription.dart';

mixin Subscribee on Singleton {
  final Map<dynamic, List<Subscriber>> subscriptions = <dynamic, List<Subscriber>>{};

  void notify<T>(T notification){
    subscriptions.forEach((subscription, subscribers) {
      if(subscription == T){
        subscribers.forEach((subscriber) => subscriber.notify(notification));
      }
    });
  }

  void addSubscriber<T>(Subscriber subscriber) => subscriptions.update(T, (subscribers) => subscribers..add(subscriber), ifAbsent: () => [subscriber]);
  void removeSubscriber<T>(Subscriber subscriber) => subscriptions[T]?.remove(subscriber);
}