import 'dart:convert';

import 'package:flutter_mysql_crud/action_pages.dart';
import 'package:flutter_mysql_crud/models/personal_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static const _createTable = 'CREATE_TABLE';
  static const _fetchData = 'FETCH_DATA';
  static const _addPerson = 'ADD_PERSON';
  static const _updatePerson = 'UPDATE_PERSON';
  static const _deletePerson = 'DELETE_PERSON';

  static Future<String> createTable() async {
    try {
       var map = <String, dynamic>{};
      map['action'] = _createTable;
      final response = await http.post(Uri.parse(ActionPages.create), body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<List<PersonalModal>> fetchData() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _fetchData;
      final response = await http.post(Uri.parse(ActionPages.fetch), body: map);
      // print('Fetch Data Response: ${response.body}');
      if (200 == response.statusCode) {
        List<PersonalModal> list = parseResponse(response.body);
        return list;
      } else {
        return <PersonalModal>[];
      }
    } catch (e) {
      return <PersonalModal>[];
    }
  }

  static List<PersonalModal> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PersonalModal>((json) => PersonalModal.fromJson(json))
        .toList();
  }

  static Future<String> addPerson(String firstName, String lastName) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _addPerson;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.post(Uri.parse(ActionPages.add), body: map);
      print('Add Person Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> updatePerson(
      String id, String firstname, String lastname) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _updatePerson;
      map['id'] = id;
      map['first_name'] = firstname;
      map['last_name'] = lastname;
      final response =
          await http.post(Uri.parse(ActionPages.update), body: map);
      print('Update Person Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> deletePerson(String id) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _deletePerson;
      map['id'] = id;
      final response =
          await http.post(Uri.parse(ActionPages.delete), body: map);
      print('Delete Person Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
