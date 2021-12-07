class Contact {
  final int id;
  final String fullName;
  final int? accountNumber;

  Contact(
    this.id,
    this.fullName,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Contact{Id: $id, FullName: $fullName, AccountNumber: $accountNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        fullName = json["fullName"] ?? "",
        accountNumber = json["accountNumber"];

  Map<String, dynamic> toJson() => {
        "name": fullName,
        "accountNumber": accountNumber,
      };
}
