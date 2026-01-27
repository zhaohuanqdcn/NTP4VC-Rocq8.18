import Why3.Base
import Why3.why3.WellFounded.WellFounded
import pearl.queens_bv_vcg.lean.queens_bv.S
open Classical
open Lean4Why3
namespace queens_bv_Bits_belowqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom bv : t -> BitVec 32
axiom mdl : t -> Finset ℤ
axiom t'invariant (i : ℤ) (self : t) : (((0 : ℤ) ≤ i ∧ i < (32 : ℤ)) ∧ (bv self)[Int.toNat i]! = true) = (i ∈ mdl self)
noncomputable def t'eq (a : t) (b : t) := bv a = bv b ∧ mdl a = mdl b
axiom t'inj (a : t) (b : t) (fact0 : t'eq a b) : a = b
theorem below'vc (n : BitVec 32) (fact0 : n ≤ (32 : BitVec 32)) : let o1 : Finset ℤ := Finset.Ico (0 : ℤ) (BitVec.toUInt n); let o2 : BitVec 32 := ~~~((4294967295 : BitVec 32) <<< BitVec.toNat n); (∀(i : ℤ), (((0 : ℤ) ≤ i ∧ i < (32 : ℤ)) ∧ o2[Int.toNat i]! = true) = (i ∈ o1)) ∧ (∀(result : t), bv result = o2 ∧ mdl result = o1 → mdl result = Finset.Ico (0 : ℤ) (BitVec.toUInt n))
  := sorry
end queens_bv_Bits_belowqtvc
