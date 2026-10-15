class Member {
  final String name;
  final String phone;
  final String amount;
  final String date;
  final String slot;
  final String? role;

  const Member({
    required this.name,
    required this.phone,
    this.amount = '',
    this.date = '',
    this.slot = 'Half slot',
    this.role,
  });
}