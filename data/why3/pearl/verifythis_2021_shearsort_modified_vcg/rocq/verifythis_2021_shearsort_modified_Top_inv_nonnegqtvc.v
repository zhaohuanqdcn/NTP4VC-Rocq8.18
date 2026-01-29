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
Require Import Why3.int.NumOf.
Require Import Why3.int.Sum.
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Axiom fc : Z -> matrix Z -> Z -> Z.
Axiom fc'def : forall  (x : Z) (m : matrix Z) (i : Z), fc x m i = Z.of_nat (map_occ_list x (elts m i) 0%Z (columns m)).
Definition mocc (x : Z) (m : matrix Z) : Z := sum (fc x m) 0%Z (rows m).
Definition lt (i : Z) (j : Z) (k : Z) (l : Z) := i < k ∨ i = k ∧ (if decide (Z.quot i 2%Z = 0%Z) then j < l else l < j).
Definition snake_order (m : matrix Z) := let rw : Z := rows m in let cl : Z := columns m in ∀(i : Z) (j : Z) (k : Z) (l : Z), 0%Z ≤ i ∧ i < rw -> 0%Z ≤ j ∧ j < cl -> 0%Z ≤ k ∧ k < rw -> 0%Z ≤ l ∧ l < cl -> lt i j k l -> elts m i j ≤ elts m k l.
Axiom fc1 : matrix Z -> Z -> Z -> Z -> Z -> bool.
Axiom fc2 : matrix Z -> Z -> Z -> Z -> Z.
Axiom fc3 : matrix Z -> Z -> Z -> Z.
Axiom fc4 : matrix Z -> Z -> Z.
Axiom fc'def1 : forall  (m : matrix Z) (i : Z) (j : Z) (k : Z) (l : Z), (fc1 m i j k l = true) = (lt i j k l ∧ elts m k l < elts m i j).
Axiom fc'def2 : forall  (m : matrix Z) (i : Z) (j : Z) (k : Z), fc2 m i j k = numof (fc1 m i j k) 0%Z (columns m).
Axiom fc'def3 : forall  (m : matrix Z) (i : Z) (j : Z), fc3 m i j = sum (fc2 m i j) 0%Z (rows m).
Axiom fc'def4 : forall  (m : matrix Z) (i : Z), fc4 m i = sum (fc3 m i) 0%Z (columns m).
Definition inversions (m : matrix Z) : Z := sum (fc4 m) 0%Z (rows m).
Theorem inv_nonneg'vc (m : matrix Z) : 0%Z ≤ inversions m.
Proof.
Admitted.
