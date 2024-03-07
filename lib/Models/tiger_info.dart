class tiger_information {
  final int serialNumber;
  final String name;
  final String alternativeName;
  final String tigerCode;
  final int born;
  final String tigerReserve;
  final String zone;
  final String area;
  final String father;
  final String mother;
  final String siblings;
  final String details;
  final String imageLink;

  tiger_information({
    required this.serialNumber,
    required this.name,
    required this.alternativeName,
    required this.tigerCode,
    required this.born,
    required this.tigerReserve,
    required this.zone,
    required this.area,
    required this.father,
    required this.mother,
    required this.siblings,
    required this.details,
    required this.imageLink,
  });

  factory tiger_information.fromJson(Map<String, dynamic> json) {
    return tiger_information(
      serialNumber: json['S_No'] ?? 0,
      name: json['Name'] ?? 'NA',
      alternativeName: json['Alternative_Name'] ?? 'NA',
      tigerCode: json['Tiger_Code'] ?? 'NA',
      born: json['Born'] ?? 0,
      tigerReserve: json['Tiger_Reserve'] ?? 'NA',
      zone: json['Zone'] ?? 'NA',
      area: json['Area'] ?? 'NA',
      father: json['Father'] ?? 'NA',
      mother: json['Mother'] ?? 'NA',
      siblings: json['Siblings'] ?? 'NA',
      details: json['Details'] ?? 'NA',
      imageLink: json['Image_link'] ?? 'NA',
    );
  }
}
