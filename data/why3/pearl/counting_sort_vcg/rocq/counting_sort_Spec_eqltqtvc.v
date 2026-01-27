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
Require Import Why3.int.NumOf.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Axiom k : Z.
Axiom k'def : 0%Z < k.
Definition k_values (a : list Z) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ nth (Z.to_nat i) a inhabitant ∧ nth (Z.to_nat i) a inhabitant < k.
Axiom fc : list Z -> Z -> Z -> bool.
Axiom fc'def : forall  (a : list Z) (v : Z) (k1 : Z), (fc a v k1 = true) = (nth (Z.to_nat k1) a inhabitant = v).
Definition numeq (a : list Z) (v : Z) (i : Z) (j : Z) : Z := numof (fc a v) i j.
Axiom fc1 : list Z -> Z -> Z -> bool.
Axiom fc'def1 : forall  (a : list Z) (v : Z) (k1 : Z), (fc1 a v k1 = true) = (nth (Z.to_nat k1) a inhabitant < v).
Definition numlt (a : list Z) (v : Z) (i : Z) (j : Z) : Z := numof (fc1 a v) i j.
Theorem eqlt'vc (a : list Z) (v : Z) (l : Z) (u : Z) (fact0 : k_values a) (fact1 : 0%Z ≤ v) (fact2 : v < k) (fact3 : 0%Z ≤ l) (fact4 : l < u) (fact5 : u ≤ Z.of_nat (length a)) : numlt a v l u + numeq a v l u = numlt a (v + 1%Z) l u.
Admitted.
