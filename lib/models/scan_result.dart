enum ResultType { barcode }

class ScanResult {
  ResultType type;
  String rawContent;

  ScanResult(this.type, this.rawContent);
}
