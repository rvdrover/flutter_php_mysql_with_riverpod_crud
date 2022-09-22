class PersonalModal {
  String? id;
  String? firstname;
  String? lastname;
  PersonalModal({
    this.id,
    this.firstname,
    this.lastname,
  });

  factory PersonalModal.fromJson(Map<String, dynamic> json) {
    return PersonalModal(
      id: json['id'] as String,
      firstname: json['first_name'] as String,
      lastname: json['last_name'] as String,
    );
  }
}
