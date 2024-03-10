class MyNumberType {
  final String number;
  final dynamic data;

  MyNumberType({
    required this.number,
    required this.data
  });

  @override
  String toString() {
    return 'MyNumberType{number: $number, data: $data}';
  }
}