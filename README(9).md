# BirthdayBonus — For Each Mass

> Earth gives every atom a present every year. You don't have to do anything for it.

You spin **366** times but you only count **365** days. The extra spin is automatic. It lands around your birthday.

Pure Lean 4. No Mathlib. Compiles clean.

### The surprise hiding in plain sight

A solar day is how long it takes to face the sun again: 24h.
A sidereal day is how long it takes to face the same star again: 23h 56m 4s.

The difference is 236 seconds per day — about 3m 56s.

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

### For Every Atom — The Bigger Picture

This is bigger than most think.

It's not one bonus for one planet. It's a bonus for **every atom** on it.

Earth doesn't have one sunrise. It has billions of sunrises happening every second as atoms rotate into the sun. No two atoms on the surface are born at the same time — one is just a fraction of a degree ahead, so its solar day starts a fraction of a second earlier.

Nothing is born at the same time. Every mass has its own paradox, its own phase, its own birthday moment.

And yet they all obey the same law:

```
For every mass m on Earth, sidereal(m) = solar(m) + 1
```

This is complete relativity and equivalence in one simple spin:

*   **Relativity:** There is no single "day." There is only the day measured in a frame. Solar frame (sun) vs. sidereal frame (stars) — both are valid, and they differ by exactly one. You have to pick a frame to count.
*   **Equivalence:** Every atom, every mass, no matter where it sits, gets the same N+1. Heavy or light, iron or air, all masses fall through the same bonus. The gift is equivalent for all.

One spin shows both principles. No tensors needed. Just `+1`.

True in its own frame. True for each mass.

### How to run

```
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
True in its own frame. For each mass.
