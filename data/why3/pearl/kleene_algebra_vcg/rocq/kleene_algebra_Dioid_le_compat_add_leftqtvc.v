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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom zero : t.
Axiom one : t.
Axiom infix_pl : t -> t -> t.
Axiom infix_as : t -> t -> t.
Axiom Assoc : forall  (x : t) (y : t) (z : t), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : t), infix_pl zero x = x.
Axiom Unit_def_r : forall  (x : t), infix_pl x zero = x.
Axiom Comm : forall  (x : t) (y : t), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : t) (y : t) (z : t), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Unit_def_l1 : forall  (x : t), infix_as one x = x.
Axiom Unit_def_r1 : forall  (x : t), infix_as x one = x.
Axiom Mul_zero_l : forall  (x : t), infix_as zero x = zero.
Axiom Mul_zero_r : forall  (x : t), infix_as x zero = zero.
Axiom Mul_distr_l : forall  (x : t) (y : t) (z : t), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : t) (z : t) (x : t), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom infix_cf : t -> Z -> t.
Axiom infix_cf'def : forall  (n : Z) (x : t) (fact0 : 0%Z ≤ n), if decide (n = 0%Z) then infix_cf x n = one else infix_cf x n = infix_as x (infix_cf x (n - 1%Z)).
Axiom Assoc2 : forall  (x : t) (y : t) (z : t), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Unit_def_l2 : forall  (x : t), infix_as one x = x.
Axiom Unit_def_r2 : forall  (x : t), infix_as x one = x.
Axiom Power_0 : forall  (x : t), infix_cf x 0%Z = one.
Axiom Power_s : forall  (n : Z) (x : t) (fact0 : 0%Z ≤ n), infix_cf x (n + 1%Z) = infix_as x (infix_cf x n).
Axiom Power_s_alt : forall  (n : Z) (x : t) (fact0 : 0%Z < n), infix_cf x n = infix_as x (infix_cf x (n - 1%Z)).
Axiom Power_1 : forall  (x : t), infix_cf x 1%Z = x.
Axiom Power_sum : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), infix_cf x (n + m) = infix_as (infix_cf x n) (infix_cf x m).
Axiom Power_mult : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), infix_cf x (n * m) = infix_cf (infix_cf x n) m.
Axiom Power_comm1 : forall  (x : t) (y : t) (n : Z) (fact0 : infix_as x y = infix_as y x) (fact1 : 0%Z ≤ n), infix_as (infix_cf x n) y = infix_as y (infix_cf x n).
Axiom Power_comm2 : forall  (x : t) (y : t) (n : Z) (fact0 : infix_as x y = infix_as y x) (fact1 : 0%Z ≤ n), infix_cf (infix_as x y) n = infix_as (infix_cf x n) (infix_cf y n).
Axiom Idem : forall  (x : t), infix_pl x x = x.
Definition infix_lseq (x : t) (y : t) := infix_pl x y = y.
Theorem le_compat_add_left'vc (x : t) (y : t) (z : t) (fact0 : infix_lseq x y) : infix_lseq (infix_as z x) (infix_as z y).
Proof.
Admitted.
