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
Open Scope Z_scope.
Definition permutation (l : Z) (p : list Z) := (0%Z ≤ l ∧ l ≤ Z.of_nat (length p)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> 0%Z ≤ nth (Z.to_nat i) p inhabitant ∧ nth (Z.to_nat i) p inhabitant < l) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < l -> 0%Z ≤ j ∧ j < l -> ¬ i = j -> ¬ nth (Z.to_nat i) p inhabitant = nth (Z.to_nat j) p inhabitant).
Definition permutation_pair (l : Z) (p : list Z) (invp : list Z) := permutation l p ∧ permutation l invp ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> nth (Z.to_nat (nth (Z.to_nat i) invp inhabitant)) p inhabitant = i) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> nth (Z.to_nat (nth (Z.to_nat i) p inhabitant)) invp inhabitant = i).
Axiom identity : Z -> list Z.
Axiom identity'spec'1 : forall  (l : Z) (fact0 : 0%Z < l), Z.of_nat (length (identity l)) = l.
Axiom identity'spec'0 : forall  (l : Z) (i : Z) (fact0 : 0%Z < l) (fact1 : 0%Z ≤ i) (fact2 : i < l), nth (Z.to_nat i) (identity l) inhabitant = i.
Axiom identity'spec : forall  (l : Z) (fact0 : 0%Z < l), permutation_pair l (identity l) (identity l).
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Definition valid_chunk (a : list elt) (ofs : Z) (len : Z) := 0%Z ≤ ofs ∧ ofs ≤ ofs + len ∧ ofs + len ≤ Z.of_nat (length a).
Definition copy (src : list elt) (dst : list elt) (ofs : Z) (len : Z) := valid_chunk src ofs len ∧ length src = length dst ∧ (∀(i : Z), ofs ≤ i ∧ i < ofs + len -> nth (Z.to_nat i) dst inhabitant = nth (Z.to_nat i) src inhabitant).
Definition copy_to (src : list elt) (dst : list elt) (ofss : Z) (ofsd : Z) (len : Z) := valid_chunk src ofss len ∧ valid_chunk dst ofsd len ∧ length src = length dst ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len -> nth (Z.to_nat (ofsd + i)) dst inhabitant = nth (Z.to_nat (ofss + i)) src inhabitant) ∧ (∀(i : Z), ofsd ≤ i ∧ i < ofsd + len -> nth (Z.to_nat i) dst inhabitant = nth (Z.to_nat (i + (ofss - ofsd))) src inhabitant).
Definition copy_perm (src : list elt) (dst : list elt) (size : Z) (p : list Z) (invp : list Z) := valid_chunk src 0%Z size ∧ length src = length dst ∧ permutation_pair size p invp ∧ (∀(i : Z), 0%Z ≤ i ∧ i < size -> 0%Z ≤ nth (Z.to_nat i) p inhabitant ∧ nth (Z.to_nat i) p inhabitant < size) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < size -> 0%Z ≤ nth (Z.to_nat i) invp inhabitant ∧ nth (Z.to_nat i) invp inhabitant < size) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < size -> nth (Z.to_nat i) dst inhabitant = nth (Z.to_nat (nth (Z.to_nat i) p inhabitant)) src inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < size -> nth (Z.to_nat i) src inhabitant = nth (Z.to_nat (nth (Z.to_nat i) invp inhabitant)) dst inhabitant).
Definition copy_subsegment (src : list elt) (dst : list elt) (s : Z) (k : Z) (l : Z) (j : Z) (sigma : list Z) (tau : list Z) (p : list Z) (invp : list Z) := let start : Z := s * (k * l) in let starts : Z := start + nth (Z.to_nat j) sigma inhabitant * k in let startd : Z := start + nth (Z.to_nat (nth (Z.to_nat j) sigma inhabitant)) tau inhabitant * k in copy_to src dst starts startd k ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> nth (Z.to_nat (startd + i)) p inhabitant = starts + i) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < k -> nth (Z.to_nat (starts + i)) invp inhabitant = startd + i).
Theorem distinct_subsegments'vc (k : Z) (l : Z) (s : Z) (j1 : Z) (j2 : Z) (sigma : list Z) (tau : list Z) (fact0 : 0%Z < k) (fact1 : 0%Z < l) (fact2 : 0%Z ≤ s) (fact3 : 0%Z ≤ j1) (fact4 : j1 < l) (fact5 : 0%Z ≤ j2) (fact6 : j2 < l) (fact7 : ¬ j1 = j2) (fact8 : permutation l sigma) (fact9 : permutation l tau) : let start : Z := s * (k * l) in ∀(i : Z), 0%Z ≤ i ∧ i < k -> ¬ start + nth (Z.to_nat j1) sigma inhabitant * k + i = start + nth (Z.to_nat j2) sigma inhabitant * k + i ∧ ¬ start + nth (Z.to_nat (nth (Z.to_nat j1) sigma inhabitant)) tau inhabitant * k + i = start + nth (Z.to_nat (nth (Z.to_nat j2) sigma inhabitant)) tau inhabitant * k + i.
Proof.
Admitted.
