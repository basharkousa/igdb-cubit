sealed class ApiState<T> {
  const ApiState();

  R when<R>({
    required R Function() loading,
    required R Function(T data) completed,
    required R Function(String message) error,
  });
}

final class ApiLoading<T> extends ApiState<T> {
  const ApiLoading();

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T data) completed,
    required R Function(String message) error,
  }) {
    return loading();
  }

  ApiLoading copyWith() => const ApiLoading(); // copyWith for ApiLoading
}

final class ApiCompleted<T> extends ApiState<T> {
  final T data;

  const ApiCompleted(this.data);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T data) completed,
    required R Function(String message) error,
  }) {
    return completed(data);
  }

  ApiCompleted<T> copyWith({T? data}) =>
      ApiCompleted<T>(data ?? this.data); // copyWith for ApiCompleted
}

final class ApiError<T> extends ApiState<T> {
  final String message;

  const ApiError(this.message);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T data) completed,
    required R Function(String message) error,
  }) {
    return error(message);
  }

  ApiError<T> copyWith({String? message}) =>
      ApiError<T>(message ?? this.message); // copyWith for ApiError
}
