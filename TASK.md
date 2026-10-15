# Finlot Execution Board (GSD + Ralph Loop Tracker)

> **Source of Truth**: 8 Reference Screenshots in `finlot_reference/`  
> **Methodology**: GSD Phase Execution + Ralph Loop Context Hygiene + Ponytail (Strict YAGNI)

---

## 📋 Phase 2 Visual Mismatch Checklist

### 1. Splash Screen (`Spash.png`)
- [ ] Replace plain text with branded `finlot` logo asset (`assets/images/finlot_logo.png`).
- [ ] Match background gradient: soft pale lime radial at top fading to clean white.

### 2. Onboarding Screens (`Onboarding01.png`, `Onboarding02.png`, `Onboarding03.png`)
- [ ] Replace `Icons.person_outline` placeholder with original lady illustrations:
  - Screen 1: `assets/images/lady_onboarding_1.png` (holding phone)
  - Screen 2: `assets/images/lady_onboarding_2.png` (pointing right)
  - Screen 3: `assets/images/lady_onboarding_3.png` (hands raised / open hands)
- [ ] Replace generic feature card icons with original lady circular avatars (`assets/images/ob_feature_avatar_1.png`, `assets/images/ob_feature_avatar_2.png`).
- [ ] Fix phone frame dimensions, inner lime-tinted background, and logo header.
- [ ] Match segmented top progress bar (dark charcoal active `#2B2D2F`, white inactive).
- [ ] Typography & CTA: Bold title (24-26px), grey subtitle, 54px black pill "Continue" button.

### 3. Home Screen (`Home.png`)
- [ ] Header: Top-left Vidhun avatar in peach squircle (`assets/images/avatar_home_top.png`) + lime squircle notification bell.
- [ ] Greeting: Two-line greeting "Glad you're here,\n**Vidhun**".
- [ ] Upcoming Draw Banner: Original lady illustration (`assets/images/lady_home.png`) on the right with arms crossed, "Upcoming Draw" lime pill, hourglass message with bold "Bike Pool", "View Pool" button with black circular arrow pill (`↗`).
- [ ] Toggle Tab: "Manage Pool" (pink active `#FF5C8A` with hexagon icon) & "Joined Pool" + "View all" link.
- [ ] Bike Pool Card: Spiral calendar badge "02 OCT", creator chip, 3 custom stat items (Draws won, Amount, Lot Amount), pill action button "08 days till the draw" with green circle arrow button (`↗`).
- [ ] Home Pool Card: 3x3 dot matrix grid calendar badge, "Awaiting for invitees to join" action button.
- [ ] Floating Bottom Navigation Bar: Floating pill dock with 3 circular buttons (Transfer arrows, Lime Home, Profile).

### 4. Pool Details — Transactions (`Pool inner transaction.png`)
- [ ] Top App Bar: Lime back button with chevron `<` + centered `finlot` logo.
- [ ] Header Card: 2-row stats container (Draws won, Amount, Lot Amount / Pool Type, Members, Slot Count), validity date subtitle.
- [ ] Pill Tab Bar: 3 tabs with active pink pill (Transactions with bookmark icon, Winners, Members).
- [ ] Month Selector: Calendar icon + "September 2025 ⌄".
- [ ] Section Badges: "Pending (8/10)" and "Paid (2/10)" lime badges with wallet icons.
- [ ] Member Transactions: Real avatars (`avatar_vidhun.png`, `avatar_nouman.png`, `avatar_nihala.png`, `avatar_zuha.png`, `avatar_rijas.png`), pink outlined "Half slot" tags, white rounded "Mark Recieved" button with checkmark icon.

### 5. Pool Details — Winners (`Pool inner winners.png`)
- [ ] Featured Winner Card: Lime background, "Zuha & Nihala just won!", "November Winner", circular avatars for Zuha & Nihala, left and right crowd doodles (`assets/images/crowd_left.png`, `assets/images/crowd_right.png`).
- [ ] Past Winners List: Vidhun, Nouman, Rijas with real avatars, green trophy date badges ("Oct 05, 2025", "Sept 05, 2025"), and pink slot tags.

### 6. Pool Details — Members (`Pool inner members.png`)
- [ ] Header Card: Black circular edit button with pencil icon on top-right.
- [ ] Member Cards: Individual rounded white cards for each member (Rijas, Zuha, Nouman, Vidhun, Nihala) with real avatars, phone numbers, green "Accepted" pill badges with checkmark, and pink slot tags.

---

## 🚀 Execution & Verification
- [ ] Phase 3: Implement UI updates across all screens.
- [ ] Phase 4: Visually verify rendered screens against reference images.
- [ ] Phase 5: Implement 2-3s native logo splash intro animation.
- [ ] Phase 6: Run verification suite (`flutter analyze`, `flutter test`, `flutter build apk --release`).
