import Why3.Base
open Classical
open Lean4Why3
namespace fill_Fill_fillqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
inductive tree where
  | Null : tree
  | Node : tree -> elt -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def contains : tree -> elt -> Prop
  | tree.Null, x => False
  | (tree.Node l y r), x => contains l x ∨ x = y ∨ contains r x
theorem fill'vc (start : ℤ) (a : List elt) (t : tree) (fact0 : (0 : ℤ) ≤ start) (fact1 : start ≤ Int.ofNat (List.length a)) : match t with | tree.Null => (start ≤ start ∧ start ≤ Int.ofNat (List.length a)) ∧ (∀(i : ℤ), start ≤ i ∧ i < start → contains t (a[Int.toNat i]!)) | tree.Node l x r => ((match t with | tree.Null => False | tree.Node f _ f1 => f = l ∨ f1 = l) ∧ (0 : ℤ) ≤ start ∧ start ≤ Int.ofNat (List.length a)) ∧ (∀(a1 : List elt), List.length a1 = List.length a → (∀(res : ℤ), (start ≤ res ∧ res ≤ Int.ofNat (List.length a1)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < start → a1[Int.toNat i]! = a[Int.toNat i]!) ∧ (∀(i : ℤ), start ≤ i ∧ i < res → contains l (a1[Int.toNat i]!)) → (if ¬res = Int.ofNat (List.length a1) then ((0 : ℤ) ≤ res ∧ res < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat res) x) = List.length a1 → getElem! (List.set a1 (Int.toNat res) x) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) res x → (let o1 : ℤ := res + (1 : ℤ); ((match t with | tree.Null => False | tree.Node f _ f1 => f = r ∨ f1 = r) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length (List.set a1 (Int.toNat res) x))) ∧ (∀(a2 : List elt), List.length a2 = List.length (List.set a1 (Int.toNat res) x) → (∀(result : ℤ), (o1 ≤ result ∧ result ≤ Int.ofNat (List.length a2)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → a2[Int.toNat i]! = (List.set a1 (Int.toNat res) x)[Int.toNat i]!) ∧ (∀(i : ℤ), o1 ≤ i ∧ i < result → contains r (a2[Int.toNat i]!)) → (start ≤ result ∧ result ≤ Int.ofNat (List.length a2)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < start → a2[Int.toNat i]! = a[Int.toNat i]!) ∧ (∀(i : ℤ), start ≤ i ∧ i < result → contains t (a2[Int.toNat i]!)))))) else (start ≤ res ∧ res ≤ Int.ofNat (List.length a1)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < start → a1[Int.toNat i]! = a[Int.toNat i]!) ∧ (∀(i : ℤ), start ≤ i ∧ i < res → contains t (a1[Int.toNat i]!)))))
  := sorry
end fill_Fill_fillqtvc
