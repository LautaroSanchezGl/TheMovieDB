abstract class DataState<T> {
  final T? data;
  final String? errorMsg;

  const DataState({
    this.data,
    this.errorMsg,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSuccess && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String error) : super(errorMsg: error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataFailed && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
