import 'package:redux/redux.dart';
import '../store/actions/library.dart';
import '../store/state/app_state.dart';

class LibraryViewModel {
  final List<CapturedImage> capturedImages;
  final List<QRScanResult> qrScanResults;
  final Function(String) onAddCapturedImage;
  final Function(String) onAddQRScanResult;
  final Function(String) onRemoveCapturedImage;
  final Function(String) onRemoveQRScanResult;
  final Function onClearCapturedImages;
  final Function onClearQRScanResults;

  LibraryViewModel({
    required this.capturedImages,
    required this.qrScanResults,
    required this.onAddCapturedImage,
    required this.onAddQRScanResult,
    required this.onRemoveCapturedImage,
    required this.onRemoveQRScanResult,
    required this.onClearCapturedImages,
    required this.onClearQRScanResults,
  });

  static LibraryViewModel fromStore(Store<AppState> store) {
    return LibraryViewModel(
      capturedImages: store.state.libraryState.capturedImages,
      qrScanResults: store.state.libraryState.qrScanResults,
      onAddCapturedImage: (String path) {
        final capturedImage =
            CapturedImage(path: path, captureDate: DateTime.now());
        store.dispatch(AddCapturedImageAction(capturedImage));
      },
      onAddQRScanResult: (String data) {
        final qrScanResult = QRScanResult(data: data, scanDate: DateTime.now());
        store.dispatch(AddQRScanResultAction(qrScanResult));
      },
      onRemoveCapturedImage: (String path) {
        store.dispatch(RemoveCapturedImageAction(path));
      },
      onRemoveQRScanResult: (String data) {
        store.dispatch(RemoveQRScanResultAction(data));
      },
      onClearCapturedImages: () {
        store.dispatch(ClearCapturedImagesAction());
      },
      onClearQRScanResults: () {
        store.dispatch(ClearQRScanResultsAction());
      },
    );
  }
}

class CapturedImage {
  final String path;
  final DateTime captureDate;

  CapturedImage({
    required this.path,
    required this.captureDate,
  });
}

class QRScanResult {
  final String data;
  final DateTime scanDate;

  QRScanResult({
    required this.data,
    required this.scanDate,
  });
}
