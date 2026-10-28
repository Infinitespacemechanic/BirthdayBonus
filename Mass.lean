structure Mass where
  id : Nat
  phaseOffsetDegrees : Nat 

structure Planet where
  name : String
  solarDays : Nat
  masses : List Mass

def massSiderealSpins (p : Planet) (_m : Mass) : Nat :=
  p.solarDays + 1

-- Prefixing m and h with underscores silences the unused variable linter!
theorem universalBirthdayBonus (p : Planet) (_m : Mass) (_h : _m ∈ p.masses) : 
    massSiderealSpins p _m = p.solarDays + 1 := 
  rfl 

--- Multi-Planetary Execution ---

def earthMassA : Mass := ⟨1, 0⟩
def earthMassB : Mass := ⟨2, 74⟩

def marsMassA  : Mass := ⟨3, 120⟩
def marsMassB  : Mass := ⟨4, 240⟩

def earth : Planet := {
  name := "Earth",
  solarDays := 365,
  masses := [earthMassA, earthMassB]
}

def mars : Planet := {
  name := "Mars",
  solarDays := 668,
  masses := [marsMassA, marsMassB]
}

#eval massSiderealSpins earth earthMassB -- Outputs: 366
#eval massSiderealSpins mars marsMassA   -- Outputs: 669
