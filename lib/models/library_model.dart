import 'package:redux/redux.dart';
import '../store/actions/library.dart';
import '../store/state/app_state.dart';
import '../db/database.dart';
import 'dart:typed_data';

class LibraryViewModel {
  final List<CapturedImage> capturedImages;
  final List<QRScanResult> qrScanResults;
  final Function(Uint8List) onAddCapturedImage;
  final Function(String) onAddQRScanResult;
  final Function onClearCapturedImages;
  final Function onClearQRScanResults;

  LibraryViewModel({
    required this.capturedImages,
    required this.qrScanResults,
    required this.onAddCapturedImage,
    required this.onAddQRScanResult,
    required this.onClearCapturedImages,
    required this.onClearQRScanResults,
  });

  static LibraryViewModel fromStore(Store<AppState> store) {
    return LibraryViewModel(
      capturedImages: store.state.libraryState.capturedImages
          .map((image) => CapturedImage(
              id: image.id,
              imageData: image.imageData,
              captureDate: image.captureDate))
          .toList(),
      qrScanResults: store.state.libraryState.qrScanResults
          .map((result) => QRScanResult(
              id: result.id, data: result.data, scanDate: result.scanDate))
          .toList(),
      onAddCapturedImage: (Uint8List imageData) async {
        final capturedImage = CapturedImagesCompanion.insert(
          imageData: imageData,
          captureDate: DateTime.now(),
        );
        final id =
            await AppDatabase.instance.insertCapturedImage(capturedImage);
        final newImage = CapturedImage(
          id: id,
          imageData: imageData,
          captureDate: DateTime.now(),
        );
        store.dispatch(AddCapturedImageAction(newImage));
      },
      onAddQRScanResult: (String data) async {
        final qrScanResult = QRScanResultsCompanion.insert(
          data: data,
          scanDate: DateTime.now(),
        );
        final id = await AppDatabase.instance.insertQRScanResult(qrScanResult);
        final newResult = QRScanResult(
          id: id,
          data: data,
          scanDate: DateTime.now(),
        );
        store.dispatch(AddQRScanResultAction(newResult));
      },
      onClearCapturedImages: () async {
        await AppDatabase.instance.clearAllCapturedImages();
        store.dispatch(ClearCapturedImagesAction());
      },
      onClearQRScanResults: () async {
        await AppDatabase.instance.clearAllQRScanResults();
        store.dispatch(ClearQRScanResultsAction());
      },
    );
  }
}
