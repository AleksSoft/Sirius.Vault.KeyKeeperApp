import 'package:barcode_scan_fix/barcode_scan.dart';

class QrService {
  static Future<String> scan() async {
    final result = await BarcodeScanner.scan();
    return result ?? '';
  }
}
