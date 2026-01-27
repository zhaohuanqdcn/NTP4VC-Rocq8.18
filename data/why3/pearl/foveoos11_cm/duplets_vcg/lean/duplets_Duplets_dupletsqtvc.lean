import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace duplets_Duplets_dupletsqtvc
noncomputable def is_duplet (a : List ℤ) (i : ℤ) (j : ℤ) := ((0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a)) ∧ a[Int.toNat i]! = a[Int.toNat j]!
noncomputable def eq_opt (x : ℤ) (o1 : Option ℤ) := match o1 with | Option.none => False | Option.some v => v = x
theorem duplets'vc (a : List ℤ) (fact0 : (4 : ℤ) ≤ Int.ofNat (List.length a)) (fact1 : ∃(i : ℤ) (j : ℤ) (k : ℤ) (l : ℤ), is_duplet a i j ∧ is_duplet a k l ∧ ¬a[Int.toNat i]! = a[Int.toNat k]!) : let o1 : Option ℤ := Option.none; ((2 : ℤ) ≤ Int.ofNat (List.length a) ∧ (∃(i : ℤ) (j : ℤ), is_duplet a i j ∧ ¬eq_opt (a[Int.toNat i]!) o1)) ∧ (∀(i : ℤ) (j : ℤ), is_duplet a i j ∧ ¬eq_opt (a[Int.toNat i]!) o1 → (((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a)) ∧ (2 : ℤ) ≤ Int.ofNat (List.length a) ∧ (∃(i1 : ℤ) (j1 : ℤ), is_duplet a i1 j1 ∧ ¬eq_opt (a[Int.toNat i1]!) (Option.some (a[Int.toNat j]!)))) ∧ (∀(result : ℤ) (result1 : ℤ), is_duplet a result result1 ∧ ¬eq_opt (a[Int.toNat result]!) (Option.some (a[Int.toNat j]!)) → is_duplet a i j ∧ is_duplet a result result1 ∧ ¬a[Int.toNat i]! = a[Int.toNat result]!))
  := sorry
end duplets_Duplets_dupletsqtvc
