// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendorLogosStruct extends BaseStruct {
  VendorLogosStruct({
    String? vendorName,
  }) : _vendorName = vendorName;

  // "vendor_name" field.
  String? _vendorName;
  String get vendorName => _vendorName ?? '';
  set vendorName(String? val) => _vendorName = val;

  bool hasVendorName() => _vendorName != null;

  static VendorLogosStruct fromMap(Map<String, dynamic> data) =>
      VendorLogosStruct(
        vendorName: data['vendor_name'] as String?,
      );

  static VendorLogosStruct? maybeFromMap(dynamic data) => data is Map
      ? VendorLogosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vendor_name': _vendorName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vendor_name': serializeParam(
          _vendorName,
          ParamType.String,
        ),
      }.withoutNulls;

  static VendorLogosStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendorLogosStruct(
        vendorName: deserializeParam(
          data['vendor_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VendorLogosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendorLogosStruct && vendorName == other.vendorName;
  }

  @override
  int get hashCode => const ListEquality().hash([vendorName]);
}

VendorLogosStruct createVendorLogosStruct({
  String? vendorName,
}) =>
    VendorLogosStruct(
      vendorName: vendorName,
    );
