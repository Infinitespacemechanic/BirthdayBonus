# BirthdayBonus

> Earth gives you a present every year and you don't have to do anything for it.

You spin **366** times but you only count **365** days. The extra spin is automatic. It lands around your birthday.

Pure Lean 4. No Mathlib. Compiles clean.

### The surprise hiding in plain sight

A solar day is how long it takes to face the sun again: 24h.
A sidereal day is how long it takes to face the same star again: 23h 56m 4s.

The difference is 236 seconds per day — about 3 minutes 56 seconds.

We "lose" it because we're also orbiting the sun. We have to spin a little extra each day to bring the sun back.

365 days × 236 seconds = 86,140 seconds banked.

After one orbit, it pays out as one full extra spin.

```
solar_days + 1 = sidereal_rotations
365 + 1 = 366
```

### The Lean4 proof

The whole thing is true by definition in Lean. That's the joke.

```lean
structure Year where
  solarDays : Nat

def siderealSpins (y : Year) : Nat := y.solarDays + 1

theorem birthdayBonus (y : Year) : siderealSpins y = y.solarDays + 1 := rfl

def earthYear : Year := ⟨365⟩
#eval siderealSpins earthYear -- 366
```

`rfl` means reflexive — Lean sees it's true by definition. No axioms, no astronomy needed.

See `BirthdayBonus.lean` for the full minimal file.

### Why March 24th?

I was born March 24th, right after the spring equinox when the year balances its books. That's when the banked time comes back.

Everyone gets this gift on their born-on date. One extra spin per orbit, automatic.

### Does 8,8,8 work on Mars?

Yes.

Earth: 365 solar days, 366 spins.
Mars: 668 sols, 669 spins.

Both have `N + 1`. The structure is the same. So an 8/8/8 split that lives in the solar frame works on both planets. We spin about the same.

### How to run

```bash
lean BirthdayBonus.lean
```

You should see:
```
366
86140
236
```

No Mathlib needed. Pure Lean 4.

### Files

- `BirthdayBonus.lean` - final version, named gift, exact seconds (236s)
- `EarthBonus_fixed.lean` - earlier minimal version with minutes
- `EarthBonus.lean` - original sketch

---

True in its own frame.
