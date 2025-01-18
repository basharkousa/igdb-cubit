class ApiState<T> {
  Status status;

  T? data;

  String? message;

  ApiState.loading() : status = Status.LOADING;

  ApiState.completed(this.data) : status = Status.COMPLETED;

  ApiState.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
