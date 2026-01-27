import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
open Classical
open Lean4Why3
namespace mccarthy_McCarthy91Mach_f91_nonrecqtvc
noncomputable def spec (x : ℤ) := if x ≤ (100 : ℤ) then (91 : ℤ) else x - (10 : ℤ)
axiom spec_closure : ℤ -> ℤ
axiom spec_closure_def (y : ℤ) : spec_closure y = spec y
theorem f91_nonrec'vc (n0 : BitVec 63) : (0 : ℤ) ≤ Int.ofNat (1 : ℕ) ∧ Iter.iter spec_closure (Int.ofNat (1 : ℕ)) (BitVec.toInt n0) = spec (BitVec.toInt n0) ∧ (∀(n : BitVec 63) (e : ℕ), (0 : ℤ) ≤ Int.ofNat e ∧ Iter.iter spec_closure (Int.ofNat e) (BitVec.toInt n) = spec (BitVec.toInt n0) → (if (0 : ℕ) < e then if (100 : ℤ) < BitVec.toInt n then int'63_in_bounds (BitVec.toInt n - (10 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt n - (10 : ℤ) → (∀(o2 : ℕ), Int.ofNat o2 = Int.ofNat e - (1 : ℤ) → ((0 : ℤ) ≤ (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e ∧ (101 : ℤ) - BitVec.toInt o1 + (10 : ℤ) * Int.ofNat o2 < (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e ∨ (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e = (101 : ℤ) - BitVec.toInt o1 + (10 : ℤ) * Int.ofNat o2 ∧ (0 : ℤ) ≤ Int.ofNat e ∧ o2 < e) ∧ (0 : ℤ) ≤ Int.ofNat o2 ∧ Iter.iter spec_closure (Int.ofNat o2) (BitVec.toInt o1) = spec (BitVec.toInt n0))) else int'63_in_bounds (BitVec.toInt n + (11 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt n + (11 : ℤ) → (∀(o2 : ℕ), Int.ofNat o2 = Int.ofNat e + (1 : ℤ) → ((0 : ℤ) ≤ (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e ∧ (101 : ℤ) - BitVec.toInt o1 + (10 : ℤ) * Int.ofNat o2 < (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e ∨ (101 : ℤ) - BitVec.toInt n + (10 : ℤ) * Int.ofNat e = (101 : ℤ) - BitVec.toInt o1 + (10 : ℤ) * Int.ofNat o2 ∧ (0 : ℤ) ≤ Int.ofNat e ∧ o2 < e) ∧ (0 : ℤ) ≤ Int.ofNat o2 ∧ Iter.iter spec_closure (Int.ofNat o2) (BitVec.toInt o1) = spec (BitVec.toInt n0))) else BitVec.toInt n = spec (BitVec.toInt n0)))
  := sorry
end mccarthy_McCarthy91Mach_f91_nonrecqtvc
