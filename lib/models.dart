enum InterestLevel {
  hotLead,
  warm,
  notInterested,
}


class Customer {
  final String fullName;
  final String phoneNumber;
  final String city;
  final String region;
  final List<String> productsInterested;
  final InterestLevel interestLevel; 
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
  });

}

