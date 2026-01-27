import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace coincidence_count_CoincidenceCount_not_mem_inter_rqtvc
axiom mixfix_lbrb_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom mixfix_lbrb_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : mixfix_lbrb_closure y y1 = y[Int.toNat y1]!
noncomputable def setof {α : Type} [Inhabited α] (a : List α) := Finset.image (mixfix_lbrb_closure a) (Finset.Ico (0 : ℤ) (Int.ofNat (List.length a)))
noncomputable def drop {α : Type} [Inhabited α] (a : List α) (n : ℤ) := Finset.image (mixfix_lbrb_closure a) (Finset.Ico n (Int.ofNat (List.length a)))
noncomputable def increasing (a : List ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → a[Int.toNat i]! < a[Int.toNat j]!
noncomputable def cc (a : List ℤ) (b : List ℤ) := Int.ofNat (Finset.card (setof a ∩ setof b))
theorem not_mem_inter_r'vc (i : ℤ) (a : List ℤ) (s : Finset ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length a)) (fact2 : ¬a[Int.toNat i]! ∈ s) : drop a i ∩ s = drop a (i + (1 : ℤ)) ∩ s
  := sorry
end coincidence_count_CoincidenceCount_not_mem_inter_rqtvc
