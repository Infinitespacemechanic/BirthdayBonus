/-
  EarthBonus.lean
  The bonus day hiding in plain sight

  Earth spins 366.25 times but we only get 365.25 days.
  The 4 minute difference per day banks into 24 hours per year.
-/

-- One orbit = one full trip around the sun = 2π of orbital angle
-- In that time, Earth faces the sun N times (solar days)
-- But relative to the stars, it has turned N + 1 times

structure Orbit where
  solarDays : Nat  -- days counted by sunrises

def siderealSpins (o : Orbit) : Nat :=
  o.solarDays + 1

-- The core surprise: one extra spin per year
theorem bonus_day (o : Orbit) : siderealSpins o = o.solarDays + 1 := rfl

-- The daily loan: 24h / 365.25 ≈ 3m 56s
-- After 365.25 days, it sums to exactly 24h
theorem daily_loan_sums_to_day :
  365.25 * (24 * 60 / 365.25) = 24 * 60 := by
  -- Lean knows 365.25 ≠ 0, so the 365.25 cancels
  have h : (365.25 : ℝ) ≠ 0 := by norm_num
  field_simp

-- Earth instance
def earth : Orbit := ⟨365⟩  -- 365 full days, .25 handled by leap year
def earthLeapCycle : Orbit := ⟨1461⟩ -- 4 years: 365*3 + 366 = 1461 solar days

#check bonus_day earth
#eval siderealSpins earth -- 366 : one bonus spin per year
#eval siderealSpins earthLeapCycle -- 1462 : one bonus spin per 4-year cycle

-- In words: The 4 minutes we "lose" each day is not lost.
-- It is stored in our orbit. After one orbit, it returns as 24 hours.
-- True in its own frame.
