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
  final String imageLink2;
  final String imageLink3;
  final String tiger_youtube_id;

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
    required this.imageLink2,
    required this.imageLink3,
    required this.tiger_youtube_id
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
      imageLink2: json['imagelink_2'] ?? 'NA',
      imageLink3: json['imagelink_3'] ?? 'NA',
      tiger_youtube_id: json['youtube_id'] ?? 'NA',
    );
  }
}
