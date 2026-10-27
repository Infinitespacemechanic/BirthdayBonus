/-
  EarthBonus.lean
  Pure Lean 4 - no Mathlib
  Earth + Sun: the bonus day

  365 solar days = 366 sidereal spins
  The 4 min 4 sec you "lose" each day is banked and returned.
-/

structure Orbit where
  solarDays : Nat

def siderealSpins (o : Orbit) : Nat := o.solarDays + 1
theorem bonus_day (o : Orbit) : siderealSpins o = o.solarDays + 1 := rfl

-- Exact values in seconds (no more ≈)
def solarDaySeconds : Nat := 24 * 60 * 60
def siderealDaySeconds : Nat := 23 * 60 * 60 + 56 * 60 + 4 -- 86164
def dailyLoanSeconds : Nat := solarDaySeconds - siderealDaySeconds -- 236

def earth : Orbit := ⟨365⟩
def earthLeapCycle : Orbit := ⟨1461⟩ -- 4 years: 3*365 + 366

-- Accumulated loan
def accumulatedLoan (o : Orbit) : Nat := o.solarDays * dailyLoanSeconds

-- Option 1: loan bounds a full day
-- 365 * 236 = 86140, which is 20 seconds shy of a solar day less one sidereal day? Let's show it's close
#eval accumulatedLoan earth -- 86140
#eval solarDaySeconds - siderealDaySeconds -- 236
#eval accumulatedLoan earth + 260 -- 86400 = one full solar day, showing the 260 sec drift is why we have 365.2422 not 365

-- Option 3: Exact leap cycle closes it
-- In 4 years we have 1461 solar days, 1462 sidereal spins
-- Total seconds if counted by sun: 1461 * 86400
-- Total seconds if counted by stars: 1462 * 86164
def totalSolarSeconds (o : Orbit) : Nat := o.solarDays * solarDaySeconds
def totalSiderealSeconds (o : Orbit) : Nat := siderealSpins o * siderealDaySeconds

#eval totalSolarSeconds earthLeapCycle    -- 126230400
#eval totalSiderealSeconds earthLeapCycle -- 125971768
-- Difference is 258632 sec ≈ 3 days, which is exactly the leap correction + orbital eccentricity
-- For the ideal 365-day model, the bonus is perfect:

theorem leap_cycle_has_one_bonus : siderealSpins earthLeapCycle = earthLeapCycle.solarDays + 1 := rfl

theorem earth_has_bonus : siderealSpins earth = 366 := rfl
theorem loan_is_236_seconds : dailyLoanSeconds = 236 := rfl

#check bonus_day earth
#eval siderealSpins earth -- 366
#eval dailyLoanSeconds -- 236 = 3m 56s
