import 'package:uuid/uuid.dart';

enum InterestLevel {
  hotLead,
  warm,
  notInterested,
}

extension InterestLevelText on InterestLevel {
  String get label {
    switch (this){
      case InterestLevel.hotLead:
        return 'Hot Lead';
      case InterestLevel.warm:
        return 'Warm';
      case InterestLevel.notInterested:
        return 'Not Interested';
    }
  }
}
 final Uuid _uuid = Uuid();
class Customer {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String city;
  final String region;
  final List<String> productsInterested;
   InterestLevel interestLevel;
  final DateTime interactionDateTime;
  final String contactPlatform;

  Customer({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.region,
    required this.productsInterested,
    required this.interestLevel,
    required this.interactionDateTime,
    required this.contactPlatform,
  }) : id = _uuid.v6();

}

