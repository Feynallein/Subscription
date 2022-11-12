import '../subscription.dart';

/// Subscribee class.
/// An object mixin this class will be able to be subscribed to and notify subscribers of a specific [type].
/// Only subscribers of the notified type will receive the notification.
mixin Subscribee {
  final Map<dynamic, List<Subscriber>> subscriptions = <dynamic, List<Subscriber>>{};

  void notify<T>(T notification){
    subscriptions.forEach((subscription, subscribers) {
      if(subscription == T){
        for (var subscriber in subscribers) {
          subscriber.notify(notification);
        }
      }
    });
  }

  void addSubscriber<T>(Subscriber subscriber) => subscriptions.update(T, (subscribers) => subscribers..add(subscriber), ifAbsent: () => [subscriber]);
  void removeSubscriber<T>(Subscriber subscriber) => subscriptions[T]?.remove(subscriber);
}