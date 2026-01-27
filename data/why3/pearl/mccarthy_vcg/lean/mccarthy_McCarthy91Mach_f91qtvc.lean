import Why3.Base
open Classical
open Lean4Why3
namespace mccarthy_McCarthy91Mach_f91qtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
theorem f91'vc (n : BitVec 63) : (if BitVec.toInt n ≤ (100 : ℤ) then int'63_in_bounds (BitVec.toInt n + (11 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt n + (11 : ℤ) → ((0 : ℤ) ≤ (101 : ℤ) - BitVec.toInt n ∧ (101 : ℤ) - BitVec.toInt o1 < (101 : ℤ) - BitVec.toInt n) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = spec (BitVec.toInt o1) → (0 : ℤ) ≤ (101 : ℤ) - BitVec.toInt n ∧ (101 : ℤ) - BitVec.toInt o2 < (101 : ℤ) - BitVec.toInt n)) else int'63_in_bounds (BitVec.toInt n - (10 : ℤ))) ∧ (∀(result : BitVec 63), (if BitVec.toInt n ≤ (100 : ℤ) then ∃(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt n + (11 : ℤ) ∧ (∃(o2 : BitVec 63), BitVec.toInt o2 = spec (BitVec.toInt o1) ∧ BitVec.toInt result = spec (BitVec.toInt o2)) else BitVec.toInt result = BitVec.toInt n - (10 : ℤ)) → BitVec.toInt result = spec (BitVec.toInt n))
  := sorry
end mccarthy_McCarthy91Mach_f91qtvc
