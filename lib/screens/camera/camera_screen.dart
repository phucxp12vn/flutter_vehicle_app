import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';
import 'package:http/http.dart' as http;

import '../../models/library_model.dart';
import '../dashboard/dashboard_screen.dart';
import 'package:flutter/foundation.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  Future<void>? _initializeControllerFuture;
  XFile? _capturedImage;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![_selectedCameraIndex],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void _switchCamera() {
    setState(() {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
      _controller = CameraController(
        _cameras![_selectedCameraIndex],
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller!.initialize();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0, right: 16.0, bottom: 110.0),
            child: _capturedImage == null
                ? FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          width: size.width,
                          height: size.height,
                          child: CameraPreview(_controller!),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                : Stack(
                    children: [
                      Positioned.fill(
                        child: kIsWeb
                            ? Image.network(_capturedImage!.path,
                                fit: BoxFit.cover)
                            : Image.file(
                                File(_capturedImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Container(),
                      ),
                    ],
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_capturedImage == null) ...[
                    IconButton(
                      onPressed: _switchCamera,
                      icon: const Icon(Icons.switch_camera_outlined),
                      iconSize: 24,
                    ),
                    const SizedBox(width: 40),
                    FloatingActionButton(
                      onPressed: () async {
                        try {
                          await _initializeControllerFuture;
                          final image = await _controller!.takePicture();
                          setState(() {
                            _capturedImage = image;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                    const SizedBox(width: 88),
                  ] else ...[
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          _capturedImage = null;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    StoreConnector<AppState, LibraryViewModel>(
                      converter: (store) => LibraryViewModel.fromStore(store),
                      builder: (context, vm) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(40 * 0.4, 40),
                          ),
                          onPressed: () async {
                            final Uint8List imageBytes;
                            if (kIsWeb) {
                              http.Response response = await http.get(
                                Uri.parse(_capturedImage!.path),
                              );

                              if (response.statusCode == 200) {
                                imageBytes = response.bodyBytes;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Image can\'t be saved.')),
                                );
                                return;
                              }
                            } else {
                              final File imageFile = File(_capturedImage!.path);
                              imageBytes = await imageFile.readAsBytes();
                            }

                            vm.onAddCapturedImage(imageBytes);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Image saved to library')),
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardScreen()),
                            );
                          },
                          child: const Text('Save'),
                        );
                      },
                    ),
                    const SizedBox(width: 60),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
