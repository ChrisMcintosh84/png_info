class MyNode {
  dynamic inputData;
  dynamic classTypeData;

  MyNode({
    this.inputData,
    this.classTypeData
  });

  @override
  String toString() {
    return 'MyNode{inputData: $inputData, classTypeData: $classTypeData}';
  }
}