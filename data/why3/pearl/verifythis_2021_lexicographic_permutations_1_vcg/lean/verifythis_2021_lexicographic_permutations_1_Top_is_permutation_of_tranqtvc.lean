import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_1_Top_is_permutation_of_tranqtvc
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
axiom to_seq : List ℤ -> List ℤ
axiom to_seq'spec'0 (a : List ℤ) : List.length (to_seq a) = List.length a
axiom to_seq'spec (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length (to_seq a))) : (to_seq a)[Int.toNat i]! = a[Int.toNat i]!
theorem is_permutation_of_tran'vc (p : List ℤ) (q : List ℤ) (r : List ℤ) (fact0 : is_permutation_of p q) (fact1 : is_permutation_of q r) : is_permutation_of p r
  := sorry
end verifythis_2021_lexicographic_permutations_1_Top_is_permutation_of_tranqtvc
