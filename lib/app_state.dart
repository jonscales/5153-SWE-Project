import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _firstName = await secureStorage.getString('ff_firstName') ?? _firstName;
    });
    await _safeInitAsync(() async {
      _lastName = await secureStorage.getString('ff_lastName') ?? _lastName;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _fullName = await secureStorage.getString('ff_fullName') ?? _fullName;
    });
    await _safeInitAsync(() async {
      _event2 = await secureStorage.getString('ff_event2') ?? _event2;
    });
    await _safeInitAsync(() async {
      _event1 = await secureStorage.getString('ff_event1') ?? _event1;
    });
    await _safeInitAsync(() async {
      _event3 = await secureStorage.getString('ff_event3') ?? _event3;
    });
    await _safeInitAsync(() async {
      _event4 = await secureStorage.getString('ff_event4') ?? _event4;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _selectedMap = '';
  String get selectedMap => _selectedMap;
  set selectedMap(String value) {
    _selectedMap = value;
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    secureStorage.setString('ff_firstName', value);
  }

  void deleteFirstName() {
    secureStorage.delete(key: 'ff_firstName');
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    secureStorage.setString('ff_lastName', value);
  }

  void deleteLastName() {
    secureStorage.delete(key: 'ff_lastName');
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String value) {
    _fullName = value;
    secureStorage.setString('ff_fullName', value);
  }

  void deleteFullName() {
    secureStorage.delete(key: 'ff_fullName');
  }

  bool _isAdult = false;
  bool get isAdult => _isAdult;
  set isAdult(bool value) {
    _isAdult = value;
  }

  bool _isEditingProfile = false;
  bool get isEditingProfile => _isEditingProfile;
  set isEditingProfile(bool value) {
    _isEditingProfile = value;
  }

  int _ageNum = 0;
  int get ageNum => _ageNum;
  set ageNum(int value) {
    _ageNum = value;
  }

  String _ageStr = '';
  String get ageStr => _ageStr;
  set ageStr(String value) {
    _ageStr = value;
  }

  String _sex = '';
  String get sex => _sex;
  set sex(String value) {
    _sex = value;
  }

  String _mtbCategory = '';
  String get mtbCategory => _mtbCategory;
  set mtbCategory(String value) {
    _mtbCategory = value;
  }

  String _runDist = '';
  String get runDist => _runDist;
  set runDist(String value) {
    _runDist = value;
  }

  bool _hasScrolledWaiver = false;
  bool get hasScrolledWaiver => _hasScrolledWaiver;
  set hasScrolledWaiver(bool value) {
    _hasScrolledWaiver = value;
  }

  bool _hasAgreedWaiver = false;
  bool get hasAgreedWaiver => _hasAgreedWaiver;
  set hasAgreedWaiver(bool value) {
    _hasAgreedWaiver = value;
  }

  String _parentName = '';
  String get parentName => _parentName;
  set parentName(String value) {
    _parentName = value;
  }

  String _mainEvent = '';
  String get mainEvent => _mainEvent;
  set mainEvent(String value) {
    _mainEvent = value;
  }

  String _phoneNum = '';
  String get phoneNum => _phoneNum;
  set phoneNum(String value) {
    _phoneNum = value;
  }

  String _subEvent = '';
  String get subEvent => _subEvent;
  set subEvent(String value) {
    _subEvent = value;
  }

  String _riderCat = '';
  String get riderCat => _riderCat;
  set riderCat(String value) {
    _riderCat = value;
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String value) {
    _zipCode = value;
  }

  String _emerContName = '';
  String get emerContName => _emerContName;
  set emerContName(String value) {
    _emerContName = value;
  }

  String _emerContPhone = '';
  String get emerContPhone => _emerContPhone;
  set emerContPhone(String value) {
    _emerContPhone = value;
  }

  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }

  String _ackWaiver = '';
  String get ackWaiver => _ackWaiver;
  set ackWaiver(String value) {
    _ackWaiver = value;
  }

  String _event2 = '';
  String get event2 => _event2;
  set event2(String value) {
    _event2 = value;
    secureStorage.setString('ff_event2', value);
  }

  void deleteEvent2() {
    secureStorage.delete(key: 'ff_event2');
  }

  String _event1 = '';
  String get event1 => _event1;
  set event1(String value) {
    _event1 = value;
    secureStorage.setString('ff_event1', value);
  }

  void deleteEvent1() {
    secureStorage.delete(key: 'ff_event1');
  }

  String _event3 = '';
  String get event3 => _event3;
  set event3(String value) {
    _event3 = value;
    secureStorage.setString('ff_event3', value);
  }

  void deleteEvent3() {
    secureStorage.delete(key: 'ff_event3');
  }

  String _event4 = '';
  String get event4 => _event4;
  set event4(String value) {
    _event4 = value;
    secureStorage.setString('ff_event4', value);
  }

  void deleteEvent4() {
    secureStorage.delete(key: 'ff_event4');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
