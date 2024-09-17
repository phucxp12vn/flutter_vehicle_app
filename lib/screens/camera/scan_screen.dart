import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/library_model.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';
import '../dashboard/dashboard_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  MobileScannerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleDetectedBarcode(
      BuildContext context, LibraryViewModel vm, Barcode? barcode) {
    if (barcode?.displayValue != null) {
      _controller?.stop();
      vm.onAddQRScanResult(barcode!.displayValue!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${barcode.displayValue} saved to library'),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR/Barcode Scanner')),
      backgroundColor: Colors.black,
      body: StoreConnector<AppState, LibraryViewModel>(
        converter: (store) => LibraryViewModel.fromStore(store),
        builder: (context, vm) {
          return Stack(
            children: [
              MobileScanner(
                controller: _controller,
                onDetect: (BarcodeCapture barcodes) {
                  _handleDetectedBarcode(
                      context, vm, barcodes.barcodes.firstOrNull);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
