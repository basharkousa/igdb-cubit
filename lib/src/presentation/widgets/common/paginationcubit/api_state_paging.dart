
sealed class ApiStatePaging<T> {
  final T? data;
  const ApiStatePaging(this.data);
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T? data) loadingMore, // Add loadingMore state
    required R Function(String message,T? data) loadMoreError, // Add loadMoreError state
  });
}

final class ApiLoading<T> extends ApiStatePaging<T> {
  const ApiLoading() : super(null);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T? data) loadingMore,
    required R Function(String message,T? data) loadMoreError,
  }) {
    return loading();
  }

  ApiLoading<T?> copyWith() => ApiLoading<T?>();
}

final class ApiCompleted<T> extends ApiStatePaging<T> {


  const ApiCompleted(super.data);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T data) loadingMore,
    required R Function(String message,T data) loadMoreError,
  }) {
    return completed(data);
  }

  ApiCompleted<T> copyWith({T? data}) => ApiCompleted<T>(data ?? this.data);
}

final class ApiError<T> extends ApiStatePaging<T> {
  final String message;

  const ApiError(this.message,):super(null);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T? data) loadingMore,
    required R Function(String message,T? data) loadMoreError,
  }) {
    return error(message);
  }

  ApiError<T> copyWith({String? message}) => ApiError<T>(message ?? this.message);
}

final class ApiLoadingMore<T> extends ApiStatePaging<T> {


  const ApiLoadingMore(super.data);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T? data) loadingMore,
    required R Function(String message,T? data) loadMoreError,
  }) {
    return loadingMore(data);
  }

  ApiLoadingMore<T> copyWith({T? data}) => ApiLoadingMore<T>(data ?? this.data);
}

final class ApiLoadMoreError<T> extends ApiStatePaging<T> {
  final String message;
  const ApiLoadMoreError(this.message,super.data);

  @override
  R when<R>({
    required R Function() loading,
    required R Function(T? data) completed,
    required R Function(String message) error,
    required R Function(T? data) loadingMore,
    required R Function(String message, T? data) loadMoreError,
  }) {
    return loadMoreError(message,data);
  }

  ApiLoadMoreError<T> copyWith({String? message,T? data}) => ApiLoadMoreError<T>(message ?? this.message,this.data);
}