import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Customer_model.dart';


class CustomerDataController {
  final String apiUrl = 'http://test.api.boxigo.in/sample-data/';

  Future<List<CustomerDataModel>> fetchCustomerData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final customerEstimateList = jsonData['Customer_Estimate_Flow'] as List;

      return customerEstimateList
          .map((data) => CustomerDataModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load customer estimate');
    }
  }
}

