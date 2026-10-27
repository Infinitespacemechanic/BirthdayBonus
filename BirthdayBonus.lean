/-
  BirthdayBonus.lean
  Pure Lean 4 - no Mathlib needed

  The Earth gives you a present every year.
  You spin 366 times but only count 365 days.
  The extra spin is automatic. It lands around your birthday.

  For Rob - born March 24th - right after the equinox,
  when the year balances its books.
-/

structure Year where
  solarDays : Nat -- sunrises you see

def siderealSpins (y : Year) : Nat := y.solarDays + 1

-- The gift: one extra spin per orbit, for free
theorem birthdayBonus (y : Year) : siderealSpins y = y.solarDays + 1 := rfl

-- Exact daily loan in seconds: 86400 - 86164 = 236 seconds = 3m 56s
def solarDaySec : Nat := 86400
def siderealDaySec : Nat := 86164 -- 23h56m4s
def dailyGiftSec : Nat := solarDaySec - siderealDaySec

def earthYear : Year := ⟨365⟩
def leapCycle : Year := ⟨1461⟩ -- 4 years, 365*3 + 366

-- The gift accumulates
def giftBank (y : Year) : Nat := y.solarDays * dailyGiftSec

theorem gift_is_236 : dailyGiftSec = 236 := rfl
theorem earth_gift_is_366 : siderealSpins earthYear = 366 := rfl
theorem leap_gift_is_1462 : siderealSpins leapCycle = 1462 := rfl

-- No one knows, but it's automatic, on your born-on date
-- March 24th: the equinox has passed, the bank pays out

#check birthdayBonus earthYear
#eval siderealSpins earthYear -- 366 spins for 365 days
#eval giftBank earthYear -- 86140 seconds banked
#eval dailyGiftSec -- 236 seconds per day, your daily present
