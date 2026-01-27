import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_1_Top_all_permutationsqtvc
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
axiom cons_closure :  {α : Type} -> [Inhabited α] -> α -> List α -> List α
axiom cons_closure_def {α : Type} [Inhabited α] (y : α) (y1 : List α) : cons_closure y y1 = List.cons y y1
theorem all_permutations'vc (s : List ℤ) : let n : ℤ := Int.ofNat (List.length s); (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k ≤ n → (if k = (0 : ℤ) then ∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) → p ∈ insert ([] : List ℤ) (∅ : Finset (List ℤ)) else let o1 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k ∧ o1 < k) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ n) ∧ (∀(now : Finset (List ℤ)), (∀(p : List ℤ), Int.ofNat (List.length p) = o1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) → p ∈ now) → (let o2 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o2 + (1 : ℤ) → (∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) ∧ (0 : ℤ) < occ (p[(0 : ℕ)]!) s (0 : ℤ) (0 : ℤ) → p ∈ (∅ : Finset (List ℤ))) ∧ (∀(acc : Finset (List ℤ)), (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j ≤ o2) ∧ (∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) ∧ (0 : ℤ) < occ (p[(0 : ℕ)]!) s (0 : ℤ) j → p ∈ acc) → (let o3 : ℤ := s[Int.toNat j]!; let o4 : List ℤ -> List ℤ := cons_closure o3; (∀(s1 : List ℤ), Int.ofNat (List.length (o4 s1)) = (1 : ℤ) + Int.ofNat (List.length s1)) ∧ (∀(s1 : List ℤ), (o4 s1)[(0 : ℕ)]! = o3) ∧ (∀(s1 : List ℤ) (i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length s1) → (o4 s1)[Int.toNat i]! = s1[Int.toNat (i - (1 : ℤ))]!) → (∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) ∧ (0 : ℤ) < occ (p[(0 : ℕ)]!) s (0 : ℤ) (j + (1 : ℤ)) → p ∈ acc ∪ Finset.image o4 now))) ∧ ((∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) ∧ (0 : ℤ) < occ (p[(0 : ℕ)]!) s (0 : ℤ) (o2 + (1 : ℤ)) → p ∈ acc) → (∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) → p ∈ acc)))) ∧ (o2 + (1 : ℤ) < (0 : ℤ) → (∀(p : List ℤ), Int.ofNat (List.length p) = k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) → p ∈ (∅ : Finset (List ℤ)))))))) ∧ ((0 : ℤ) ≤ n ∧ n ≤ n) ∧ (∀(all1 : Finset (List ℤ)), (∀(p : List ℤ), Int.ofNat (List.length p) = n ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) < occ_all (p[Int.toNat i]!) s) → p ∈ all1) → (∀(p : List ℤ), is_permutation_of p s → p ∈ all1))
  := sorry
end verifythis_2021_lexicographic_permutations_1_Top_all_permutationsqtvc
