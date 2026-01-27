import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
open Classical
open Lean4Why3
namespace mpz_Z_mpz_memoqtvc
axiom mpz_ptr : Type
axiom inhabited_axiom_mpz_ptr : Inhabited mpz_ptr
attribute [instance] inhabited_axiom_mpz_ptr
axiom mpz_eq : mpz_ptr -> mpz_ptr -> Prop
axiom mpz_eq'spec (x : mpz_ptr) (y : mpz_ptr) : mpz_eq x y = (x = y)
axiom o1 : mpz_ptr -> ℤ
axiom o2 : mpz_ptr -> ℤ
axiom o3 : mpz_ptr -> ℤ
axiom o4 : mpz_ptr -> ℤ
axiom o'def (x : mpz_ptr) : o1 x = (1 : ℤ)
axiom o'def1 (x : mpz_ptr) : o2 x = (0 : ℤ)
axiom o'def2 (x : mpz_ptr) : o3 x = (0 : ℤ)
axiom o'def3 (x : mpz_ptr) : o4 x = (0 : ℤ)
theorem mpz_memo'vc : let o5 : mpz_ptr -> ℤ := o1; let o6 : mpz_ptr -> ℤ := o2; let o7 : mpz_ptr -> ℤ := o3; let o8 : mpz_ptr -> ℤ := o4; ∀(p : mpz_ptr), (0 : ℤ) ≤ o7 p ∧ (o5 p = (1 : ℤ) ∨ o5 p = -(1 : ℤ)) ∧ o6 p ≤ o7 p ∧ ((0 : ℤ) ≤ o6 p ∧ o6 p ≤ (2147483647 : ℤ)) ∧ (0 : ℤ) ≤ o8 p ∧ ((1 : ℤ) ≤ o6 p → HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (o6 p - (1 : ℤ))) ≤ o8 p) ∧ o8 p < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (o6 p))
  := sorry
end mpz_Z_mpz_memoqtvc
