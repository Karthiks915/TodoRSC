abstract class TodoStreamMessage {
  final String action;
  final String stream;
  final Filter filter;

  TodoStreamMessage(this.action, this.stream, this.filter);
}

class Filter {
  final String color;

  Filter({required this.color});
}

class SubscribeMessage extends TodoStreamMessage {
  SubscribeMessage(super.action, super.stream, super.filter);
}

class UnsubscribeMessage extends TodoStreamMessage {
  UnsubscribeMessage(super.action, super.stream, super.filter);
}
