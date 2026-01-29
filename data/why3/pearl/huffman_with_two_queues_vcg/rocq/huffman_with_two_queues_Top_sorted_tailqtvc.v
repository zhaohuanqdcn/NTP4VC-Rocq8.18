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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom get_closure : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom get_closure_def : forall  {α : Type} `{Inhabited α} (y : list α) (y1 : Z), get_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Definition last (s : list Z) : Z := nth (Z.to_nat (Z.of_nat (length s) - 1%Z)) s inhabitant.
Theorem sorted_tail'vc (s : list Z) (fact0 : Sorted Z.le s) (fact1 : 1%Z ≤ Z.of_nat (length s)) : Sorted Z.le (drop 1%nat s).
Proof.
Admitted.
