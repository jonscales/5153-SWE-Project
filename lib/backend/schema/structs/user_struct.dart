// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    String? email,

    /// Coordinates on 100-mile route
    List<LatLng>? points100Mile,
  })  : _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _points100Mile = points100Mile;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Points_100_Mile" field.
  List<LatLng>? _points100Mile;
  List<LatLng> get points100Mile => _points100Mile ?? const [];
  set points100Mile(List<LatLng>? val) => _points100Mile = val;

  void updatePoints100Mile(Function(List<LatLng>) updateFn) {
    updateFn(_points100Mile ??= []);
  }

  bool hasPoints100Mile() => _points100Mile != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
        points100Mile: getDataList(data['Points_100_Mile']),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'Points_100_Mile': _points100Mile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Points_100_Mile': serializeParam(
          _points100Mile,
          ParamType.LatLng,
          isList: true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        points100Mile: deserializeParam<LatLng>(
          data['Points_100_Mile'],
          ParamType.LatLng,
          true,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        listEquality.equals(points100Mile, other.points100Mile);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([firstName, lastName, email, points100Mile]);
}

UserStruct createUserStruct({
  String? firstName,
  String? lastName,
  String? email,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
