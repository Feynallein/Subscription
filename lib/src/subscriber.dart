import '../subscription.dart';

mixin Subscriber {
  void notify<T>(T notification);
  void subscribe<T>(Subscribee subscribee) => subscribee.subscriptions.update(T, (subscribers) => subscribers..add(this), ifAbsent: () => [this]);
  void unsubscribe<T>(Subscribee subscribee) => subscribee.subscriptions[T]?.remove(this);
}
