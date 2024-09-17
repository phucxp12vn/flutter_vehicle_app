import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/library_model.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';

import 'package:flutter_redux/flutter_redux.dart';

class ScanResultWidget extends StatelessWidget {
  final String? imagePath;
  final String? barcode;

  const ScanResultWidget({
    super.key,
    this.imagePath,
    this.barcode,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LibraryViewModel>(
      converter: (store) => LibraryViewModel.fromStore(store),
      builder: (context, vm) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Scan Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: vm.qrScanResults.isEmpty
                      ? const Center(child: Text('No scan result'))
                      : ListView.builder(
                          itemCount: vm.qrScanResults.length,
                          itemBuilder: (context, index) {
                            final result = vm.qrScanResults[index];
                            return ListTile(
                              leading: Icon(Icons.qr_code,
                                  color: Theme.of(context).primaryColor),
                              title: Text(
                                result.data,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Scanned on ${result.scanDate.toString().split(' ')[0]}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
