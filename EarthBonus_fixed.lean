/-
  EarthBonus.lean
  Pure Lean 4 - no Mathlib needed
  Compiles with: lean EarthBonus.lean
-/

-- One orbit: Earth faces the sun N times
structure Orbit where
  solarDays : Nat

-- But relative to stars, one extra spin
def siderealSpins (o : Orbit) : Nat :=
  o.solarDays + 1

-- The core surprise, true by definition
theorem bonus_day (o : Orbit) : siderealSpins o = o.solarDays + 1 := rfl

-- Earth: 365 sunrises = 366 spins
def earth : Orbit := ⟨365⟩

-- 4-year leap cycle: 1461 sunrises = 1462 spins
def earthLeapCycle : Orbit := ⟨1461⟩

-- The 4 minute loan: 1436 = 24*60 - 4 is the real spin
-- 365 * 4 ≈ 1460 ≈ 24*60
def minutesPerDay : Nat := 24 * 60
def realSpinMinutes : Nat := 23 * 60 + 56  -- 1436, ignoring 4s
def dailyLoanMinutes : Nat := minutesPerDay - realSpinMinutes -- 4

theorem loan_is_four : dailyLoanMinutes = 4 := rfl

-- Checks - these will print when you build
#check bonus_day earth
#eval siderealSpins earth         -- 366
#eval siderealSpins earthLeapCycle -- 1462
#eval dailyLoanMinutes            -- 4

-- In words:
-- We lose 4 minutes per day to our orbit around the sun.
-- 365 * 4 min = 1460 min ≈ 24 hours.
-- After one orbit, you get it back. One bonus spin per year.
-- True in its own frame.
