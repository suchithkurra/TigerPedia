class TigerReserve {
  final int slNo;
  final String tigerReserve;
  final int tigerCount2023;
  final String ecotourismResorts;
  final String? paNotificationYear;
  final String state;
  final int TRNotificationYear;
  final double coreAreaSqkm;
  final double bufferAreaSqkm;
  final double totalAreaSqkm;
  final String reserve_website;
  final String reserve_image;
  final String ecotourism_link;
  final String filterProperty;
  final String reserve_image2;
  final String reserve_image3;

  TigerReserve({
    required this.slNo,
    required this.tigerReserve,
    required this.tigerCount2023,
    required this.ecotourismResorts,
    required this.paNotificationYear,
    required this.state,
    required this.TRNotificationYear,
    required this.coreAreaSqkm,
    required this.bufferAreaSqkm,
    required this.totalAreaSqkm,
    required  this.reserve_website,
    required this.reserve_image,
    required this.ecotourism_link,
    required this.filterProperty,
    required this.reserve_image2,
    required this.reserve_image3,
  });


  factory TigerReserve.fromJson(Map<String, dynamic> json) {
    return TigerReserve(
      slNo: json['SlNo'] as int? ?? 0,
      tigerReserve: json['TigerReserve'] as String? ?? '',
      tigerCount2023: json['TigerCount_2023'] as int? ?? 0,
      ecotourismResorts: json['EcotourismResorts'] as String? ?? '',
      paNotificationYear: json['PANotificationYear'] as String?,
      state: json['State'] as String? ?? '',
      TRNotificationYear: json['TRNotificationYear'] as int? ?? 0,
      coreAreaSqkm: json['CoreArea_sqkm'] as double? ?? 0.0,
      bufferAreaSqkm: json['BufferArea_sqkm'] as double? ?? 0.0,
      totalAreaSqkm: json['TotalArea_sqkm'] as double? ?? 0.0,
      reserve_website: json['website_link'] as String? ?? '',
      reserve_image: json['image_link'] as String? ?? '',
      ecotourism_link: json['ecotourismlink'] as String? ?? '',
      filterProperty: json['FilterProperty'] as String? ?? '',
      reserve_image2: json['image_link2'] as String? ?? '',
      reserve_image3: json['image_link3'] as String? ?? '',
    );
  }
}