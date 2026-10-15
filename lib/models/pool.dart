class Pool {
  final String name;
  final String creator;
  final String day;
  final String month;
  final bool isGrid;
  final String drawsWon;
  final String amount;
  final String lotAmount;
  final String poolType;
  final String members;
  final String slotCount;
  final String footerText;
  final String startedOn;
  final String validTill;

  const Pool({
    required this.name,
    required this.creator,
    required this.day,
    required this.month,
    this.isGrid = false,
    required this.drawsWon,
    required this.amount,
    required this.lotAmount,
    required this.poolType,
    required this.members,
    required this.slotCount,
    required this.footerText,
    required this.startedOn,
    required this.validTill,
  });
}