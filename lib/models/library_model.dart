import 'package:redux/redux.dart';
import '../store/actions/library.dart';
import '../store/state/app_state.dart';
import '../db/database_v2.dart';
import 'dart:typed_data';

class LibraryViewModel {
  final List<CapturedImages> capturedImages;
  final List<QRScanResults> qrScanResults;
  final Function(Uint8List) onAddCapturedImage;
  final Function(String) onAddQRScanResult;

  LibraryViewModel({
    required this.capturedImages,
    required this.qrScanResults,
    required this.onAddCapturedImage,
    required this.onAddQRScanResult,
  });

  static LibraryViewModel fromStore(Store<AppState> store) {
    return LibraryViewModel(
      capturedImages: store.state.libraryState.capturedImages
          .map((image) => CapturedImages(
              id: image.id,
              imageData: image.imageData,
              captureDate: image.captureDate))
          .toList(),
      qrScanResults: store.state.libraryState.qrScanResults
          .map((result) => QRScanResults(
              id: result.id, data: result.data, scanDate: result.scanDate))
          .toList(),
      onAddCapturedImage: (Uint8List imageData) async {
        final capturedImage = CapturedImages(
          imageData: imageData,
          captureDate: DateTime.now(),
        );
        final id =
            await AppDatabase.instance.insertCapturedImage(capturedImage);
        final newImage = CapturedImages(
          id: id,
          imageData: imageData,
          captureDate: DateTime.now(),
        );
        store.dispatch(AddCapturedImageAction(newImage));
      },
      onAddQRScanResult: (String data) async {
        final qrScanResult = QRScanResults(
          data: data,
          scanDate: DateTime.now(),
        );
        final id = await AppDatabase.instance.insertQRScanResult(qrScanResult);
        final newResult = QRScanResults(
          id: id,
          data: data,
          scanDate: DateTime.now(),
        );
        store.dispatch(AddQRScanResultAction(newResult));
      },
    );
  }
}
