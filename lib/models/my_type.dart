class MyType {
  final String name;
  final String data;

  MyType({
    required this.name,
    required this.data
  });

  @override
  String toString() {
    return 'MyType{name: $name, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          data == other.data;

  @override
  int get hashCode => name.hashCode ^ data.hashCode;
}