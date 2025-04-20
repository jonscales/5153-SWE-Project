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
      _parentRiding =
          await secureStorage.getString('ff_parentRiding') ?? _parentRiding;
    });
    await _safeInitAsync(() async {
      _event1 = await secureStorage.getString('ff_event1') ?? _event1;
    });
    await _safeInitAsync(() async {
      _event2 = await secureStorage.getString('ff_event2') ?? _event2;
    });
    await _safeInitAsync(() async {
      _event3 = await secureStorage.getString('ff_event3') ?? _event3;
    });
    await _safeInitAsync(() async {
      _event4 = await secureStorage.getString('ff_event4') ?? _event4;
    });
    await _safeInitAsync(() async {
      _eventList =
          await secureStorage.getStringList('ff_eventList') ?? _eventList;
    });
    await _safeInitAsync(() async {
      _hasProfile = await secureStorage.getBool('ff_hasProfile') ?? _hasProfile;
    });
    await _safeInitAsync(() async {
      _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    await _safeInitAsync(() async {
      _subEvent1 = await secureStorage.getString('ff_subEvent1') ?? _subEvent1;
    });
    await _safeInitAsync(() async {
      _subEvent2 = await secureStorage.getString('ff_subEvent2') ?? _subEvent2;
    });
    await _safeInitAsync(() async {
      _subEvent3 = await secureStorage.getString('ff_subEvent3') ?? _subEvent3;
    });
    await _safeInitAsync(() async {
      _subEvent4 = await secureStorage.getString('ff_subEvent4') ?? _subEvent4;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_BikeMart') != null) {
        try {
          _BikeMart =
              jsonDecode(await secureStorage.getString('ff_BikeMart') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _subEventList =
          await secureStorage.getStringList('ff_subEventList') ?? _subEventList;
    });
    await _safeInitAsync(() async {
      _wasChildRegistered =
          await secureStorage.getBool('ff_wasChildRegistered') ??
              _wasChildRegistered;
    });
    await _safeInitAsync(() async {
      _subEventSelected = await secureStorage.getBool('ff_subEventSelected') ??
          _subEventSelected;
    });
    await _safeInitAsync(() async {
      _sexSelected =
          await secureStorage.getBool('ff_sexSelected') ?? _sexSelected;
    });
    await _safeInitAsync(() async {
      _mtbCutOffTime = await secureStorage.read(key: 'ff_mtbCutOffTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_mtbCutOffTime'))!)
          : _mtbCutOffTime;
    });
    await _safeInitAsync(() async {
      _runCutOffTime = await secureStorage.read(key: 'ff_runCutOffTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_runCutOffTime'))!)
          : _runCutOffTime;
    });
    await _safeInitAsync(() async {
      _enduranceCutOffTime =
          await secureStorage.read(key: 'ff_enduranceCutOffTime') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_enduranceCutOffTime'))!)
              : _enduranceCutOffTime;
    });
    await _safeInitAsync(() async {
      _gravelCutOffTime =
          await secureStorage.read(key: 'ff_gravelCutOffTime') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_gravelCutOffTime'))!)
              : _gravelCutOffTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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

  String _phoneNum = '';
  String get phoneNum => _phoneNum;
  set phoneNum(String value) {
    _phoneNum = value;
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

  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String value) {
    _zipCode = value;
  }

  String _ageStr = '';
  String get ageStr => _ageStr;
  set ageStr(String value) {
    _ageStr = value;
  }

  String _sex = 'NA';
  String get sex => _sex;
  set sex(String value) {
    _sex = value;
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

  String _mainEvent = '';
  String get mainEvent => _mainEvent;
  set mainEvent(String value) {
    _mainEvent = value;
  }

  String _subEvent = 'none';
  String get subEvent => _subEvent;
  set subEvent(String value) {
    _subEvent = value;
  }

  int _ageNum = 0;
  int get ageNum => _ageNum;
  set ageNum(int value) {
    _ageNum = value;
  }

  bool _isAdult = false;
  bool get isAdult => _isAdult;
  set isAdult(bool value) {
    _isAdult = value;
  }

  String _childFName = '';
  String get childFName => _childFName;
  set childFName(String value) {
    _childFName = value;
  }

  String _childLName = '';
  String get childLName => _childLName;
  set childLName(String value) {
    _childLName = value;
  }

  String _parentRiding = '';
  String get parentRiding => _parentRiding;
  set parentRiding(String value) {
    _parentRiding = value;
    secureStorage.setString('ff_parentRiding', value);
  }

  void deleteParentRiding() {
    secureStorage.delete(key: 'ff_parentRiding');
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

  String _ackWaiver = '';
  String get ackWaiver => _ackWaiver;
  set ackWaiver(String value) {
    _ackWaiver = value;
  }

  String _parentSigning = '';
  String get parentSigning => _parentSigning;
  set parentSigning(String value) {
    _parentSigning = value;
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

  String _event2 = '';
  String get event2 => _event2;
  set event2(String value) {
    _event2 = value;
    secureStorage.setString('ff_event2', value);
  }

  void deleteEvent2() {
    secureStorage.delete(key: 'ff_event2');
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

  bool _isEditingProfile = false;
  bool get isEditingProfile => _isEditingProfile;
  set isEditingProfile(bool value) {
    _isEditingProfile = value;
  }

  String _selectedMap = '';
  String get selectedMap => _selectedMap;
  set selectedMap(String value) {
    _selectedMap = value;
  }

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
  }

  String _payTable = '';
  String get payTable => _payTable;
  set payTable(String value) {
    _payTable = value;
  }

  List<String> _eventList = [];
  List<String> get eventList => _eventList;
  set eventList(List<String> value) {
    _eventList = value;
    secureStorage.setStringList('ff_eventList', value);
  }

  void deleteEventList() {
    secureStorage.delete(key: 'ff_eventList');
  }

  void addToEventList(String value) {
    eventList.add(value);
    secureStorage.setStringList('ff_eventList', _eventList);
  }

  void removeFromEventList(String value) {
    eventList.remove(value);
    secureStorage.setStringList('ff_eventList', _eventList);
  }

  void removeAtIndexFromEventList(int index) {
    eventList.removeAt(index);
    secureStorage.setStringList('ff_eventList', _eventList);
  }

  void updateEventListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventList[index] = updateFn(_eventList[index]);
    secureStorage.setStringList('ff_eventList', _eventList);
  }

  void insertAtIndexInEventList(int index, String value) {
    eventList.insert(index, value);
    secureStorage.setStringList('ff_eventList', _eventList);
  }

  bool _hasProfile = false;
  bool get hasProfile => _hasProfile;
  set hasProfile(bool value) {
    _hasProfile = value;
    secureStorage.setBool('ff_hasProfile', value);
  }

  void deleteHasProfile() {
    secureStorage.delete(key: 'ff_hasProfile');
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    secureStorage.setBool('ff_isLoggedIn', value);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  String _subEvent1 = '';
  String get subEvent1 => _subEvent1;
  set subEvent1(String value) {
    _subEvent1 = value;
    secureStorage.setString('ff_subEvent1', value);
  }

  void deleteSubEvent1() {
    secureStorage.delete(key: 'ff_subEvent1');
  }

  String _subEvent2 = '';
  String get subEvent2 => _subEvent2;
  set subEvent2(String value) {
    _subEvent2 = value;
    secureStorage.setString('ff_subEvent2', value);
  }

  void deleteSubEvent2() {
    secureStorage.delete(key: 'ff_subEvent2');
  }

  String _subEvent3 = '';
  String get subEvent3 => _subEvent3;
  set subEvent3(String value) {
    _subEvent3 = value;
    secureStorage.setString('ff_subEvent3', value);
  }

  void deleteSubEvent3() {
    secureStorage.delete(key: 'ff_subEvent3');
  }

  String _subEvent4 = '';
  String get subEvent4 => _subEvent4;
  set subEvent4(String value) {
    _subEvent4 = value;
    secureStorage.setString('ff_subEvent4', value);
  }

  void deleteSubEvent4() {
    secureStorage.delete(key: 'ff_subEvent4');
  }

  dynamic _BikeMart = jsonDecode(
      '{\"name\":\"BikeMart\",\"category\":\"Bikes & Gear, Clothing\",\"booth_location\":\"1\",\"website\":\"https://www.bikemart.com/\",\"logo\":\"https://storage.googleapis.com/hhh_vendors_logos/BikeMartLogo.png\"}');
  dynamic get BikeMart => _BikeMart;
  set BikeMart(dynamic value) {
    _BikeMart = value;
    secureStorage.setString('ff_BikeMart', jsonEncode(value));
  }

  void deleteBikeMart() {
    secureStorage.delete(key: 'ff_BikeMart');
  }

  List<String> _subEventList = [];
  List<String> get subEventList => _subEventList;
  set subEventList(List<String> value) {
    _subEventList = value;
    secureStorage.setStringList('ff_subEventList', value);
  }

  void deleteSubEventList() {
    secureStorage.delete(key: 'ff_subEventList');
  }

  void addToSubEventList(String value) {
    subEventList.add(value);
    secureStorage.setStringList('ff_subEventList', _subEventList);
  }

  void removeFromSubEventList(String value) {
    subEventList.remove(value);
    secureStorage.setStringList('ff_subEventList', _subEventList);
  }

  void removeAtIndexFromSubEventList(int index) {
    subEventList.removeAt(index);
    secureStorage.setStringList('ff_subEventList', _subEventList);
  }

  void updateSubEventListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    subEventList[index] = updateFn(_subEventList[index]);
    secureStorage.setStringList('ff_subEventList', _subEventList);
  }

  void insertAtIndexInSubEventList(int index, String value) {
    subEventList.insert(index, value);
    secureStorage.setStringList('ff_subEventList', _subEventList);
  }

  bool _wasChildRegistered = false;
  bool get wasChildRegistered => _wasChildRegistered;
  set wasChildRegistered(bool value) {
    _wasChildRegistered = value;
    secureStorage.setBool('ff_wasChildRegistered', value);
  }

  void deleteWasChildRegistered() {
    secureStorage.delete(key: 'ff_wasChildRegistered');
  }

  bool _subEventSelected = false;
  bool get subEventSelected => _subEventSelected;
  set subEventSelected(bool value) {
    _subEventSelected = value;
    secureStorage.setBool('ff_subEventSelected', value);
  }

  void deleteSubEventSelected() {
    secureStorage.delete(key: 'ff_subEventSelected');
  }

  bool _sexSelected = false;
  bool get sexSelected => _sexSelected;
  set sexSelected(bool value) {
    _sexSelected = value;
    secureStorage.setBool('ff_sexSelected', value);
  }

  void deleteSexSelected() {
    secureStorage.delete(key: 'ff_sexSelected');
  }

  dynamic _LoginResponse;
  dynamic get LoginResponse => _LoginResponse;
  set LoginResponse(dynamic value) {
    _LoginResponse = value;
  }

  DateTime? _mtbCutOffTime = DateTime.fromMillisecondsSinceEpoch(1755874800000);
  DateTime? get mtbCutOffTime => _mtbCutOffTime;
  set mtbCutOffTime(DateTime? value) {
    _mtbCutOffTime = value;
    value != null
        ? secureStorage.setInt('ff_mtbCutOffTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_mtbCutOffTime');
  }

  void deleteMtbCutOffTime() {
    secureStorage.delete(key: 'ff_mtbCutOffTime');
  }

  DateTime? _runCutOffTime = DateTime.fromMillisecondsSinceEpoch(1756036800000);
  DateTime? get runCutOffTime => _runCutOffTime;
  set runCutOffTime(DateTime? value) {
    _runCutOffTime = value;
    value != null
        ? secureStorage.setInt('ff_runCutOffTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_runCutOffTime');
  }

  void deleteRunCutOffTime() {
    secureStorage.delete(key: 'ff_runCutOffTime');
  }

  DateTime? _enduranceCutOffTime =
      DateTime.fromMillisecondsSinceEpoch(1755954000000);
  DateTime? get enduranceCutOffTime => _enduranceCutOffTime;
  set enduranceCutOffTime(DateTime? value) {
    _enduranceCutOffTime = value;
    value != null
        ? secureStorage.setInt(
            'ff_enduranceCutOffTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_enduranceCutOffTime');
  }

  void deleteEnduranceCutOffTime() {
    secureStorage.delete(key: 'ff_enduranceCutOffTime');
  }

  DateTime? _gravelCutOffTime =
      DateTime.fromMillisecondsSinceEpoch(1755995400000);
  DateTime? get gravelCutOffTime => _gravelCutOffTime;
  set gravelCutOffTime(DateTime? value) {
    _gravelCutOffTime = value;
    value != null
        ? secureStorage.setInt(
            'ff_gravelCutOffTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_gravelCutOffTime');
  }

  void deleteGravelCutOffTime() {
    secureStorage.delete(key: 'ff_gravelCutOffTime');
  }

  String _amountDue = '';
  String get amountDue => _amountDue;
  set amountDue(String value) {
    _amountDue = value;
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
