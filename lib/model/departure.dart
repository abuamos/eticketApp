class DepartureDropdownOption {
  final String value;

  DepartureDropdownOption(this.value);

  factory DepartureDropdownOption.fromJson(Map<String, dynamic> json) {
    return DepartureDropdownOption(json['value']);
  }
}
