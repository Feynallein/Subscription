## Features

A simple subscription system. 
Allows a subscriber object to subscribe to a subscribee object over one or multiple types.
The subscriber gets notified when the subscribee notifies over the subscribed type.
Both Subscriber and Subscribee are mixins.

## Getting started

Add the following to your file:

```dart
import 'package:subscription/subscription.dart';
```

Then, add either the Subscribee or the Subscription class to the desired classes.

## Usage

Two methods are available to subscribe to an object:
```dart
// In a class that is mixin with Subscriber
subscribee.addSubscriber<type>(this); 
subscribe<type>(subscribee);

// Each method as an equivalent to unsubscribe:
subscribee.removeSubscriber<type>(this);
unsubscribe<type>(subscribee);
```

Both methods are equivalents, use them with your own preference.

To notify in the Subscribee class, use the following method:
```dart
@override
notify<type>(type value);
```
This will notify every subscriber over the selected type.

The notification is then received in the```dart onNotification(type notification)``` method in the Subscriber class.

See ```/example/main.dart``` for a working example.

## Additional information

This system is particularly useful when you want to listen to the same stream at different places in your code.
You can create a single class that listen to the stream and notifies Subscriber when the stream has a new value.
Additionally, the Subscribee class works well with a singleton as you won't need to pass the Subscribee object in the code.
The Subscribee class is not a Singleton by default as I want to allow users to have multiple instances of the same classes that does not share the same subscribers.

You can fork and contribute to the package from the [github page](https://github.com/Feynallein/Subscription).