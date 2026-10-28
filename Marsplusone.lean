-- Define a structure for an individual Mass on a planet
structure Mass where
  id : Nat
  -- The phase offset (e.g., longitude) unique to this atom
  phaseOffsetDegrees : Nat 

-- Define a Planet that contains a year length and a collection of masses
structure Planet where
  solarDays : Nat
  masses : List Mass

-- The universal geometric law: sidereal rotations is always solar days + 1
def siderealSpins (p : Planet) : Nat := 
  p.solarDays + 1

-- Theorem: For every individual mass 'm' on a planet 'p', 
-- its total sidereal rotation payout is equivalent and true by definition.
theorem birthdayBonusForEachMass (p : Planet) (m : Mass) (h : m ∈ p.masses) : 
    siderealSpins p = p.solarDays + 1 := 
  rfl -- True by reflexivity (definition). Complete equivalence across all masses.

--- Example Execution ---

-- 1. Create two distinct masses with different longitudinal phases
def massA : Mass := ⟨1, 0⟩    -- Mass A at 0° longitude
def massB : Mass := ⟨2, 74⟩   -- Mass B at 74° longitude (e.g., New York offset)

-- 2. Define Earth with its 365 calendar days and its unique atoms
def earth : Planet := {
  solarDays := 365,
  masses := [massA, massB]
}

-- Evaluate the universal payout for Earth
#eval siderealSpins earth -- Outputs: 366

