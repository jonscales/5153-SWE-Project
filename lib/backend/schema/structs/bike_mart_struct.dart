// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BikeMartStruct extends BaseStruct {
  BikeMartStruct({
    int? test,
  }) : _test = test;

  // "test" field.
  int? _test;
  int get test => _test ?? 0;
  set test(int? val) => _test = val;

  void incrementTest(int amount) => test = test + amount;

  bool hasTest() => _test != null;

  static BikeMartStruct fromMap(Map<String, dynamic> data) => BikeMartStruct(
        test: castToType<int>(data['test']),
      );

  static BikeMartStruct? maybeFromMap(dynamic data) =>
      data is Map ? BikeMartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'test': _test,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'test': serializeParam(
          _test,
          ParamType.int,
        ),
      }.withoutNulls;

  static BikeMartStruct fromSerializableMap(Map<String, dynamic> data) =>
      BikeMartStruct(
        test: deserializeParam(
          data['test'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BikeMartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BikeMartStruct && test == other.test;
  }

  @override
  int get hashCode => const ListEquality().hash([test]);
}

BikeMartStruct createBikeMartStruct({
  int? test,
}) =>
    BikeMartStruct(
      test: test,
    );
