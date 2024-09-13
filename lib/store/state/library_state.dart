import 'package:flutter_complete_guide/models/library_model.dart';

class LibraryState {
  final List<CapturedImage> capturedImages;
  final List<QRScanResult> qrScanResults;

  LibraryState({
    List<CapturedImage>? capturedImages,
    List<QRScanResult>? qrScanResults,
  })  : capturedImages = capturedImages ?? [],
        qrScanResults = qrScanResults ?? [];

  factory LibraryState.initial() => LibraryState();

  LibraryState copyWith({
    List<CapturedImage>? capturedImages,
    List<QRScanResult>? qrScanResults,
  }) {
    return LibraryState(
      capturedImages: capturedImages ?? this.capturedImages,
      qrScanResults: qrScanResults ?? this.qrScanResults,
    );
  }
}
