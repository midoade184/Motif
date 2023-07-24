import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Cart Group Code

class CartGroup {
  static String baseUrl = 'https://motifeg.com/wp-json/cocart/v2/cart';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-url-encoded',
  };
  static GetCartCall getCartCall = GetCartCall();
  static AddToCartCall addToCartCall = AddToCartCall();
  static RemoveItemCall removeItemCall = RemoveItemCall();
  static UpdateItemInCartCall updateItemInCartCall = UpdateItemInCartCall();
  static ClearCartCall clearCartCall = ClearCartCall();
}

class GetCartCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Cart',
      apiUrl: '${CartGroup.baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        ...CartGroup.headers,
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.items.price''',
      );
}

class AddToCartCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? id,
    String? qty = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add To Cart',
      apiUrl: '${CartGroup.baseUrl}/add-item',
      callType: ApiCallType.POST,
      headers: {
        ...CartGroup.headers,
        'Authorization': 'Bearer ${userToken}',
      },
      params: {
        'id': id,
        'quantity': qty,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveItemCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? itemKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Remove Item',
      apiUrl: '${CartGroup.baseUrl}/item/${itemKey}',
      callType: ApiCallType.DELETE,
      headers: {
        ...CartGroup.headers,
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateItemInCartCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? itemKey = '',
    int? quantity,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Item in Cart',
      apiUrl: '${CartGroup.baseUrl}/item/${itemKey}',
      callType: ApiCallType.POST,
      headers: {
        ...CartGroup.headers,
        'Authorization': 'Bearer ${userToken}',
      },
      params: {
        'quantity': quantity,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ClearCartCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? cartKey,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Clear Cart',
      apiUrl: '${CartGroup.baseUrl}/clear',
      callType: ApiCallType.POST,
      headers: {
        ...CartGroup.headers,
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Cart Group Code

/// Start Csutomer Group Code

class CsutomerGroup {
  static String baseUrl = 'https://motifeg.com/wp-json/wc/v3/customers';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetCustomerCall getCustomerCall = GetCustomerCall();
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static UpdateCustomerCall updateCustomerCall = UpdateCustomerCall();
}

class GetCustomerCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Customer',
      apiUrl: '${CsutomerGroup.baseUrl}/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...CsutomerGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.username''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.billing.company''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.billing.address_1''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.billing.city''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.billing.country''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.billing.phone''',
      );
  dynamic avatarUrl(dynamic response) => getJsonField(
        response,
        r'''$.avatar_url''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    dynamic? customerModelJson,
    String? authToken = '',
  }) {
    final customerModel = _serializeJson(customerModelJson);
    final body = '''
${customerModel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Customer',
      apiUrl: '${CsutomerGroup.baseUrl}?',
      callType: ApiCallType.POST,
      headers: {
        ...CsutomerGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateCustomerCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? authToken = '',
    dynamic? customerModelJson,
  }) {
    final customerModel = _serializeJson(customerModelJson);
    final body = '''
${customerModel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Customer',
      apiUrl: '${CsutomerGroup.baseUrl}/${id}',
      callType: ApiCallType.PUT,
      headers: {
        ...CsutomerGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Csutomer Group Code

/// Start Orders Group Code

class OrdersGroup {
  static String baseUrl = 'https://motifeg.com/wp-json/wc/v3/orders';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateOrderCall createOrderCall = CreateOrderCall();
  static RetriveOrderCall retriveOrderCall = RetriveOrderCall();
  static GetOrdersByCustomerIdCall getOrdersByCustomerIdCall =
      GetOrdersByCustomerIdCall();
  static UpdateOrderCall updateOrderCall = UpdateOrderCall();
  static DeleteAnOrderCall deleteAnOrderCall = DeleteAnOrderCall();
  static CreateOrderNoteCall createOrderNoteCall = CreateOrderNoteCall();
  static GetOrderNotesCall getOrderNotesCall = GetOrderNotesCall();
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    dynamic? orderModelJson,
  }) {
    final orderModel = _serializeJson(orderModelJson);
    final body = '''
${orderModel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Order',
      apiUrl: '${OrdersGroup.baseUrl}?',
      callType: ApiCallType.POST,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RetriveOrderCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? orderId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrive Order',
      apiUrl: '${OrdersGroup.baseUrl}/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class GetOrdersByCustomerIdCall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Orders By Customer Id',
      apiUrl: '${OrdersGroup.baseUrl}?customer=${customerId}',
      callType: ApiCallType.GET,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class UpdateOrderCall {
  Future<ApiCallResponse> call({
    int? orderId,
    String? authToken = '',
    dynamic? orderModelJson,
  }) {
    final orderModel = _serializeJson(orderModelJson);
    final body = '''
${orderModel}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Order',
      apiUrl: '${OrdersGroup.baseUrl}/${orderId}',
      callType: ApiCallType.PUT,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteAnOrderCall {
  Future<ApiCallResponse> call({
    int? orderId,
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete An Order',
      apiUrl: '${OrdersGroup.baseUrl}/${orderId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrderNoteCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
    String? note = '',
  }) {
    final body = '''
{
  "note": "${note}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Order Note',
      apiUrl: '${OrdersGroup.baseUrl}/${id}/notes',
      callType: ApiCallType.POST,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetOrderNotesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Order Notes',
      apiUrl: '${OrdersGroup.baseUrl}/${id}/notes',
      callType: ApiCallType.GET,
      headers: {
        ...OrdersGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

/// End Orders Group Code

/// Start Pyaments Group Code

class PyamentsGroup {
  static String baseUrl = 'https://motifeg.com/wp-json/wc/v3/payment_gateways';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-url-encoded',
  };
  static GetPyamentsCall getPyamentsCall = GetPyamentsCall();
}

class GetPyamentsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Pyaments',
      apiUrl: '${PyamentsGroup.baseUrl}?',
      callType: ApiCallType.GET,
      headers: {
        ...PyamentsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Pyaments Group Code

/// Start Products Group Code

class ProductsGroup {
  static String baseUrl = 'https://motifeg.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-url-encoded',
  };
  static AllProductsCall allProductsCall = AllProductsCall();
  static SingleProductCall singleProductCall = SingleProductCall();
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
  static GetProductsByCategoryCall getProductsByCategoryCall =
      GetProductsByCategoryCall();
  static ProductReviewsCall productReviewsCall = ProductReviewsCall();
  static AddReviewCall addReviewCall = AddReviewCall();
  static ProductsCall productsCall = ProductsCall();
  static GetSlidesCall getSlidesCall = GetSlidesCall();
  static GetCategoryProductsCall getCategoryProductsCall =
      GetCategoryProductsCall();
}

class AllProductsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? filterParameters = '',
    String? perPage = '',
    String? page = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'All Products',
      apiUrl:
          '${ProductsGroup.baseUrl}/wp-json/wc/v3/products?status=publish${filterParameters}${perPage}${page}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class SingleProductCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Single Product',
      apiUrl: '${ProductsGroup.baseUrl}/wp-json/custom/v1/products?id=${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic variations(dynamic response) => getJsonField(
        response,
        r'''$.variations''',
        true,
      );
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Categories',
      apiUrl: '${ProductsGroup.baseUrl}/wp-json/wc/v3/products/categories',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class GetProductsByCategoryCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Products By Category',
      apiUrl: '${ProductsGroup.baseUrl}/wp-json/wc/v3/products?category=${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class ProductReviewsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? perPage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product Reviews',
      apiUrl:
          '${ProductsGroup.baseUrl}/wp-json/wc/v3/products/reviews?per_page=${perPage}&order=desc&status=approved',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class AddReviewCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? productID,
    String? review = '',
    String? reviewer = '',
    int? rating,
    String? reviewerEmail = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Review',
      apiUrl: '${ProductsGroup.baseUrl}/wp-json/wc/v3/products/reviews',
      callType: ApiCallType.POST,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {
        'product_id': productID,
        'review': review,
        'reviewer': reviewer,
        'reviewer_email': reviewerEmail,
        'rating': rating,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProductsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? filter = '',
    String? search = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl:
          '${ProductsGroup.baseUrl}/wp-json/custom/v1/products?search=${search}&filter=${filter}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic productsList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetSlidesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Slides',
      apiUrl: '${ProductsGroup.baseUrl}/wp-json/custom/v1/mobile-slides',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class GetCategoryProductsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
    String? filter = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Category Products',
      apiUrl:
          '${ProductsGroup.baseUrl}/wp-json/custom/v1/category?id=${id}&filter=${filter}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Products Group Code

/// Start Copouns Group Code

class CopounsGroup {
  static String baseUrl = 'https://motifeg.com/wp-json/wc/v3';
  static Map<String, String> headers = {};
  static GetAllCopounsCall getAllCopounsCall = GetAllCopounsCall();
}

class GetAllCopounsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Copouns',
      apiUrl: '${CopounsGroup.baseUrl}/coupons',
      callType: ApiCallType.GET,
      headers: {
        ...CopounsGroup.headers,
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Copouns Group Code

class FiltersCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? searchParameters = '',
    String? filterParameters = '',
    String? page = '',
    String? perPage = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Filters',
      apiUrl:
          'https://motifeg.com/wp-json/wc/v3/products?status=publish${searchParameters}${filterParameters}${perPage}${page}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-url-encoded',
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CustomerLoginCall {
  static Future<ApiCallResponse> call({
    String? tokenUrl = '',
    String? userName = '',
    String? password = '',
  }) {
    final body = '''
{
  "username": "${userName}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Login',
      apiUrl: '${tokenUrl}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  static dynamic userToken(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

class CartQuantityCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cart Quantity',
      apiUrl: 'https://motifeg.com/wp-json/custom/v1/cart_quantity?id=${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCustomCartCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Custom Cart',
      apiUrl: 'https://motifeg.com/wp-json/custom/v1/cart?id=${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
