import Why3.Base
import Why3.map.Const
import Why3.map.MapEq
open Classical
open Lean4Why3
namespace lemmas_Lemmas_map_eq_shift_zeroqtvc
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
theorem map_eq_shift_zero'vc {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (n : ℤ) (m : ℤ) (fact0 : map_eq_sub_shift x y n n (m - n)) : MapEq.map_eq_sub x y n m
  := sorry
end lemmas_Lemmas_map_eq_shift_zeroqtvc
