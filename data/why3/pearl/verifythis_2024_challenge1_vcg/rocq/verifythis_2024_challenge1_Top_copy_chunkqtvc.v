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
Theorem copy_chunk'vc (src : list elt) (dst : list elt) (ofss : Z) (len : Z) (ofsd : Z) (fact0 : length src = length dst) (fact1 : valid_chunk src ofss len) (fact2 : valid_chunk dst ofsd len) : let o1 : Z := len - 1%Z in (0%Z ≤ o1 + 1%Z -> copy_to src dst ofss ofsd 0%Z ∧ (∀(dst1 : list elt), length dst1 = length dst -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ copy_to src dst1 ofss ofsd i ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < ofsd -> nth (Z.to_nat i1) dst1 inhabitant = nth (Z.to_nat i1) dst inhabitant) ∧ (∀(i1 : Z), ofsd + len ≤ i1 ∧ i1 < Z.of_nat (length dst1) -> nth (Z.to_nat i1) dst1 inhabitant = nth (Z.to_nat i1) dst inhabitant) -> (let o2 : Z := ofss + i in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length src)) ∧ (let o3 : elt := nth (Z.to_nat o2) src inhabitant in let o4 : Z := ofsd + i in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length dst1)) ∧ (length (set_list dst1 (Z.to_nat o4) o3) = length dst1 -> nth_i (set_list dst1 (Z.to_nat o4) o3) = fun_updt (nth_i dst1) o4 o3 -> copy_to src (set_list dst1 (Z.to_nat o4) o3) ofss ofsd (i + 1%Z) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < ofsd -> nth (Z.to_nat i1) (set_list dst1 (Z.to_nat o4) o3) inhabitant = nth (Z.to_nat i1) dst inhabitant) ∧ (∀(i1 : Z), ofsd + len ≤ i1 ∧ i1 < Z.of_nat (length (set_list dst1 (Z.to_nat o4) o3)) -> nth (Z.to_nat i1) (set_list dst1 (Z.to_nat o4) o3) inhabitant = nth (Z.to_nat i1) dst inhabitant))))) ∧ (copy_to src dst1 ofss ofsd (o1 + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < ofsd -> nth (Z.to_nat i) dst1 inhabitant = nth (Z.to_nat i) dst inhabitant) ∧ (∀(i : Z), ofsd + len ≤ i ∧ i < Z.of_nat (length dst1) -> nth (Z.to_nat i) dst1 inhabitant = nth (Z.to_nat i) dst inhabitant) -> copy_to src dst1 ofss ofsd len ∧ (∀(i : Z), 0%Z ≤ i ∧ i < ofsd -> nth (Z.to_nat i) dst1 inhabitant = nth (Z.to_nat i) dst inhabitant) ∧ (∀(i : Z), ofsd + len ≤ i ∧ i < Z.of_nat (length dst1) -> nth (Z.to_nat i) dst1 inhabitant = nth (Z.to_nat i) dst inhabitant)))) ∧ (o1 + 1%Z < 0%Z -> copy_to src dst ofss ofsd len).
Proof.
Admitted.
