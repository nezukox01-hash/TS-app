class AppStorage {
  final Map<String, dynamic> _memory = {};

  T? read<T>(String key) => _memory[key] as T?;

  void write<T>(String key, T value) {
    _memory[key] = value;
  }
}
