From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Axiom x_N : Z.
Axiom f : Z.
Axiom f_N_range : 1%Z ≤ f ∧ f ≤ x_N.
Definition found (a : list Z) := ∀(p : Z) (q : Z), 1%Z ≤ p ∧ p ≤ f ∧ f ≤ q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat f) a inhabitant ∧ nth (Z.to_nat f) a inhabitant ≤ nth (Z.to_nat q) a inhabitant.
Definition m_invariant (m : Z) (a : list Z) := m ≤ f ∧ (∀(p : Z) (q : Z), 1%Z ≤ p ∧ p < m ∧ m ≤ q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant).
Definition n_invariant (n : Z) (a : list Z) := f ≤ n ∧ (∀(p : Z) (q : Z), 1%Z ≤ p ∧ p ≤ n ∧ n < q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant).
Definition i_invariant (m : Z) (n : Z) (i : Z) (q : Z) (r : Z) (a : list Z) := m ≤ i ∧ (∀(p : Z), 1%Z ≤ p ∧ p < i -> nth (Z.to_nat p) a inhabitant ≤ r) ∧ (i ≤ n -> (i ≤ q ∧ q ≤ n) ∧ r ≤ nth (Z.to_nat q) a inhabitant).
Definition j_invariant (m : Z) (n : Z) (j : Z) (p : Z) (r : Z) (a : list Z) := j ≤ n ∧ (∀(q : Z), j < q ∧ q ≤ x_N -> r ≤ nth (Z.to_nat q) a inhabitant) ∧ (m ≤ j -> (m ≤ p ∧ p ≤ j) ∧ nth (Z.to_nat p) a inhabitant ≤ r).
Definition termination (i : Z) (j : Z) (i0 : Z) (j0 : Z) (r : Z) (a : list Z) := i0 < i ∧ j < j0 ∨ (i ≤ f ∧ f ≤ j) ∧ nth (Z.to_nat f) a inhabitant = r.
Theorem find'vc (a : list Z) (fact0 : Z.of_nat (length a) = x_N + 1%Z) : m_invariant 1%Z a ∧ n_invariant x_N a ∧ a ≡ₚ a ∧ 1%Z ≤ 1%Z ∧ x_N ≤ x_N ∧ (∀(n : Z) (m : Z) (a1 : list Z), length a1 = length a -> m_invariant m a1 ∧ n_invariant n a1 ∧ a1 ≡ₚ a ∧ 1%Z ≤ m ∧ n ≤ x_N -> (if decide (m < n) then let o1 : Z := f in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length a1)) ∧ (let r : Z := nth (Z.to_nat o1) a1 inhabitant in (i_invariant m n m f r a1 ∧ j_invariant m n n f r a1 ∧ m_invariant m a1 ∧ n_invariant n a1 ∧ 0%Z ≤ n ∧ m ≤ x_N + 1%Z ∧ termination m n m n r a1 ∧ a1 ≡ₚ a) ∧ (∀(q : Z) (p : Z) (j : Z) (i : Z) (a2 : list Z), length a2 = length a1 -> i_invariant m n i q r a2 ∧ j_invariant m n j p r a2 ∧ m_invariant m a2 ∧ n_invariant n a2 ∧ 0%Z ≤ j ∧ i ≤ x_N + 1%Z ∧ termination i j m n r a2 ∧ a2 ≡ₚ a -> (if decide (i ≤ j) then (i_invariant m n i q r a2 ∧ (i ≤ i ∧ i ≤ n) ∧ termination i j m n r a2) ∧ (∀(i1 : Z), i_invariant m n i1 q r a2 ∧ (i ≤ i1 ∧ i1 ≤ n) ∧ termination i1 j m n r a2 -> (0%Z ≤ i1 ∧ i1 < Z.of_nat (length a2)) ∧ (if decide (nth (Z.to_nat i1) a2 inhabitant < r) then (0%Z ≤ x_N + 1%Z - i1 ∧ x_N + 1%Z - (i1 + 1%Z) < x_N + 1%Z - i1) ∧ i_invariant m n (i1 + 1%Z) q r a2 ∧ (i ≤ i1 + 1%Z ∧ i1 + 1%Z ≤ n) ∧ termination (i1 + 1%Z) j m n r a2 else (j_invariant m n j p r a2 ∧ j ≤ j ∧ m ≤ j ∧ termination i1 j m n r a2) ∧ (∀(j1 : Z), j_invariant m n j1 p r a2 ∧ j1 ≤ j ∧ m ≤ j1 ∧ termination i1 j1 m n r a2 -> (0%Z ≤ j1 ∧ j1 < Z.of_nat (length a2)) ∧ (if decide (r < nth (Z.to_nat j1) a2 inhabitant) then (0%Z ≤ j1 ∧ j1 - 1%Z < j1) ∧ j_invariant m n (j1 - 1%Z) p r a2 ∧ j1 - 1%Z ≤ j ∧ m ≤ j1 - 1%Z ∧ termination i1 (j1 - 1%Z) m n r a2 else if decide (i1 ≤ j1) then (0%Z ≤ i1 ∧ i1 < Z.of_nat (length a2)) ∧ (let w : Z := nth (Z.to_nat i1) a2 inhabitant in (0%Z ≤ j1 ∧ j1 < Z.of_nat (length a2)) ∧ (let o2 : Z := nth (Z.to_nat j1) a2 inhabitant in (0%Z ≤ i1 ∧ i1 < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat i1) o2) = length a2 -> nth_i (set_list a2 (Z.to_nat i1) o2) = fun_updt (nth_i a2) i1 o2 -> (0%Z ≤ j1 ∧ j1 < Z.of_nat (length (set_list a2 (Z.to_nat i1) o2))) ∧ (length (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) = length (set_list a2 (Z.to_nat i1) o2) -> nth_i (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) = fun_updt (nth_i (set_list a2 (Z.to_nat i1) o2)) j1 w -> (∀(o3 : Z), (if decide (i1 < j1) then o3 = i1 else o3 = j1 - 1%Z) -> (∀(o4 : Z), (if decide (i1 < j1) then o4 = j1 else o4 = i1 + 1%Z) -> (0%Z ≤ x_N + 2%Z + j - i ∧ x_N + 2%Z + (j1 - 1%Z) - (i1 + 1%Z) < x_N + 2%Z + j - i) ∧ i_invariant m n (i1 + 1%Z) o4 r (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) ∧ j_invariant m n (j1 - 1%Z) o3 r (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) ∧ m_invariant m (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) ∧ n_invariant n (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) ∧ 0%Z ≤ j1 - 1%Z ∧ i1 + 1%Z ≤ x_N + 1%Z ∧ termination (i1 + 1%Z) (j1 - 1%Z) m n r (set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w) ∧ set_list (set_list a2 (Z.to_nat i1) o2) (Z.to_nat j1) w ≡ₚ a)))))) else (0%Z ≤ x_N + 2%Z + j - i ∧ x_N + 2%Z + j1 - i1 < x_N + 2%Z + j - i) ∧ i_invariant m n i1 q r a2 ∧ j_invariant m n j1 p r a2 ∧ m_invariant m a2 ∧ n_invariant n a2 ∧ 0%Z ≤ j1 ∧ i1 ≤ x_N + 1%Z ∧ termination i1 j1 m n r a2 ∧ a2 ≡ₚ a)))) else if decide (f ≤ j) then (0%Z ≤ n - m ∧ j - m < n - m) ∧ m_invariant m a2 ∧ n_invariant j a2 ∧ a2 ≡ₚ a ∧ 1%Z ≤ m ∧ j ≤ x_N else if decide (i ≤ f) then (0%Z ≤ n - m ∧ n - i < n - m) ∧ m_invariant i a2 ∧ n_invariant n a2 ∧ a2 ≡ₚ a ∧ 1%Z ≤ i ∧ n ≤ x_N else (0%Z ≤ n - m ∧ f - f < n - m) ∧ m_invariant f a2 ∧ n_invariant f a2 ∧ a2 ≡ₚ a ∧ 1%Z ≤ f ∧ f ≤ x_N))) else found a1 ∧ a1 ≡ₚ a)).
Proof.
Admitted.
