import 'package:flutter/material.dart';
import 'dart:io';

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
              child: imagePath != null
                  ? Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No scan result')),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
