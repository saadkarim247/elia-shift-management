/// Result class will be used to hold result of network call which can be
/// success (with data) or failure (with error information)
class Result<T> extends SealedResult<T> {}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class Cached<T> extends Result<T> {
  T data;

  Cached(this.data);
}

class Error<T> extends Result<T> {
  String error;
  int? code;
  Error(this.error, this.code);
}

abstract class SealedResult<T> {
  R when<R>({
    required R Function(T) onSuccess,
    required R Function(String, int?) onError,
    R Function(T)? onCached,
  }) {
    if (this is Success<T>) {
      return onSuccess.call((this as Success<T>).data);
    }
    if (this is Cached<T>) {
      if (onCached == null) {
        throw Exception('no callback exception');
      }
      return onCached.call((this as Cached<T>).data);
    }
    if (this is Error<T>) {
      return onError.call((this as Error<T>).error, (this as Error<T>).code);
    }
    throw Exception(
      'regenerate classes exception',
    );
  }
}
