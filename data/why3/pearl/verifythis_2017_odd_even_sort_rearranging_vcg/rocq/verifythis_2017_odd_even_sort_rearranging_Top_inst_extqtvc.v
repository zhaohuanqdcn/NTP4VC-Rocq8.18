From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.Sum.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Axiom array_max : list Z -> Z.
Axiom array_max'spec : forall  (j : Z) (a : list Z) (fact0 : 0%Z ≤ j) (fact1 : j < Z.of_nat (length a)), nth (Z.to_nat j) a inhabitant ≤ array_max a.
Definition aux (a : Z -> Z) (m : Z) (i : Z) : Z := i * (m - a i).
Axiom aux_closure : (Z -> Z) -> Z -> Z -> Z.
Axiom aux_closure_def : forall  (y : Z -> Z) (y1 : Z) (y2 : Z), aux_closure y y1 y2 = aux y y1 y2.
Definition entropy (a : list Z) (m : Z) : Z := sum (aux_closure (nth_i a) m) 0%Z (Z.of_nat (length a)).
Theorem inst_ext'vc (a : Z) (b : Z) (a1 : Z -> Z) (a2 : Z -> Z) (m : Z) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> a1 i = a2 i) : sum (aux_closure a1 m) a b = sum (aux_closure a2 m) a b.
Admitted.
