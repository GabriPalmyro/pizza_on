enum ScreenStatus {
  loading,
  error,
  success,
}

class ScreenResult<T> {
  const ScreenResult({
    this.status = ScreenStatus.loading,
    this.result,
  });

  final ScreenStatus status;
  final T? result;

  ScreenResult<T> copyWith({
    ScreenStatus? newStatus,
    T? newResult,
  }) {
    return ScreenResult<T>(
      status: newStatus ?? status,
      result: newResult ?? result,
    );
  }
}
