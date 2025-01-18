sealed class StateResult<T> {
  final T? data;
  final String? message;

  StateResult({this.data, this.message});

  // @override
  // int get hashCode => data.hashCode ^ message.hashCode;
  //
  // @override
  // bool operator ==(Object other) =>
  //     other is StateResult<T> &&
  //         other.data == data &&
  //         other.message == message;
}

class SuccessState<T> extends StateResult<T> {
   SuccessState(T? data) : super(data: data);

  @override
  String toString() => 'Success: {data: $data}';
}

class ErrorState<T> extends StateResult<T> {
   ErrorState(String? message, {T? data}) : super(data: data, message: message);

  @override
  String toString() => 'Error: {message: $message, data: $data}';
}

class LoadingState<T> extends StateResult<T> {
   LoadingState() : super();

  @override
  String toString() => 'Loading...';
}