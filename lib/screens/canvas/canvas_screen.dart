import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';
import 'package:flutter_complete_guide/models/library_model.dart';
import 'package:camera/camera.dart';
import '../dashboard/dashboard_screen.dart';

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({super.key});

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw Signature'),
        backgroundColor: const Color.fromARGB(255, 211, 174, 118),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Signature(
              controller: _controller,
              width: double.infinity,
              height: double.infinity,
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.undo),
                  onPressed: () {
                    setState(() => _controller.undo());
                  },
                ),
                StoreConnector<AppState, LibraryViewModel>(
                  converter: (store) => LibraryViewModel.fromStore(store),
                  builder: (context, vm) {
                    return IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () =>
                          _saveSignature(context, vm.onAddCapturedImage),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSignature(
      BuildContext context, void Function(Uint8List) onAddCapturedImage) async {
    if (_controller.isNotEmpty) {
      final Uint8List? data = await _controller.toPngBytes();

      if (data != null) {
        onAddCapturedImage(data);
        if (mounted) {
          ScaffoldMessenger.of(this.context).showSnackBar(
            const SnackBar(content: Text('Signature saved')),
          );
          Navigator.of(this.context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
