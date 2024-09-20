import '../../db/database.dart';

class LibraryState {
  final List<CapturedImage> capturedImages;
  final List<QRScanResult> qrScanResults;

  LibraryState({
    List<CapturedImage>? capturedImages,
    List<QRScanResult>? qrScanResults,
  })  : capturedImages = capturedImages ?? [],
        qrScanResults = qrScanResults ?? [];

  static Future<LibraryState> initial() async {
    final database = AppDatabase.instance;
    List<CapturedImage> initialCapturedImages =
        await database.getAllCapturedImages();
    List<QRScanResult> initialQRScanResults =
        await database.getAllQRScanResults();

    return LibraryState(
      capturedImages: initialCapturedImages,
      qrScanResults: initialQRScanResults,
    );
  }

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
