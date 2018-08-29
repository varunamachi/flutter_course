import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final streamCtl = new StreamController<Order>();
  final order = new Order('chocolate');
  final baker = new StreamTransformer.fromHandlers(
    handleData: (String type, EventSink<Cake> sink) {
      if (type == "chocolate") {
        sink.add(new Cake());
      } else {
        sink.addError("Invalid cake type: $type");
      }
    },
  );
  var sub = streamCtl.stream
    .map((order) => order.type)
    .transform(baker)
    .listen(
      (cake) => print("Cake's done!"),
      onError: (err) => print(err),
    );
  streamCtl.sink.add(order);
  streamCtl.sink.add(new Order("Banana"));
}
