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
  });


  factory TigerReserve.fromJson(Map<String, dynamic> json) {
    return TigerReserve(
      slNo: json['SlNo'] as int? ?? 0,
      // Handle null for integer fields as well
      tigerReserve: json['TigerReserve'] as String? ?? '',
      // Default to empty string if null
      tigerCount2023: json['TigerCount_2023'] as int,
      ecotourismResorts: json['EcotourismResorts'] as String? ?? '',
      // Default to empty string if null
      paNotificationYear: json['PANotificationYear'] as String?,
      // No default value for nullable fields
      state: json['State'] as String? ?? '',
      // Default to empty string if null
      TRNotificationYear: json['TRNotificationYear'] as int? ?? 0,
      // Handle null for integer fields as well
      coreAreaSqkm: json['CoreArea_sqkm'] as double,
      bufferAreaSqkm: json['BufferArea_sqkm'] as double,
      totalAreaSqkm: json['TotalArea_sqkm'] as double,
    );
  }
}
