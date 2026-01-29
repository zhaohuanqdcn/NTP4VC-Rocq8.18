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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Open Scope Z_scope.
Definition map_eq_sub_shift {α : Type} `{Inhabited α} (x : Z -> α) (y : Z -> α) (xi : Z) (yi : Z) (sz : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < sz -> x (xi + i) = y (yi + i).
Theorem map_eq_shift'vc {α : Type} `{Inhabited α} (x : Z -> α) (y : Z -> α) (xi : Z) (yi : Z) (sz : Z) (k : Z) (fact0 : map_eq_sub_shift x y xi yi sz) (fact1 : 0%Z ≤ k) (fact2 : k < sz) : x (xi + k) = y (yi + k).
Proof.
Admitted.
