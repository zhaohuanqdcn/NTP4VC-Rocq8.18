import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace coincidence_count_CoincidenceCount_drop_leftqtvc
axiom mixfix_lbrb_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom mixfix_lbrb_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : mixfix_lbrb_closure y y1 = y[Int.toNat y1]!
noncomputable def setof {α : Type} [Inhabited α] (a : List α) := Finset.image (mixfix_lbrb_closure a) (Finset.Ico (0 : ℤ) (Int.ofNat (List.length a)))
noncomputable def drop {α : Type} [Inhabited α] (a : List α) (n : ℤ) := Finset.image (mixfix_lbrb_closure a) (Finset.Ico n (Int.ofNat (List.length a)))
theorem drop_left'vc {α : Type} [Inhabited α] (n : ℤ) (a : List α) (fact0 : (0 : ℤ) ≤ n) (fact1 : n < Int.ofNat (List.length a)) : drop a n = insert (a[Int.toNat n]!) (drop a (n + (1 : ℤ)))
  := sorry
end coincidence_count_CoincidenceCount_drop_leftqtvc
