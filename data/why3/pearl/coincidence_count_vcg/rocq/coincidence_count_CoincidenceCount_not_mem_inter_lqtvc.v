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
Axiom mixfix_lbrb_closure : forall {α : Type} `{Inhabited α} `{Countable α}, list α -> Z -> α.
Axiom mixfix_lbrb_closure_def : forall  {α : Type} `{Inhabited α} `{Countable α} (y : list α) (y1 : Z), mixfix_lbrb_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Definition setof {α : Type} `{Inhabited α} `{Countable α} (a : list α) : gset α := gset_map (mixfix_lbrb_closure a) (gset_interval 0%Z (Z.of_nat (length a))).
Definition drop {α : Type} `{Inhabited α} `{Countable α} (a : list α) (n : Z) : gset α := gset_map (mixfix_lbrb_closure a) (gset_interval n (Z.of_nat (length a))).
Definition increasing (a : list Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant < nth (Z.to_nat j) a inhabitant.
Definition cc (a : list Z) (b : list Z) : Z := Z.of_nat (size (setof a ∩ setof b)).
Theorem not_mem_inter_l'vc (i : Z) (a : list Z) (s : gset Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length a)) (fact2 : ¬ nth (Z.to_nat i) a inhabitant ∈ s) : s ∩ drop a i = s ∩ drop a (i + 1%Z).
Proof.
Admitted.
