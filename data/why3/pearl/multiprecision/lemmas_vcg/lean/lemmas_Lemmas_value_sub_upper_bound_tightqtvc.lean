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
open Classical
open Lean4Why3
namespace lemmas_Lemmas_value_sub_upper_bound_tightqtvc
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
axiom value_sub : (ℤ -> BitVec 64) -> ℤ -> ℤ -> ℤ
axiom value_sub'def (n : ℤ) (m : ℤ) (x : ℤ -> BitVec 64) : if n < m then value_sub x n m = BitVec.toUInt (x n) + ((18446744073709551615 : ℤ) + (1 : ℤ)) * value_sub x (n + (1 : ℤ)) m else value_sub x n m = (0 : ℤ)
theorem value_sub_upper_bound_tight'vc (x1 : ℤ) (x2 : ℤ) (x : ℤ -> BitVec 64) (fact0 : x1 < x2) : value_sub x x1 x2 < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (x2 - x1 - (1 : ℤ))) * (BitVec.toUInt (x (x2 - (1 : ℤ))) + (1 : ℤ))
  := sorry
end lemmas_Lemmas_value_sub_upper_bound_tightqtvc
