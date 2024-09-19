import '../../db/database_v2.dart';

class LibraryState {
  final List<CapturedImages> capturedImages;
  final List<QRScanResults> qrScanResults;

  LibraryState({
    List<CapturedImages>? capturedImages,
    List<QRScanResults>? qrScanResults,
  })  : capturedImages = capturedImages ?? [],
        qrScanResults = qrScanResults ?? [];

  static Future<LibraryState> initial() async {
    final database = AppDatabase.instance;
    List<CapturedImages> initialCapturedImages =
        await database.getAllCapturedImages();
    List<QRScanResults> initialQRScanResults =
        await database.getAllQRScanResults();

    return LibraryState(
      capturedImages: initialCapturedImages,
      qrScanResults: initialQRScanResults,
    );
  }

  LibraryState copyWith({
    List<CapturedImages>? capturedImages,
    List<QRScanResults>? qrScanResults,
  }) {
    return LibraryState(
      capturedImages: capturedImages ?? this.capturedImages,
      qrScanResults: qrScanResults ?? this.qrScanResults,
    );
  }
}
