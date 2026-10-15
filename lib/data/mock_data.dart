import '../models/member.dart';
import '../models/pool.dart';

// Local sample data (no backend needed for this task).

const Pool bikePool = Pool(
  name: 'Bike Pool',
  creator: 'Zuha',
  day: '02',
  month: 'OCT',
  drawsWon: '0/12',
  amount: '\$ 3,000',
  lotAmount: '\$ 12,000',
  poolType: 'Normal',
  members: '14',
  slotCount: '12',
  footerText: '05 days till the draw',
  startedOn: 'Sept 02, 2025',
  validTill: 'Sept 02, 2026',
);

const Pool homePool = Pool(
  name: 'Home Pool',
  creator: 'Zuha',
  day: '--',
  month: 'OCT',
  drawsWon: '0/12',
  amount: '\$ 3,000',
  lotAmount: '\$ 12,000',
  poolType: 'Normal',
  members: '14',
  slotCount: '12',
  footerText: 'Awaiting for invitees to join',
  startedOn: 'Sept 02, 2025',
  validTill: 'Sept 02, 2026',
);

const List<Pool> managedPools = [bikePool, homePool];
const List<Pool> joinedPools = [bikePool];

const List<Member> pendingMembers = [
  Member(name: 'Vidhun', phone: '+91 9495959798', amount: '₹ 1,500'),
  Member(name: 'Nauman', phone: '+91 9495959798', amount: '₹ 1,500'),
  Member(name: 'Nihala', phone: '+91 9495959798', amount: '₹ 1,500'),
  Member(name: 'Zuha', phone: '+91 9495959798', amount: '₹ 1,500'),
];

const List<Member> paidMembers = [
  Member(
    name: 'Rijas',
    phone: '+91 9495959798',
    amount: '₹ 3,000',
    date: 'Oct 01, 2025',
    slot: 'Full slot',
  ),
];

const List<Member> winners = [
  Member(
    name: 'Vidhun',
    phone: '+91 9495959798',
    date: 'Oct 03, 2025',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nauman',
    phone: '+91 9495959798',
    date: 'Oct 03, 2025',
    slot: 'Half slot',
  ),
  Member(
    name: 'Rijas',
    phone: '+91 9495959798',
    date: 'Sep 03, 2025',
    slot: 'Full slot',
  ),
];

const List<Member> allMembers = [
  Member(
    name: 'Rijas',
    phone: '+91 9495959798',
    amount: '₹ 1,000',
    role: 'Pool Manager',
    slot: 'Full slot',
  ),
  Member(name: 'Zuha', phone: '+91 9495959798'),
  Member(name: 'Nauman', phone: '+91 9495959798'),
  Member(name: 'Vidhun', phone: '+91 9495959798'),
  Member(name: 'Nihala', phone: '+91 9495959798'),
];
