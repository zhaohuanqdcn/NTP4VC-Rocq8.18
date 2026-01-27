import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_1_Top_to_seqqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom permutation : Type
axiom inhabited_axiom_permutation : Inhabited permutation
attribute [instance] inhabited_axiom_permutation
noncomputable def lt (p : List ℤ) (q : List ℤ) := (List.length p = List.length q ∧ (0 : ℤ) < Int.ofNat (List.length q)) ∧ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length p)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → p[Int.toNat j]! = q[Int.toNat j]!) ∧ p[Int.toNat i]! < q[Int.toNat i]!)
axiom iseq :  {α : Type} -> [Inhabited α] -> α -> List α -> ℤ -> Bool
axiom iseq'def {α : Type} [Inhabited α] (x : α) (s : List α) (i : ℤ) : (iseq x s i = true) = (s[Int.toNat i]! = x)
noncomputable def occ {α : Type} [Inhabited α] (x : α) (s : List α) (l : ℤ) (u : ℤ) := NumOf.numof (iseq x s) l u
noncomputable def occ_all {α : Type} [Inhabited α] (x : α) (s : List α) := occ x s (0 : ℤ) (Int.ofNat (List.length s))
noncomputable def is_permutation_of (p : List ℤ) (a : List ℤ) := List.length p = List.length a ∧ (∀(x : ℤ), occ_all x p = occ_all x a)
noncomputable def descending (s : List ℤ) (lo : ℤ) (hi : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length s)) ∧ (∀(i : ℤ) (j : ℤ), lo ≤ i ∧ i ≤ j ∧ j < hi → s[Int.toNat j]! ≤ s[Int.toNat i]!)
noncomputable def ascending (s : List ℤ) (lo : ℤ) (hi : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length s)) ∧ (∀(i : ℤ) (j : ℤ), lo ≤ i ∧ i ≤ j ∧ j < hi → s[Int.toNat i]! ≤ s[Int.toNat j]!)
theorem to_seq'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (Int.ofNat (List.length ([] : List ℤ)) = (0 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → ([] : List ℤ)[Int.toNat i]! = a[(0 : ℕ)]!)) ∧ (∀(s : List ℤ), (((0 : ℤ) ≤ Int.ofNat (List.length s) ∧ Int.ofNat (List.length s) ≤ o1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → s[Int.toNat i]! = a[List.length s]!) → ((0 : ℤ) ≤ Int.ofNat (List.length s) ∧ List.length s < List.length a) ∧ (let o2 : ℤ := a[List.length s]!; let o3 : List ℤ := s ++ [o2]; Int.ofNat (List.length o3) = (1 : ℤ) + Int.ofNat (List.length s) ∧ o3[List.length s]! = o2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → o3[Int.toNat i]! = s[Int.toNat i]!) → Int.ofNat (List.length o3) = Int.ofNat (List.length s) + (1 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) + (1 : ℤ) → o3[Int.toNat i]! = a[Int.toNat (Int.ofNat (List.length s) + (1 : ℤ))]!))) ∧ (Int.ofNat (List.length s) = o1 + (1 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 + (1 : ℤ) → s[Int.toNat i]! = a[Int.toNat (o1 + (1 : ℤ))]!) → List.length s = List.length a ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → s[Int.toNat i]! = a[Int.toNat i]!)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (let r : List ℤ := ([] : List ℤ); List.length r = List.length a ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length r) → r[Int.toNat i]! = a[Int.toNat i]!)))
  := sorry
end verifythis_2021_lexicographic_permutations_1_Top_to_seqqtvc
