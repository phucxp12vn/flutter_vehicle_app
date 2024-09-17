import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';
import 'package:flutter_complete_guide/models/library_model.dart';

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({super.key});

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
                  'Captured Images',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: vm.capturedImages.isEmpty
                      ? const Center(child: Text('No images captured yet'))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.capturedImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.memory(
                                    vm.capturedImages[index].imageData,
                                    fit: BoxFit.cover,
                                  ),
                                ));
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
