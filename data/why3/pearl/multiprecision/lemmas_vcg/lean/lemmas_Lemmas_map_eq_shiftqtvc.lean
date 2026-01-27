import Why3.Base
import Why3.map.Const
import Why3.map.MapEq
open Classical
open Lean4Why3
namespace lemmas_Lemmas_map_eq_shiftqtvc
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
theorem map_eq_shift'vc {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) (k : ℤ) (fact0 : map_eq_sub_shift x y xi yi sz) (fact1 : (0 : ℤ) ≤ k) (fact2 : k < sz) : x (xi + k) = y (yi + k)
  := sorry
end lemmas_Lemmas_map_eq_shiftqtvc
