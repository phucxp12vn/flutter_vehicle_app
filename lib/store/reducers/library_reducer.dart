import '../state/library_state.dart';
import '../actions/library.dart';

LibraryState libraryReducer(LibraryState state, dynamic action) {
  if (action is AddCapturedImageAction) {
    return state.copyWith(
      capturedImages: [...state.capturedImages, action.capturedImage],
    );
  } else if (action is AddQRScanResultAction) {
    return state.copyWith(
      qrScanResults: [...state.qrScanResults, action.qrScanResult],
    );
  } else if (action is RemoveCapturedImageAction) {
    return state.copyWith(
      capturedImages: state.capturedImages
          .where((image) => image.path != action.imagePath)
          .toList(),
    );
  } else if (action is RemoveQRScanResultAction) {
    return state.copyWith(
      qrScanResults: state.qrScanResults
          .where((result) => result.data != action.qrData)
          .toList(),
    );
  } else if (action is ClearCapturedImagesAction) {
    return state.copyWith(capturedImages: []);
  } else if (action is ClearQRScanResultsAction) {
    return state.copyWith(qrScanResults: []);
  }
  return state;
}
