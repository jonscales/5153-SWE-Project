import 'dart:convert';

import 'package:flutter/foundation.dart';

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

class RegisterUserCall {
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
      callName: 'registerUser',
      apiUrl: 'https://b356-38-172-87-87.ngrok-free.app/register',
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
      apiUrl: 'https://b356-38-172-87-87.ngrok-free.app/add_test_user',
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
