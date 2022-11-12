## Features

A simple subscription system. 

Allows a Subscriber object to subscribe to a Subscribee object over one or multiple types.
The Subscriber gets notified when the Subscribee notifies over the subscribed type.

Both Subscriber and Subscribee are mixins.

## Getting started

Add the following to your file:

```dart
import 'package:subscription/subscription.dart';
```

Then, add either the Subscribee or the Subscription class to the desired classes.

## Usage

Two methods are available to subscribe to a Subscribee:
```dart
// In a class that is mixin with Subscriber:

subscribee.addSubscriber<type>(this); 
subscribe<type>(subscribee);

// Each method has an equivalent to unsubscribe:
subscribee.removeSubscriber<type>(this);
unsubscribe<type>(subscribee);
```

Both methods are equivalents, use them with your own preference.

Having to pass the Subscriber in the method allow an object to pass a variable as Subscribee instead of using this.

To notify subscribers, use the following method in the Subscribee class:
```dart
notify<type>(value); // The value and the given type must be of the same type
```
This will notify every subscriber over the given type. This notification will be received in the following method in the Subscriber class:
```dart 
@override
onNotification(type notification){
    // Todo: content
}
``` 

See ```/example/main.dart``` for a working example.

## Additional information

This system is particularly useful when you want to listen to the same stream at different places in your code.
You can create a single class that listen to the stream and notifies Subscriber when the stream has a new value.

Additionally, the Subscribee class works well with a singleton as you won't need to pass the Subscribee object in the code.
The Subscribee class is not a Singleton by default as I want to allow users to have multiple instances of the same classes that does not share the same subscribers.

You can fork and contribute to the package from the [github page](https://github.com/Feynallein/Subscription).