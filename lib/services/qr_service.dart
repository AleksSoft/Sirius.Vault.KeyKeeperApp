import 'package:KeyKeeperApp/app/utils/utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrService {
  static Future<String> scan() async {
    final result = await FlutterBarcodeScanner.scanBarcode(
      AppColors.red.value.toRadixString(16),
      'Cancel',
      true,
      ScanMode.QR,
    );
    return result ?? '';
  }
}
