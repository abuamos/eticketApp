import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dropdownItems = [];
  String? selectedValue; // Nullable string for selectedValue

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final apiUrl =
        'http://localhost:8000/api/departure-port'; // Replace with your actual API endpoint
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> items = List<String>.from(
          data); // Assuming your API returns an array of strings, adjust accordingly if your data format is different.
      setState(() {
        dropdownItems = items;
      });
    } else {
      // Handle error if necessary
      print('Failed to fetch data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dropdown from Laravel API'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          items: dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Update the parameter to accept a nullable string
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
