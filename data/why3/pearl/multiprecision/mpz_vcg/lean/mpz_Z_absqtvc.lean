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
namespace mpz_Z_absqtvc
axiom mpz_ptr : Type
axiom inhabited_axiom_mpz_ptr : Inhabited mpz_ptr
attribute [instance] inhabited_axiom_mpz_ptr
axiom mpz_eq : mpz_ptr -> mpz_ptr -> Prop
axiom mpz_eq'spec (x : mpz_ptr) (y : mpz_ptr) : mpz_eq x y = (x = y)
axiom mpz_memo : Type
axiom inhabited_axiom_mpz_memo : Inhabited mpz_memo
attribute [instance] inhabited_axiom_mpz_memo
axiom abs_value_of : mpz_memo -> mpz_ptr -> ℤ
axiom alloc : mpz_memo -> mpz_ptr -> ℤ
axiom abs_size : mpz_memo -> mpz_ptr -> ℤ
axiom sgn : mpz_memo -> mpz_ptr -> ℤ
axiom readers : mpz_memo -> mpz_ptr -> ℤ
axiom zones : mpz_memo -> mpz_ptr -> C.zone
axiom mpz_memo'invariant (self : mpz_memo) (p : mpz_ptr) : (0 : ℤ) ≤ alloc self p ∧ (sgn self p = (1 : ℤ) ∨ sgn self p = -(1 : ℤ)) ∧ abs_size self p ≤ alloc self p ∧ (0 : ℤ) ≤ abs_size self p ∧ abs_size self p ≤ (2147483647 : ℤ) ∧ (0 : ℤ) ≤ abs_value_of self p ∧ ((1 : ℤ) ≤ abs_size self p → HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p - (1 : ℤ))) ≤ abs_value_of self p) ∧ abs_value_of self p < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p))
noncomputable def value_of (x : mpz_ptr) (memo : mpz_memo) := sgn memo x * abs_value_of memo x
noncomputable def sgn_value (p : C.ptr (BitVec 64)) (sz : BitVec 32) := if (0 : ℤ) ≤ BitVec.toInt sz then Lemmas.value p (BitVec.toInt sz) else -Lemmas.value p (-BitVec.toInt sz)
noncomputable def mpz_unchanged (x : mpz_ptr) (memo1 : mpz_memo) (memo2 : mpz_memo) := readers memo1 x = readers memo2 x ∧ (-(2 : ℤ) < readers memo1 x → abs_value_of memo1 x = abs_value_of memo2 x ∧ alloc memo1 x = alloc memo2 x ∧ abs_size memo1 x = abs_size memo2 x ∧ sgn memo1 x = sgn memo2 x ∧ zones memo1 x = zones memo2 x)
theorem abs'vc (x : BitVec 32) (fact0 : -(2147483648 : ℤ) < BitVec.toInt x) : (¬(0 : ℤ) ≤ BitVec.toInt x → int'32_in_bounds (-BitVec.toInt x)) ∧ (∀(result : BitVec 32), (if (0 : ℤ) ≤ BitVec.toInt x then result = x else BitVec.toInt result = -BitVec.toInt x) → BitVec.toInt result = abs (BitVec.toInt x))
  := sorry
end mpz_Z_absqtvc
