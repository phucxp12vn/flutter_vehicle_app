import 'package:flutter/material.dart';
import 'dart:io';

class LibraryWidget extends StatefulWidget {
  const LibraryWidget({super.key});

  @override
  State<LibraryWidget> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryWidget> {
  String? latestImagePath;

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
              'Latest Capture',
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
              child: latestImagePath != null
                  ? Image.file(
                      File(latestImagePath!),
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No image captured yet')),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
