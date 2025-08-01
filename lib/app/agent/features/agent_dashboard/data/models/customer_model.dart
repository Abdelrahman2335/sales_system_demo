import 'package:uuid/uuid.dart';

enum InterestLevel { hotLead, warm, notInterested }

extension InterestLevelText on InterestLevel {
  String get label {
    switch (this) {
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
class CustomerModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String city;
  final String region;
  final List<String> interestedProducts;
  InterestLevel interestLevel;
  final DateTime interactionDateTime;
  final String contactPlatform;

  CustomerModel({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.region,
    required this.interestedProducts,
    required this.interestLevel,
    required this.interactionDateTime,
    required this.contactPlatform,
    String? id,
  }) : id = id ?? _uuid.v6();

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as String?,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      interestedProducts: List<String>.from(json['interestedProducts'] ?? []),
      interestLevel: InterestLevel.values.firstWhere(
        (e) => e.toString() == 'InterestLevel.${json['interestLevel']}',
        orElse: () => InterestLevel.notInterested,
      ),
      interactionDateTime: DateTime.parse(json['interactionDateTime'] as String),
      contactPlatform: json['contactPlatform'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'city': city,
      'region': region,
      'interestedProducts': interestedProducts,
      'interestLevel': interestLevel.name,
      'interactionDateTime': interactionDateTime.toIso8601String(),
      'contactPlatform': contactPlatform,
    };
  }
}
