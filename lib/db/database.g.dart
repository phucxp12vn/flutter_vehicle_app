// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LoginStatesTable extends LoginStates
    with TableInfo<$LoginStatesTable, LoginState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isLoggedInMeta =
      const VerificationMeta('isLoggedIn');
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
      'is_logged_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_logged_in" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [isLoggedIn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'login_states';
  @override
  VerificationContext validateIntegrity(Insertable<LoginState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    } else if (isInserting) {
      context.missing(_isLoggedInMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LoginState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoginState(
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_logged_in'])!,
    );
  }

  @override
  $LoginStatesTable createAlias(String alias) {
    return $LoginStatesTable(attachedDatabase, alias);
  }
}

class LoginState extends DataClass implements Insertable<LoginState> {
  final bool isLoggedIn;
  const LoginState({required this.isLoggedIn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    return map;
  }

  LoginStatesCompanion toCompanion(bool nullToAbsent) {
    return LoginStatesCompanion(
      isLoggedIn: Value(isLoggedIn),
    );
  }

  factory LoginState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoginState(
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
    };
  }

  LoginState copyWith({bool? isLoggedIn}) => LoginState(
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
  LoginState copyWithCompanion(LoginStatesCompanion data) {
    return LoginState(
      isLoggedIn:
          data.isLoggedIn.present ? data.isLoggedIn.value : this.isLoggedIn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoginState(')
          ..write('isLoggedIn: $isLoggedIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => isLoggedIn.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginState && other.isLoggedIn == this.isLoggedIn);
}

class LoginStatesCompanion extends UpdateCompanion<LoginState> {
  final Value<bool> isLoggedIn;
  final Value<int> rowid;
  const LoginStatesCompanion({
    this.isLoggedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoginStatesCompanion.insert({
    required bool isLoggedIn,
    this.rowid = const Value.absent(),
  }) : isLoggedIn = Value(isLoggedIn);
  static Insertable<LoginState> custom({
    Expression<bool>? isLoggedIn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoginStatesCompanion copyWith({Value<bool>? isLoggedIn, Value<int>? rowid}) {
    return LoginStatesCompanion(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginStatesCompanion(')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CountStatesTable extends CountStates
    with TableInfo<$CountStatesTable, CountState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clickCountMeta =
      const VerificationMeta('clickCount');
  @override
  late final GeneratedColumn<int> clickCount = GeneratedColumn<int>(
      'click_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, itemId, clickCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'count_states';
  @override
  VerificationContext validateIntegrity(Insertable<CountState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('click_count')) {
      context.handle(
          _clickCountMeta,
          clickCount.isAcceptableOrUnknown(
              data['click_count']!, _clickCountMeta));
    } else if (isInserting) {
      context.missing(_clickCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountState(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      clickCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}click_count'])!,
    );
  }

  @override
  $CountStatesTable createAlias(String alias) {
    return $CountStatesTable(attachedDatabase, alias);
  }
}

class CountState extends DataClass implements Insertable<CountState> {
  final int id;
  final String itemId;
  final int clickCount;
  const CountState(
      {required this.id, required this.itemId, required this.clickCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<String>(itemId);
    map['click_count'] = Variable<int>(clickCount);
    return map;
  }

  CountStatesCompanion toCompanion(bool nullToAbsent) {
    return CountStatesCompanion(
      id: Value(id),
      itemId: Value(itemId),
      clickCount: Value(clickCount),
    );
  }

  factory CountState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountState(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      clickCount: serializer.fromJson<int>(json['clickCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<String>(itemId),
      'clickCount': serializer.toJson<int>(clickCount),
    };
  }

  CountState copyWith({int? id, String? itemId, int? clickCount}) => CountState(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        clickCount: clickCount ?? this.clickCount,
      );
  CountState copyWithCompanion(CountStatesCompanion data) {
    return CountState(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      clickCount:
          data.clickCount.present ? data.clickCount.value : this.clickCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountState(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('clickCount: $clickCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, clickCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountState &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.clickCount == this.clickCount);
}

class CountStatesCompanion extends UpdateCompanion<CountState> {
  final Value<int> id;
  final Value<String> itemId;
  final Value<int> clickCount;
  const CountStatesCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.clickCount = const Value.absent(),
  });
  CountStatesCompanion.insert({
    this.id = const Value.absent(),
    required String itemId,
    required int clickCount,
  })  : itemId = Value(itemId),
        clickCount = Value(clickCount);
  static Insertable<CountState> custom({
    Expression<int>? id,
    Expression<String>? itemId,
    Expression<int>? clickCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (clickCount != null) 'click_count': clickCount,
    });
  }

  CountStatesCompanion copyWith(
      {Value<int>? id, Value<String>? itemId, Value<int>? clickCount}) {
    return CountStatesCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (clickCount.present) {
      map['click_count'] = Variable<int>(clickCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountStatesCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('clickCount: $clickCount')
          ..write(')'))
        .toString();
  }
}

class $CapturedImagesTable extends CapturedImages
    with TableInfo<$CapturedImagesTable, CapturedImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CapturedImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _imageDataMeta =
      const VerificationMeta('imageData');
  @override
  late final GeneratedColumn<Uint8List> imageData = GeneratedColumn<Uint8List>(
      'image_data', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _captureDateMeta =
      const VerificationMeta('captureDate');
  @override
  late final GeneratedColumn<DateTime> captureDate = GeneratedColumn<DateTime>(
      'capture_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageData, captureDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'captured_images';
  @override
  VerificationContext validateIntegrity(Insertable<CapturedImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_data')) {
      context.handle(_imageDataMeta,
          imageData.isAcceptableOrUnknown(data['image_data']!, _imageDataMeta));
    } else if (isInserting) {
      context.missing(_imageDataMeta);
    }
    if (data.containsKey('capture_date')) {
      context.handle(
          _captureDateMeta,
          captureDate.isAcceptableOrUnknown(
              data['capture_date']!, _captureDateMeta));
    } else if (isInserting) {
      context.missing(_captureDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CapturedImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CapturedImage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      imageData: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_data'])!,
      captureDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}capture_date'])!,
    );
  }

  @override
  $CapturedImagesTable createAlias(String alias) {
    return $CapturedImagesTable(attachedDatabase, alias);
  }
}

class CapturedImage extends DataClass implements Insertable<CapturedImage> {
  final int id;
  final Uint8List imageData;
  final DateTime captureDate;
  const CapturedImage(
      {required this.id, required this.imageData, required this.captureDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image_data'] = Variable<Uint8List>(imageData);
    map['capture_date'] = Variable<DateTime>(captureDate);
    return map;
  }

  CapturedImagesCompanion toCompanion(bool nullToAbsent) {
    return CapturedImagesCompanion(
      id: Value(id),
      imageData: Value(imageData),
      captureDate: Value(captureDate),
    );
  }

  factory CapturedImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CapturedImage(
      id: serializer.fromJson<int>(json['id']),
      imageData: serializer.fromJson<Uint8List>(json['imageData']),
      captureDate: serializer.fromJson<DateTime>(json['captureDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'imageData': serializer.toJson<Uint8List>(imageData),
      'captureDate': serializer.toJson<DateTime>(captureDate),
    };
  }

  CapturedImage copyWith(
          {int? id, Uint8List? imageData, DateTime? captureDate}) =>
      CapturedImage(
        id: id ?? this.id,
        imageData: imageData ?? this.imageData,
        captureDate: captureDate ?? this.captureDate,
      );
  CapturedImage copyWithCompanion(CapturedImagesCompanion data) {
    return CapturedImage(
      id: data.id.present ? data.id.value : this.id,
      imageData: data.imageData.present ? data.imageData.value : this.imageData,
      captureDate:
          data.captureDate.present ? data.captureDate.value : this.captureDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CapturedImage(')
          ..write('id: $id, ')
          ..write('imageData: $imageData, ')
          ..write('captureDate: $captureDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, $driftBlobEquality.hash(imageData), captureDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CapturedImage &&
          other.id == this.id &&
          $driftBlobEquality.equals(other.imageData, this.imageData) &&
          other.captureDate == this.captureDate);
}

class CapturedImagesCompanion extends UpdateCompanion<CapturedImage> {
  final Value<int> id;
  final Value<Uint8List> imageData;
  final Value<DateTime> captureDate;
  const CapturedImagesCompanion({
    this.id = const Value.absent(),
    this.imageData = const Value.absent(),
    this.captureDate = const Value.absent(),
  });
  CapturedImagesCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List imageData,
    required DateTime captureDate,
  })  : imageData = Value(imageData),
        captureDate = Value(captureDate);
  static Insertable<CapturedImage> custom({
    Expression<int>? id,
    Expression<Uint8List>? imageData,
    Expression<DateTime>? captureDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageData != null) 'image_data': imageData,
      if (captureDate != null) 'capture_date': captureDate,
    });
  }

  CapturedImagesCompanion copyWith(
      {Value<int>? id,
      Value<Uint8List>? imageData,
      Value<DateTime>? captureDate}) {
    return CapturedImagesCompanion(
      id: id ?? this.id,
      imageData: imageData ?? this.imageData,
      captureDate: captureDate ?? this.captureDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imageData.present) {
      map['image_data'] = Variable<Uint8List>(imageData.value);
    }
    if (captureDate.present) {
      map['capture_date'] = Variable<DateTime>(captureDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CapturedImagesCompanion(')
          ..write('id: $id, ')
          ..write('imageData: $imageData, ')
          ..write('captureDate: $captureDate')
          ..write(')'))
        .toString();
  }
}

class $QRScanResultsTable extends QRScanResults
    with TableInfo<$QRScanResultsTable, QRScanResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QRScanResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scanDateMeta =
      const VerificationMeta('scanDate');
  @override
  late final GeneratedColumn<DateTime> scanDate = GeneratedColumn<DateTime>(
      'scan_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, data, scanDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'q_r_scan_results';
  @override
  VerificationContext validateIntegrity(Insertable<QRScanResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('scan_date')) {
      context.handle(_scanDateMeta,
          scanDate.isAcceptableOrUnknown(data['scan_date']!, _scanDateMeta));
    } else if (isInserting) {
      context.missing(_scanDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QRScanResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QRScanResult(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      scanDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}scan_date'])!,
    );
  }

  @override
  $QRScanResultsTable createAlias(String alias) {
    return $QRScanResultsTable(attachedDatabase, alias);
  }
}

class QRScanResult extends DataClass implements Insertable<QRScanResult> {
  final int id;
  final String data;
  final DateTime scanDate;
  const QRScanResult(
      {required this.id, required this.data, required this.scanDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    map['scan_date'] = Variable<DateTime>(scanDate);
    return map;
  }

  QRScanResultsCompanion toCompanion(bool nullToAbsent) {
    return QRScanResultsCompanion(
      id: Value(id),
      data: Value(data),
      scanDate: Value(scanDate),
    );
  }

  factory QRScanResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QRScanResult(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String>(json['data']),
      scanDate: serializer.fromJson<DateTime>(json['scanDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String>(data),
      'scanDate': serializer.toJson<DateTime>(scanDate),
    };
  }

  QRScanResult copyWith({int? id, String? data, DateTime? scanDate}) =>
      QRScanResult(
        id: id ?? this.id,
        data: data ?? this.data,
        scanDate: scanDate ?? this.scanDate,
      );
  QRScanResult copyWithCompanion(QRScanResultsCompanion data) {
    return QRScanResult(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      scanDate: data.scanDate.present ? data.scanDate.value : this.scanDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QRScanResult(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('scanDate: $scanDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, scanDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QRScanResult &&
          other.id == this.id &&
          other.data == this.data &&
          other.scanDate == this.scanDate);
}

class QRScanResultsCompanion extends UpdateCompanion<QRScanResult> {
  final Value<int> id;
  final Value<String> data;
  final Value<DateTime> scanDate;
  const QRScanResultsCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.scanDate = const Value.absent(),
  });
  QRScanResultsCompanion.insert({
    this.id = const Value.absent(),
    required String data,
    required DateTime scanDate,
  })  : data = Value(data),
        scanDate = Value(scanDate);
  static Insertable<QRScanResult> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<DateTime>? scanDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (scanDate != null) 'scan_date': scanDate,
    });
  }

  QRScanResultsCompanion copyWith(
      {Value<int>? id, Value<String>? data, Value<DateTime>? scanDate}) {
    return QRScanResultsCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      scanDate: scanDate ?? this.scanDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (scanDate.present) {
      map['scan_date'] = Variable<DateTime>(scanDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QRScanResultsCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('scanDate: $scanDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LoginStatesTable loginStates = $LoginStatesTable(this);
  late final $CountStatesTable countStates = $CountStatesTable(this);
  late final $CapturedImagesTable capturedImages = $CapturedImagesTable(this);
  late final $QRScanResultsTable qRScanResults = $QRScanResultsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [loginStates, countStates, capturedImages, qRScanResults];
}

typedef $$LoginStatesTableCreateCompanionBuilder = LoginStatesCompanion
    Function({
  required bool isLoggedIn,
  Value<int> rowid,
});
typedef $$LoginStatesTableUpdateCompanionBuilder = LoginStatesCompanion
    Function({
  Value<bool> isLoggedIn,
  Value<int> rowid,
});

class $$LoginStatesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LoginStatesTable> {
  $$LoginStatesTableFilterComposer(super.$state);
  ColumnFilters<bool> get isLoggedIn => $state.composableBuilder(
      column: $state.table.isLoggedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LoginStatesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LoginStatesTable> {
  $$LoginStatesTableOrderingComposer(super.$state);
  ColumnOrderings<bool> get isLoggedIn => $state.composableBuilder(
      column: $state.table.isLoggedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$LoginStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoginStatesTable,
    LoginState,
    $$LoginStatesTableFilterComposer,
    $$LoginStatesTableOrderingComposer,
    $$LoginStatesTableCreateCompanionBuilder,
    $$LoginStatesTableUpdateCompanionBuilder,
    (LoginState, BaseReferences<_$AppDatabase, $LoginStatesTable, LoginState>),
    LoginState,
    PrefetchHooks Function()> {
  $$LoginStatesTableTableManager(_$AppDatabase db, $LoginStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LoginStatesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LoginStatesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<bool> isLoggedIn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginStatesCompanion(
            isLoggedIn: isLoggedIn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool isLoggedIn,
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginStatesCompanion.insert(
            isLoggedIn: isLoggedIn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoginStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoginStatesTable,
    LoginState,
    $$LoginStatesTableFilterComposer,
    $$LoginStatesTableOrderingComposer,
    $$LoginStatesTableCreateCompanionBuilder,
    $$LoginStatesTableUpdateCompanionBuilder,
    (LoginState, BaseReferences<_$AppDatabase, $LoginStatesTable, LoginState>),
    LoginState,
    PrefetchHooks Function()>;
typedef $$CountStatesTableCreateCompanionBuilder = CountStatesCompanion
    Function({
  Value<int> id,
  required String itemId,
  required int clickCount,
});
typedef $$CountStatesTableUpdateCompanionBuilder = CountStatesCompanion
    Function({
  Value<int> id,
  Value<String> itemId,
  Value<int> clickCount,
});

class $$CountStatesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CountStatesTable> {
  $$CountStatesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get clickCount => $state.composableBuilder(
      column: $state.table.clickCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CountStatesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CountStatesTable> {
  $$CountStatesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itemId => $state.composableBuilder(
      column: $state.table.itemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get clickCount => $state.composableBuilder(
      column: $state.table.clickCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CountStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CountStatesTable,
    CountState,
    $$CountStatesTableFilterComposer,
    $$CountStatesTableOrderingComposer,
    $$CountStatesTableCreateCompanionBuilder,
    $$CountStatesTableUpdateCompanionBuilder,
    (CountState, BaseReferences<_$AppDatabase, $CountStatesTable, CountState>),
    CountState,
    PrefetchHooks Function()> {
  $$CountStatesTableTableManager(_$AppDatabase db, $CountStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CountStatesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CountStatesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<int> clickCount = const Value.absent(),
          }) =>
              CountStatesCompanion(
            id: id,
            itemId: itemId,
            clickCount: clickCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String itemId,
            required int clickCount,
          }) =>
              CountStatesCompanion.insert(
            id: id,
            itemId: itemId,
            clickCount: clickCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CountStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CountStatesTable,
    CountState,
    $$CountStatesTableFilterComposer,
    $$CountStatesTableOrderingComposer,
    $$CountStatesTableCreateCompanionBuilder,
    $$CountStatesTableUpdateCompanionBuilder,
    (CountState, BaseReferences<_$AppDatabase, $CountStatesTable, CountState>),
    CountState,
    PrefetchHooks Function()>;
typedef $$CapturedImagesTableCreateCompanionBuilder = CapturedImagesCompanion
    Function({
  Value<int> id,
  required Uint8List imageData,
  required DateTime captureDate,
});
typedef $$CapturedImagesTableUpdateCompanionBuilder = CapturedImagesCompanion
    Function({
  Value<int> id,
  Value<Uint8List> imageData,
  Value<DateTime> captureDate,
});

class $$CapturedImagesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CapturedImagesTable> {
  $$CapturedImagesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get imageData => $state.composableBuilder(
      column: $state.table.imageData,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get captureDate => $state.composableBuilder(
      column: $state.table.captureDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CapturedImagesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CapturedImagesTable> {
  $$CapturedImagesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get imageData => $state.composableBuilder(
      column: $state.table.imageData,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get captureDate => $state.composableBuilder(
      column: $state.table.captureDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CapturedImagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CapturedImagesTable,
    CapturedImage,
    $$CapturedImagesTableFilterComposer,
    $$CapturedImagesTableOrderingComposer,
    $$CapturedImagesTableCreateCompanionBuilder,
    $$CapturedImagesTableUpdateCompanionBuilder,
    (
      CapturedImage,
      BaseReferences<_$AppDatabase, $CapturedImagesTable, CapturedImage>
    ),
    CapturedImage,
    PrefetchHooks Function()> {
  $$CapturedImagesTableTableManager(
      _$AppDatabase db, $CapturedImagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CapturedImagesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CapturedImagesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<Uint8List> imageData = const Value.absent(),
            Value<DateTime> captureDate = const Value.absent(),
          }) =>
              CapturedImagesCompanion(
            id: id,
            imageData: imageData,
            captureDate: captureDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required Uint8List imageData,
            required DateTime captureDate,
          }) =>
              CapturedImagesCompanion.insert(
            id: id,
            imageData: imageData,
            captureDate: captureDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CapturedImagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CapturedImagesTable,
    CapturedImage,
    $$CapturedImagesTableFilterComposer,
    $$CapturedImagesTableOrderingComposer,
    $$CapturedImagesTableCreateCompanionBuilder,
    $$CapturedImagesTableUpdateCompanionBuilder,
    (
      CapturedImage,
      BaseReferences<_$AppDatabase, $CapturedImagesTable, CapturedImage>
    ),
    CapturedImage,
    PrefetchHooks Function()>;
typedef $$QRScanResultsTableCreateCompanionBuilder = QRScanResultsCompanion
    Function({
  Value<int> id,
  required String data,
  required DateTime scanDate,
});
typedef $$QRScanResultsTableUpdateCompanionBuilder = QRScanResultsCompanion
    Function({
  Value<int> id,
  Value<String> data,
  Value<DateTime> scanDate,
});

class $$QRScanResultsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $QRScanResultsTable> {
  $$QRScanResultsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get data => $state.composableBuilder(
      column: $state.table.data,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get scanDate => $state.composableBuilder(
      column: $state.table.scanDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$QRScanResultsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $QRScanResultsTable> {
  $$QRScanResultsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get data => $state.composableBuilder(
      column: $state.table.data,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get scanDate => $state.composableBuilder(
      column: $state.table.scanDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$QRScanResultsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QRScanResultsTable,
    QRScanResult,
    $$QRScanResultsTableFilterComposer,
    $$QRScanResultsTableOrderingComposer,
    $$QRScanResultsTableCreateCompanionBuilder,
    $$QRScanResultsTableUpdateCompanionBuilder,
    (
      QRScanResult,
      BaseReferences<_$AppDatabase, $QRScanResultsTable, QRScanResult>
    ),
    QRScanResult,
    PrefetchHooks Function()> {
  $$QRScanResultsTableTableManager(_$AppDatabase db, $QRScanResultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$QRScanResultsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$QRScanResultsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<DateTime> scanDate = const Value.absent(),
          }) =>
              QRScanResultsCompanion(
            id: id,
            data: data,
            scanDate: scanDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String data,
            required DateTime scanDate,
          }) =>
              QRScanResultsCompanion.insert(
            id: id,
            data: data,
            scanDate: scanDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$QRScanResultsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QRScanResultsTable,
    QRScanResult,
    $$QRScanResultsTableFilterComposer,
    $$QRScanResultsTableOrderingComposer,
    $$QRScanResultsTableCreateCompanionBuilder,
    $$QRScanResultsTableUpdateCompanionBuilder,
    (
      QRScanResult,
      BaseReferences<_$AppDatabase, $QRScanResultsTable, QRScanResult>
    ),
    QRScanResult,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LoginStatesTableTableManager get loginStates =>
      $$LoginStatesTableTableManager(_db, _db.loginStates);
  $$CountStatesTableTableManager get countStates =>
      $$CountStatesTableTableManager(_db, _db.countStates);
  $$CapturedImagesTableTableManager get capturedImages =>
      $$CapturedImagesTableTableManager(_db, _db.capturedImages);
  $$QRScanResultsTableTableManager get qRScanResults =>
      $$QRScanResultsTableTableManager(_db, _db.qRScanResults);
}
