import '../models/member.dart';
import '../models/pool.dart';

const Pool bikePool = Pool(
  name: 'Bike Pool',
  creator: 'Zuha',
  day: '02',
  month: 'OCT',
  isGrid: false,
  drawsWon: '0/12',
  amount: '\$ 3,000',
  lotAmount: '\$ 12,000',
  poolType: 'Normal',
  members: '14',
  slotCount: '12',
  footerText: '08 days till the draw',
  startedOn: 'Sept 02, 2025',
  validTill: 'Sept 02, 2026',
);

const Pool homePool = Pool(
  name: 'Home Pool',
  creator: 'Zuha',
  day: '',
  month: '',
  isGrid: true,
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
  Member(
    name: 'Vidhun',
    phone: '+91 9495969798',
    amount: '₹ 1,500',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nouman',
    phone: '+91 9495969798',
    amount: '₹ 1,500',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nihala',
    phone: '+91 9495969798',
    amount: '₹ 1,500',
    slot: 'Half slot',
  ),
  Member(
    name: 'Zuha',
    phone: '+91 9495969798',
    amount: '₹ 1,500',
    slot: 'Half slot',
  ),
];

const List<Member> paidMembers = [
  Member(
    name: 'Rijas',
    phone: '+91 9495969798',
    amount: '₹ 3,000',
    date: 'Oct 01, 2025',
    slot: 'Full slot',
  ),
];

const List<Member> winners = [
  Member(
    name: 'Vidhun',
    phone: '+91 9495969798',
    date: 'Oct 05, 2025',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nouman',
    phone: '+91 9495969798',
    date: 'Oct 05, 2025',
    slot: 'Half slot',
  ),
  Member(
    name: 'Rijas',
    phone: '+91 9495969798',
    date: 'Sept 05, 2025',
    slot: 'Full slot',
  ),
];

const List<Member> allMembers = [
  Member(
    name: 'Rijas',
    phone: '+91 9495969798',
    amount: '₹ 3,000',
    role: 'Pool Manager',
    date: 'Oct 01, 2025',
    slot: 'Full slot',
  ),
  Member(
    name: 'Zuha',
    phone: '+91 9495969798',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nouman',
    phone: '+91 9495969798',
    slot: 'Half slot',
  ),
  Member(
    name: 'Vidhun',
    phone: '+91 9495969798',
    slot: 'Half slot',
  ),
  Member(
    name: 'Nihala',
    phone: '+91 9495969798',
    slot: 'Half slot',
  ),
];
