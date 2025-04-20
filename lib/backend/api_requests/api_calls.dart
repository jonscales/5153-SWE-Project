import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MaprequestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'maprequest',
      apiUrl:
          'https://static1.squarespace.com/static/5755853d20c6478394a9a05c/t/6744db2baae69d0e5d627d5b/1732565803812/2025+Downtown+Route+Guide.pdf',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'AIzaSyBIeCGzAiIsrRrtJDQZdqV7AtEaLfhg2oU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterTestUserCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? phoneNum = '',
    String? city = '',
    String? zipCode = '',
    String? emerContName = '',
    String? emerContPhone = '',
    String? ageStr = '',
    String? mainEvent = '',
    String? subEvent = '',
    String? riderCat = '',
    String? sex = '',
    String? parentName = '',
    String? ackWaiver = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phoneNum)}",
  "city": "${escapeStringForJson(city)}",
  "zipcode": "${escapeStringForJson(zipCode)}",
  "emr_contact_name": "${escapeStringForJson(emerContName)}",
  "emr_cont_phone": "${escapeStringForJson(emerContPhone)}",
  "main_event": "${escapeStringForJson(mainEvent)}",
  "sub_event": "${escapeStringForJson(subEvent)}",
  "rider_category": "${escapeStringForJson(riderCat)}",
  "age": "${escapeStringForJson(ageStr)}",
  "sex": "${escapeStringForJson(sex)}",
  "parent_name": "${escapeStringForJson(parentName)}",
  "waiver_signed": "${escapeStringForJson(ackWaiver)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerTestUser',
      apiUrl: 'https://98c7-38-172-87-87.ngrok-free.app/register',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            'c276770f2efc0e42e2d4e375dc511d370a6e4d3dcf3c73792a303713785bb639',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUserCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    dynamic userJson,
  }) async {
    final user = _serializeJson(userJson);
    final ffApiRequestBody = '''
${user}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addUser',
      apiUrl: 'https://e154-38-172-87-87.ngrok-free.app/add_user',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            'c276770f2efc0e42e2d4e375dc511d370a6e4d3dcf3c73792a303713785bb639',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddTestUserCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addTestUser',
      apiUrl: 'https://98c7-38-172-87-87.ngrok-free.app/add_test_user',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            'c276770f2efc0e42e2d4e375dc511d370a6e4d3dcf3c73792a303713785bb639',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterUserrCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerUserr',
      apiUrl: 'https://d13a-97-77-46-236.ngrok-free.app/registerUserr',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterRiderCall {
  static Future<ApiCallResponse> call({
    String? sex = 'NA',
    String? phoneNum = '',
    String? city = '',
    String? zipCode = '',
    String? emergContName = '',
    String? emergContPhone = '',
    String? firstName = '',
    String? email = '',
    String? lastName = '',
    String? subEvent = 'none',
    String? mainEvent = '',
    String? ageStr = '',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "email": "${escapeStringForJson(email)}",
  "gender": "${escapeStringForJson(sex)}",
  "city": "${escapeStringForJson(city)}",
  "state_country": "${escapeStringForJson(zipCode)}",
  "phone": "${escapeStringForJson(phoneNum)}",
  "emg_cont_name": "${escapeStringForJson(emergContName)}",
  "emg_cont_phone": "${escapeStringForJson(emergContPhone)}",
  "event_main": "${escapeStringForJson(mainEvent)}",
  "event_sub": "${escapeStringForJson(subEvent)}",
  "age": "${escapeStringForJson(ageStr)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerRider',
      apiUrl: 'https://d13a-97-77-46-236.ngrok-free.app/registerRider',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorLogoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'vendorLogo',
      apiUrl: 'https://9a55-216-213-117-42.ngrok-free.app/vendorLogos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorLogosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'vendorLogos',
      apiUrl:
          'https://storage.googleapis.com/hhh_vendors_logos/BikeMartLogo.png',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic logos(dynamic response) => getJsonField(
        response,
        r'''$.logos[*].logo''',
      );
}

class AdminLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdminLogin',
      apiUrl: 'https://d13a-97-77-46-236.ngrok-free.app/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VendorsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'vendors',
      apiUrl: 'https://98c7-38-172-87-87.ngrok-free.app/vendors',
      callType: ApiCallType.GET,
      headers: {
        'api-key':
            'c276770f2efc0e42e2d4e375dc511d370a6e4d3dcf3c73792a303713785bb639',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic booth(dynamic response) => getJsonField(
        response,
        r'''$[:].booth_location''',
      );
  static dynamic website(dynamic response) => getJsonField(
        response,
        r'''$[:].website''',
      );
  static dynamic categories(dynamic response) => getJsonField(
        response,
        r'''$[:].categories''',
      );
  static dynamic logourl(dynamic response) => getJsonField(
        response,
        r'''$[:].logourl''',
      );
}

class GetVendorsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getVendors',
      apiUrl: 'https://6225-38-172-87-87.ngrok-free.app/vendors',
      callType: ApiCallType.GET,
      headers: {
        'api-key':
            'c276770f2efc0e42e2d4ea375dc511d370a6e4d3dcf3c73792a303713785bb639',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SagCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? userLocation = '',
    String? status = 'pending',
  }) async {
    final ffApiRequestBody = '''
{
  "first_name": "${escapeStringForJson(firstName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "location": "${escapeStringForJson(userLocation)}",
  "status": "${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sag',
      apiUrl: 'https://d13a-97-77-46-236.ngrok-free.app/sag',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
