import 'package:tigerapp/Models/reserve_data.dart';

class reservefiltercontroller {
  static List<TigerReserve> filterByState(List<TigerReserve> reserves, String state) {
    if (state.isNotEmpty) {
      return reserves.where((reserve) =>
      reserve.state.toLowerCase() == state.toLowerCase()
      ).toList();
    } else {
      // No state selected, return all reserves
      return reserves;
    }
  }
}
