// ignore: file_names
import 'package:flutter/material.dart';
import '../../constants/api_service.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<String> dropdownOptions = [];
  String? selectedOption; // Update to nullable String
  APIService apiService = APIService();

  @override
  void initState() {
    super.initState();
    fetchDropdownOptions();
  }

  void fetchDropdownOptions() async {
    try {
      List<String> options = await apiService.getDropdownOptions();
      setState(() {
        dropdownOptions = options;
        selectedOption = dropdownOptions.isNotEmpty ? dropdownOptions[0] : null;
      });
    } catch (e) {
      // Handle error if necessary
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
          // Handle the selected option here
        });
      },
      items: dropdownOptions.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}
