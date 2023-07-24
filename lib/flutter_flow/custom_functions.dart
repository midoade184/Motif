import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? removeHtmlTags(String? text) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return text?.replaceAll(exp, '');
}

dynamic customerModel(
  String firstName,
  String lastName,
  String email,
  String password,
) {
  Map<String, dynamic> map = {};
  map.addAll({
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "password": password,
    "username": email,
  });
  return map;
}

String capitalizeFirstLetter(String text) {
  return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}

int? minMaxPrice(
  String min,
  int? add,
) {
  add == null ? add = 0 : add;
  return int.parse(min) + 100 + add;
}

String joinRelatedListIDS(List<String>? idsList) {
  String newList = idsList!.join(",");
  return newList;
}

String? base64Convert(
  String? username,
  String? password,
) {
  String credentials = "${username}:${password}";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String encoded = stringToBase64.encode(credentials);
  return encoded;
}

dynamic orderModel(
  String paymentMethod,
  String paymentMethodTitle,
  bool setPaid,
  dynamic billing,
  List<dynamic> products,
  int customerId,
) {
  Map<String, dynamic> map = {};

  map.addAll({
    "customer_id": customerId,
    "payment_method": paymentMethod,
    "payment_method_title": paymentMethodTitle,
    "set_paid": setPaid,
    "billing": billing,
    "shipping": billing,
    "line_items": products,
    // "shipping_lines": shippingRate
  });
  return map;
}

DateTime returnDate(String utcDate) {
  DateTime formattedData = new DateFormat("yyyy-MM-dd").parse(utcDate);
  return formattedData;
}

dynamic updateCustomerData(
  String firstName,
  String lastName,
  String phone,
) {
  Map<String, dynamic> map = {};
  map.addAll({
    "first_name": firstName,
    "last_name": lastName,
    "billing": {"first_name": firstName, "last_name": lastName, "phone": phone},
    "shipping": {"first_name": firstName, "last_name": lastName, "phone": phone}
  });
  return map;
}

String replaceAMP(String text) {
  String newText = text.replaceAll('&amp;', '&');
  return newText;
}

double formatCartPrice(String price) {
  dynamic checkPrice = double.parse(price);
  dynamic newPrice = checkPrice / 100;

  return newPrice;
}

int decrementQty(int qty) {
  int newQty = 0;
  if (qty > 1) {
    newQty = qty - 1;
  } else if (qty == 1) {
    newQty = 1;
  }
  return newQty;
}

int incrementQty(int qty) {
  return qty + 1;
}

List<dynamic> enabledPayments(List<dynamic> payments) {
  List<Map<String, dynamic>> result = [];

  payments.forEach((payment) {
    if (payment['enabled'] == true) {
      result.add(payment);
    }
  });
  return result;
}

List<dynamic> filterOrderProducts(List<dynamic> cart) {
  List<Map<String, dynamic>> filteredCart = [];

  cart.forEach((item) {
    filteredCart.add({"product_id": item['id'], "quantity": item['quantity']});
  });
  return filteredCart;
}

dynamic orderBilling(
  String firstName,
  String lastName,
  String stName,
  String buildingNo,
  String floorNo,
  String appartmentNo,
  String country,
  String city,
  String phone,
  String email,
) {
  Map<String, dynamic> billing = {
    "first_name": firstName,
    "last_name": lastName,
    "address_1": 'Street Name: ' +
        stName +
        '\n Building Number: ' +
        buildingNo +
        '\n Floor Number: ' +
        floorNo +
        '\n Appartment Number: ' +
        appartmentNo,
    "address_2": "",
    "city": city,
    "state": "",
    "postcode": "",
    "country": country,
    "email": email,
    "phone": phone
  };
  return billing;
}

DateTime addToDate(
  int addToYear,
  int addToMonth,
  int addToDay,
  String date,
) {
  DateTime formattedDate = DateTime.parse(date);
  DateTime currentDate = DateTime.now();
  DateTime addedDate = DateTime(currentDate.year + addToYear,
      currentDate.month + addToMonth, currentDate.day + addToDay);
  return addedDate;
}

int convertStr2Int(List<dynamic> list) {
  int listCount = list.length;
  return listCount;
}

int calSalePrice(
  String salePrice,
  String regularPrice,
) {
  double priceDiff = double.parse(regularPrice) - double.parse(salePrice);
  double dividing = priceDiff / double.parse(regularPrice);
  double percentage = dividing * 100;
  int result = percentage.round();
  return result;
}

dynamic cancelOrder() {
  Map<String, dynamic> map = {};

  map.addAll({"status": "cancelled"});
  return map;
}

dynamic reviewsFilter(
  int productId,
  List<dynamic> allReviews,
) {
  List<Map<String, dynamic>> productReviews = [];
  allReviews.forEach((review) {
    if (review['product_id'] == productId) {
      productReviews.add(review);
    }
  });
  Map<String, dynamic> reviews = {};
  int oneStar = 0;
  int twoStar = 0;
  int threeStar = 0;
  int fourStar = 0;
  int fiveStar = 0;
  productReviews.forEach((reviewer) {
    if (reviewer['rating'] == 1) {
      oneStar++;
    }
    if (reviewer['rating'] == 2) {
      twoStar++;
    }
    if (reviewer['rating'] == 3) {
      threeStar++;
    }
    if (reviewer['rating'] == 4) {
      fourStar++;
    }
    if (reviewer['rating'] == 5) {
      fiveStar++;
    }
  });
  return {
    'product_review': double.parse(((1 * oneStar +
                2 * twoStar +
                3 * threeStar +
                4 * fourStar +
                5 * fiveStar) /
            productReviews.length)
        .toStringAsFixed(1)),
    'reviews': productReviews,
  };
}

List<dynamic> getAttsAsList(dynamic variation) {
  List att = [];
  variation['attributes'].forEach((k, v) {
    att.add(v);
  });
  return att;
}

bool isLastInList(
  List<String> list,
  String element,
) {
  if (list.last == element) {
    return true;
  } else {
    return false;
  }
}
