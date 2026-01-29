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
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom permutation : Type.
Axiom permutation_inhabited : Inhabited permutation.
Global Existing Instance permutation_inhabited.
Axiom permutation_countable : Countable permutation.
Global Existing Instance permutation_countable.
Definition lt (p : list Z) (q : list Z) := (length p = length q ∧ 0%Z < Z.of_nat (length q)) ∧ (∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length p)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) p inhabitant = nth (Z.to_nat j) q inhabitant) ∧ nth (Z.to_nat i) p inhabitant < nth (Z.to_nat i) q inhabitant).
Axiom iseq : forall {α : Type} `{Inhabited α} `{Countable α}, α -> list α -> Z -> bool.
Axiom iseq'def : forall  {α : Type} `{Inhabited α} `{Countable α} (x : α) (s : list α) (i : Z), (iseq x s i = true) = (nth (Z.to_nat i) s inhabitant = x).
Definition occ {α : Type} `{Inhabited α} `{Countable α} (x : α) (s : list α) (l : Z) (u : Z) : Z := numof (iseq x s) l u.
Definition occ_all {α : Type} `{Inhabited α} `{Countable α} (x : α) (s : list α) : Z := occ x s 0%Z (Z.of_nat (length s)).
Definition is_permutation_of (p : list Z) (a : list Z) := length p = length a ∧ (∀(x : Z), occ_all x p = occ_all x a).
Definition descending (s : list Z) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length s)) ∧ (∀(i : Z) (j : Z), lo ≤ i ∧ i ≤ j ∧ j < hi -> nth (Z.to_nat j) s inhabitant ≤ nth (Z.to_nat i) s inhabitant).
Definition ascending (s : list Z) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length s)) ∧ (∀(i : Z) (j : Z), lo ≤ i ∧ i ≤ j ∧ j < hi -> nth (Z.to_nat i) s inhabitant ≤ nth (Z.to_nat j) s inhabitant).
Axiom to_seq : list Z -> list Z.
Axiom to_seq'spec'0 : forall  (a : list Z), length (to_seq a) = length a.
Axiom to_seq'spec : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length (to_seq a))), nth (Z.to_nat i) (to_seq a) inhabitant = nth (Z.to_nat i) a inhabitant.
Axiom cons_closure : forall {α : Type} `{Inhabited α} `{Countable α}, α -> list α -> list α.
Axiom cons_closure_def : forall  {α : Type} `{Inhabited α} `{Countable α} (y : α) (y1 : list α), cons_closure y y1 = cons y y1.
Theorem all_permutations'vc (s : list Z) : let n : Z := Z.of_nat (length s) in (∀(k : Z), 0%Z ≤ k ∧ k ≤ n -> (if decide (k = 0%Z) then ∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) -> p ∈ ({[([] : list Z)]} : gset _) else let o1 : Z := k - 1%Z in ((0%Z ≤ k ∧ o1 < k) ∧ 0%Z ≤ o1 ∧ o1 ≤ n) ∧ (∀(now : gset (list Z)), (∀(p : list Z), Z.of_nat (length p) = o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) -> p ∈ now) -> (let o2 : Z := n - 1%Z in (0%Z ≤ o2 + 1%Z -> (∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) ∧ 0%Z < occ (nth 0%nat p inhabitant) s 0%Z 0%Z -> p ∈ (∅ : gset (list Z))) ∧ (∀(acc : gset (list Z)), (∀(j : Z), (0%Z ≤ j ∧ j ≤ o2) ∧ (∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) ∧ 0%Z < occ (nth 0%nat p inhabitant) s 0%Z j -> p ∈ acc) -> (let o3 : Z := nth (Z.to_nat j) s inhabitant in let o4 : list Z -> list Z := cons_closure o3 in (∀(s1 : list Z), Z.of_nat (length (o4 s1)) = 1%Z + Z.of_nat (length s1)) ∧ (∀(s1 : list Z), nth 0%nat (o4 s1) inhabitant = o3) ∧ (∀(s1 : list Z) (i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length s1) -> nth (Z.to_nat i) (o4 s1) inhabitant = nth (Z.to_nat (i - 1%Z)) s1 inhabitant) -> (∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) ∧ 0%Z < occ (nth 0%nat p inhabitant) s 0%Z (j + 1%Z) -> p ∈ acc ∪ gset_map o4 now))) ∧ ((∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) ∧ 0%Z < occ (nth 0%nat p inhabitant) s 0%Z (o2 + 1%Z) -> p ∈ acc) -> (∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) -> p ∈ acc)))) ∧ (o2 + 1%Z < 0%Z -> (∀(p : list Z), Z.of_nat (length p) = k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) -> p ∈ (∅ : gset (list Z)))))))) ∧ (0%Z ≤ n ∧ n ≤ n) ∧ (∀(all1 : gset (list Z)), (∀(p : list Z), Z.of_nat (length p) = n ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> 0%Z < occ_all (nth (Z.to_nat i) p inhabitant) s) -> p ∈ all1) -> (∀(p : list Z), is_permutation_of p s -> p ∈ all1)).
Proof.
Admitted.
