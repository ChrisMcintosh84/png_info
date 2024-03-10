class MyInputType {
  final String name;
  final dynamic data;

  MyInputType({
    required this.name,
    required this.data
  });

  @override
  String toString() {
    return 'MyInputType{name: $name, data: $data}';
  }
}