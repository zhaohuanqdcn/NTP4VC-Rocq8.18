import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_MoreHoareLogic_list_sumqtvc
noncomputable def sum : List ℤ -> ℤ
  | ([] : List ℤ) => (0 : ℤ)
  | (List.cons x r) => x + sum r
theorem list_sum'vc (l : List ℤ) : List.length l ≤ List.length l ∧ (0 : ℤ) + sum l = sum l ∧ (∀(y : ℤ) (l1 : List ℤ), List.length l1 ≤ List.length l ∧ y + sum l1 = sum l → is_nil l1 = (l1 = ([] : List ℤ)) → (if ¬is_nil l1 then ¬l1 = ([] : List ℤ) ∧ (∀(o1 : ℤ), Option.some o1 = List.head? l1 → ¬l1 = ([] : List ℤ) ∧ (∀(o2 : List ℤ), Option.some o2 = List.tail? l1 → (match l1 with | ([] : List ℤ) => False | List.cons _ f => f = o2) ∧ List.length o2 ≤ List.length l ∧ y + o1 + sum o2 = sum l)) else y = sum l))
  := sorry
end sf_MoreHoareLogic_list_sumqtvc
