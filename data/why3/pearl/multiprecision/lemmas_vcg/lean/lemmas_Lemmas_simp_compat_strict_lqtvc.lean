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
namespace lemmas_Lemmas_simp_compat_strict_lqtvc
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
theorem simp_compat_strict_l'vc (a : ℤ) (b : ℤ) (c : ℤ) (fact0 : (0 : ℤ) ≤ a * b) (fact1 : a * b < a * c) (fact2 : (0 : ℤ) < a) : b < c
  := sorry
end lemmas_Lemmas_simp_compat_strict_lqtvc
