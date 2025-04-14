extension DistinctByExtension<T> on Iterable<T> {
  Iterable<T> distinctBy<K>(K Function(T) keySelector) {
    final seenKeys = <K>{};
    return where((element) => seenKeys.add(keySelector(element)));
  }
}