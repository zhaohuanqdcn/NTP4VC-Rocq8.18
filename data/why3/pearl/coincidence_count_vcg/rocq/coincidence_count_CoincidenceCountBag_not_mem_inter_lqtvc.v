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
Open Scope Z_scope.
Definition increasing (a : list Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant.
Axiom bagofsub : forall {α : Type} `{Inhabited α} `{Countable α}, list α -> Z -> Z -> gmultiset α.
Axiom bagofsub'def : forall  {α : Type} `{Inhabited α} `{Countable α} (lo : Z) (hi : Z) (a : list α) (fact0 : 0%Z ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Z.of_nat (length a)), if decide (hi ≤ lo) then bagofsub a lo hi = (∅ : gmultiset α) else bagofsub a lo hi = insert_mset (nth (Z.to_nat lo) a inhabitant) (bagofsub a (lo + 1%Z) hi).
Definition bagof {α : Type} `{Inhabited α} `{Countable α} (a : list α) : gmultiset α := bagofsub a 0%Z (Z.of_nat (length a)).
Definition drop {α : Type} `{Inhabited α} `{Countable α} (a : list α) (i : Z) : gmultiset α := bagofsub a i (Z.of_nat (length a)).
Theorem not_mem_inter_l'vc (i : Z) (a : list Z) (s : gmultiset Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length a)) (fact2 : ¬ nth (Z.to_nat i) a inhabitant ∈ s) : s ∩ drop a i = s ∩ drop a (i + 1%Z).
Proof.
Admitted.
