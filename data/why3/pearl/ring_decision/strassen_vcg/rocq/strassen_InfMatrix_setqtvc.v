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
Axiom tzero : t.
Axiom infix_pl : t -> t -> t.
Axiom prefix_mn : t -> t.
Axiom infix_as : t -> t -> t.
Axiom Assoc : forall  (x : t) (y : t) (z : t), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : t), infix_pl tzero x = x.
Axiom Unit_def_r : forall  (x : t), infix_pl x tzero = x.
Axiom Inv_def_l : forall  (x : t), infix_pl (prefix_mn x) x = tzero.
Axiom Inv_def_r : forall  (x : t), infix_pl x (prefix_mn x) = tzero.
Axiom Comm : forall  (x : t) (y : t), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : t) (y : t) (z : t), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Mul_distr_l : forall  (x : t) (y : t) (z : t), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : t) (z : t) (x : t), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom Comm1 : forall  (x : t) (y : t), infix_as x y = infix_as y x.
Axiom one : t.
Axiom Unitary : forall  (x : t), infix_as one x = x.
Axiom NonTrivialRing : ¬ tzero = one.
Axiom mat : Type.
Axiom mat_inhabited : Inhabited mat.
Global Existing Instance mat_inhabited.
Axiom mat_countable : Countable mat.
Global Existing Instance mat_countable.
Axiom get : mat -> Z -> Z -> t.
Axiom row_zeros : mat -> Z -> Z.
Axiom col_zeros : mat -> Z -> Z.
Axiom create : (Z -> Z) -> (Z -> Z) -> (Z -> Z -> t) -> mat.
Axiom create_rowz : forall  (i : Z) (rz : Z -> Z) (cz : Z -> Z) (f : Z -> Z -> t) (fact0 : 0%Z ≤ i) (fact1 : 0%Z ≤ rz i), row_zeros (create rz cz f) i = rz i.
Axiom create_colz : forall  (j : Z) (cz : Z -> Z) (rz : Z -> Z) (f : Z -> Z -> t) (fact0 : 0%Z ≤ j) (fact1 : 0%Z ≤ cz j), col_zeros (create rz cz f) j = cz j.
Axiom create_get_ib : forall  (i : Z) (cz : Z -> Z) (j : Z) (rz : Z -> Z) (f : Z -> Z -> t) (fact0 : 0%Z ≤ i) (fact1 : i < cz j) (fact2 : 0%Z ≤ j) (fact3 : j < rz i), get (create rz cz f) i j = f i j.
Axiom create_get_oob : forall  (i : Z) (j : Z) (cz : Z -> Z) (rz : Z -> Z) (f : Z -> Z -> t) (fact0 : 0%Z ≤ i) (fact1 : 0%Z ≤ j) (fact2 : cz j ≤ i ∨ rz i ≤ j), get (create rz cz f) i j = tzero.
Axiom o1 : mat -> Z -> Z -> t -> Z -> Z -> t.
Axiom o2 : mat -> Z -> Z -> Z -> Z.
Axiom o3 : mat -> Z -> Z -> Z -> Z.
Axiom o'def : forall  (m : mat) (i : Z) (j : Z) (v : t) (i1 : Z) (j1 : Z), o1 m i j v i1 j1 = (if decide (i1 = i ∧ j1 = j) then v else get m i1 j1).
Axiom o'def1 : forall  (m : mat) (i : Z) (j : Z) (j1 : Z), o2 m i j j1 = (if decide (j1 = j) then Z.max (i + 1%Z) (col_zeros m j) else col_zeros m j1).
Axiom o'def2 : forall  (m : mat) (i : Z) (j : Z) (i1 : Z), o3 m i j i1 = (if decide (i1 = i) then Z.max (j + 1%Z) (row_zeros m i) else row_zeros m i1).
Theorem set'vc : True.
Proof.
Admitted.
