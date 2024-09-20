import 'package:flutter_complete_guide/db/database.dart';

// Action to add a captured image to the library
class AddCapturedImageAction {
  final CapturedImage capturedImage;

  AddCapturedImageAction(this.capturedImage);
}

// Action to add a QR scan result to the library
class AddQRScanResultAction {
  final QRScanResult qrScanResult;

  AddQRScanResultAction(this.qrScanResult);
}

// Action to remove a captured image from the library
class RemoveCapturedImageAction {
  final String imagePath;

  RemoveCapturedImageAction(this.imagePath);
}

// Action to remove a QR scan result from the library
class RemoveQRScanResultAction {
  final String qrData;

  RemoveQRScanResultAction(this.qrData);
}

// Action to clear all captured images from the library
class ClearCapturedImagesAction {}

// Action to clear all QR scan results from the library
class ClearQRScanResultsAction {}
