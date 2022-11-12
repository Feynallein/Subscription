import 'my_stream.dart';
import 'my_stream_listener.dart';

void main(){
  MyStream myStream = MyStream();
  MyStreamListener(myStream);
  myStream.testNotification();
}