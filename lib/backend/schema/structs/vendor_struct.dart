// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendorStruct extends BaseStruct {
  VendorStruct({
    int? id,
    String? name,
    int? booth,
    String? website,
    List<String>? categories,
    String? logourl,
  })  : _id = id,
        _name = name,
        _booth = booth,
        _website = website,
        _categories = categories,
        _logourl = logourl;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "booth" field.
  int? _booth;
  int get booth => _booth ?? 0;
  set booth(int? val) => _booth = val;

  void incrementBooth(int amount) => booth = booth + amount;

  bool hasBooth() => _booth != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  set website(String? val) => _website = val;

  bool hasWebsite() => _website != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  set categories(List<String>? val) => _categories = val;

  void updateCategories(Function(List<String>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "logourl" field.
  String? _logourl;
  String get logourl => _logourl ?? '';
  set logourl(String? val) => _logourl = val;

  bool hasLogourl() => _logourl != null;

  static VendorStruct fromMap(Map<String, dynamic> data) => VendorStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        booth: castToType<int>(data['booth']),
        website: data['website'] as String?,
        categories: getDataList(data['categories']),
        logourl: data['logourl'] as String?,
      );

  static VendorStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'booth': _booth,
        'website': _website,
        'categories': _categories,
        'logourl': _logourl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'booth': serializeParam(
          _booth,
          ParamType.int,
        ),
        'website': serializeParam(
          _website,
          ParamType.String,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.String,
          isList: true,
        ),
        'logourl': serializeParam(
          _logourl,
          ParamType.String,
        ),
      }.withoutNulls;

  static VendorStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendorStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        booth: deserializeParam(
          data['booth'],
          ParamType.int,
          false,
        ),
        website: deserializeParam(
          data['website'],
          ParamType.String,
          false,
        ),
        categories: deserializeParam<String>(
          data['categories'],
          ParamType.String,
          true,
        ),
        logourl: deserializeParam(
          data['logourl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VendorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VendorStruct &&
        id == other.id &&
        name == other.name &&
        booth == other.booth &&
        website == other.website &&
        listEquality.equals(categories, other.categories) &&
        logourl == other.logourl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, booth, website, categories, logourl]);
}

VendorStruct createVendorStruct({
  int? id,
  String? name,
  int? booth,
  String? website,
  String? logourl,
}) =>
    VendorStruct(
      id: id,
      name: name,
      booth: booth,
      website: website,
      logourl: logourl,
    );
