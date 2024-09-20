import 'package:drift/drift.dart';
import 'package:redux/redux.dart';
import '../store/actions/library.dart';
import '../store/state/app_state.dart';
import '../db/database.dart';

class LibraryViewModel {
  final List<CapturedImage> capturedImages;
  final List<QRScanResult> qrScanResults;
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
      capturedImages: store.state.libraryState.capturedImages.toList(),
      qrScanResults: store.state.libraryState.qrScanResults.toList(),
      onAddCapturedImage: (Uint8List imageData) async {
        final capturedImage = CapturedImagesCompanion(
          imageData: Value(imageData),
          captureDate: Value(DateTime.now()),
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
        final qrScanResult = QRScanResultsCompanion(
          data: Value(data),
          scanDate: Value(DateTime.now()),
        );
        final id = await AppDatabase.instance.insertQRScanResult(qrScanResult);
        final newResult = QRScanResult(
          id: id,
          data: data,
          scanDate: DateTime.now(),
        );
        store.dispatch(AddQRScanResultAction(newResult));
      },
    );
  }
}
