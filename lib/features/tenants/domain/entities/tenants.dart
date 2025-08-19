class Tenant {
  final String id;
  final String name;
  final String? tel;
  final String? nationalId;
  final String? roomId;
  final double monthlyRent;
  final DateTime createdAt;
  final String? roomType;
  final DateTime? lastPaymentDate;

  const Tenant({
    required this.id,
    required this.name,
    this.tel,
    this.nationalId,
    this.roomId,
    required this.monthlyRent,
    required this.createdAt,
    this.roomType,
    this.lastPaymentDate,
  });

  Tenant copyWith({
    String? id,
    String? name,
    String? tel,
    String? nationalId,
    String? roomId,
    double? monthlyRent,
    DateTime? createdAt,
    String? roomType,
    DateTime? lastPaymentDate,
  }) {
    return Tenant(
      id: id ?? this.id,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      nationalId: nationalId ?? this.nationalId,
      roomId: roomId ?? this.roomId,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      createdAt: createdAt ?? this.createdAt,
      roomType: roomType ?? this.roomType,
      lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
    );
  }
}
