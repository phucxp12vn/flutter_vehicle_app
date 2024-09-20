import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:idb_sqflite/idb_sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'dart:typed_data';

class LoginStates {
  bool isLoggedIn;
  LoginStates({required this.isLoggedIn});
}

class CountStates {
  int? id;
  String itemId;
  int clickCount;
  CountStates({this.id, required this.itemId, required this.clickCount});
}

class CapturedImages {
  int? id;
  Uint8List imageData;
  DateTime captureDate;
  CapturedImages({this.id, required this.imageData, required this.captureDate});
}

class QRScanResults {
  int? id;
  String data;
  DateTime scanDate;
  QRScanResults({this.id, required this.data, required this.scanDate});
}

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  // only have a single app-wide reference to the database
  static var _db;

  Future get database async {
    if (_db != null) return _db;
    // lazily instantiate the db the first time it is accessed
    _db = await init();
    return _db;
  }

  Future init() async {
    var databaseFactory;
    if (kIsWeb) {
      // Use web implementation on the web.
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      // Use ffi on Linux and Windows.
      databaseFactory = databaseFactoryFfi;
    }

    var factory = getIdbFactorySqflite(databaseFactory);

    return await factory.open(
      'app_database.db',
      version: 1,
      onUpgradeNeeded: (VersionChangeEvent event) {
        var db = event.database;
        if (!db.objectStoreNames.contains('loginStates')) {
          db.createObjectStore('loginStates', autoIncrement: true);
        }
        if (!db.objectStoreNames.contains('countStates')) {
          var countStatesStore = db.createObjectStore('countStates',
              keyPath: 'id', autoIncrement: true);
          countStatesStore.createIndex('itemId', 'itemId', unique: true);
        }
        if (!db.objectStoreNames.contains('capturedImages')) {
          db.createObjectStore('capturedImages',
              keyPath: 'id', autoIncrement: true);
        }
        if (!db.objectStoreNames.contains('qrScanResults')) {
          db.createObjectStore('qrScanResults',
              keyPath: 'id', autoIncrement: true);
        }
      },
    );
  }

  // LoginStates related functions
  Future<int> insertLoginState(LoginStates loginState) async {
    var db = await instance.database;
    var txn = db.transaction('loginStates', 'readwrite');
    var store = txn.objectStore('loginStates');
    var key = await store.add({'isLoggedIn': loginState.isLoggedIn});
    await txn.completed;
    return key;
  }

  Future<bool> checkLoginState() async {
    var db = await instance.database;
    var txn = db.transaction('loginStates', 'readonly');
    var store = txn.objectStore('loginStates');
    var cursor = store.openCursor();
    var result = await cursor.first;
    await txn.completed;
    return result?.value['isLoggedIn'] ?? false;
  }

  Future<void> clearLoginState() async {
    var db = await instance.database;
    var txn = db.transaction('loginStates', 'readwrite');
    var store = txn.objectStore('loginStates');
    await store.clear();
    await txn.completed;
  }

  // CountStates related functions
  Future<void> incrementItemClick(String itemId) async {
    var db = await instance.database;
    var txn = db.transaction('countStates', 'readwrite');
    var store = txn.objectStore('countStates');
    var index = store.index('itemId');

    var existingItem = await index.get(itemId);
    if (existingItem != null) {
      var existingItemMap = existingItem as Map<String, dynamic>;
      var updatedClickCount = (existingItemMap['clickCount'] as int) + 1;
      await store.put({
        'id': existingItemMap['id'],
        'itemId': itemId,
        'clickCount': updatedClickCount
      });
    } else {
      await store.add({'itemId': itemId, 'clickCount': 1});
    }
    await txn.completed;
  }

  Future<int> getItemClickCount(String itemId) async {
    var db = await instance.database;
    var txn = db.transaction('countStates', 'readonly');
    var store = txn.objectStore('countStates');
    var index = store.index('itemId');

    var existingItem = await index.get(itemId);

    await txn.completed;
    return existingItem != null ? existingItem['clickCount'] : 0;
  }

  // CapturedImages related functions
  Future<int> insertCapturedImage(CapturedImages image) async {
    var db = await instance.database;
    var txn = db.transaction('capturedImages', 'readwrite');
    var store = txn.objectStore('capturedImages');
    var key = await store.add({
      'imageData': image.imageData,
      'captureDate': image.captureDate.toIso8601String()
    });
    await txn.completed;
    return key;
  }

  Future<List<CapturedImages>> getAllCapturedImages() async {
    var db = await instance.database;
    var txn = db.transaction('capturedImages', 'readonly');
    var store = txn.objectStore('capturedImages');

    var cursor = store.openCursor(autoAdvance: true);
    var results = await cursor.toList();
    await txn.completed;
    return results
        .map<CapturedImages>((e) => CapturedImages(
            id: e.primaryKey as int?,
            imageData: Uint8List.fromList(
                (e.value.entries.toList()[0].value) as List<int>),
            captureDate:
                DateTime.parse((e.value.entries.toList()[1].value) as String)))
        .toList();
  }

  // QRScanResults related functions
  Future<int> insertQRScanResult(QRScanResults result) async {
    var db = await instance.database;
    var txn = db.transaction('qrScanResults', 'readwrite');
    var store = txn.objectStore('qrScanResults');
    var key = await store.add(
        {'data': result.data, 'scanDate': result.scanDate.toIso8601String()});
    await txn.completed;
    return key;
  }

  Future<List<QRScanResults>> getAllQRScanResults() async {
    var db = await instance.database;
    var txn = db.transaction('qrScanResults', 'readonly');
    var store = txn.objectStore('qrScanResults');

    var cursor = store.openCursor(autoAdvance: true);
    var results = await cursor.toList();
    await txn.completed;
    return results
        .map<QRScanResults>((e) => QRScanResults(
            id: e.primaryKey as int?,
            data: (e.value['data'] as String),
            scanDate: DateTime.parse(e.value['scanDate'] as String)))
        .toList();
  }
}
