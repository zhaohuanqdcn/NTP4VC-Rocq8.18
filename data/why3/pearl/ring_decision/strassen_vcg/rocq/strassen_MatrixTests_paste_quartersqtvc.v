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
Require Import Why3.int.Sum.
Require Import ring_decision.strassen.Sum_extended.
Require Import ring_decision.strassen.MaxFun.
Require Import ring_decision.strassen.InfIntMatrix.
Require Import ring_decision.strassen.InfIntMatrixDecision.
Open Scope Z_scope.
Axiom cols : mat -> Z.
Axiom rows : mat -> Z.
Axiom rows_def : forall  (r : Z) (c : Z) (a : mat) (fact0 : 0%Z ≤ r) (fact1 : 0%Z ≤ c) (fact2 : InfIntMatrix.size a r c), rows a = r.
Axiom cols_def : forall  (r : Z) (c : Z) (a : mat) (fact0 : 0%Z ≤ r) (fact1 : 0%Z ≤ c) (fact2 : InfIntMatrix.size a r c), cols a = c.
Definition is_finite (m : mat) := InfIntMatrix.size m (rows m) (cols m).
Axiom ofs2 : mat -> Z -> Z -> Z -> Z -> Z.
Axiom ofs2'def : forall  (a : mat) (ai : Z) (aj : Z) (i : Z) (j : Z), ofs2 a ai aj i j = get a (ai + i) (aj + j).
Definition block (a : mat) (r : Z) (dr : Z) (c : Z) (dc : Z) : mat := fcreate dr dc (ofs2 a r c).
Definition c_blocks (a : mat) (a1 : mat) (a2 : mat) := (0%Z ≤ cols a1 ∧ cols a1 ≤ cols a) ∧ a1 = block a 0%Z (rows a) 0%Z (cols a1) ∧ a2 = block a 0%Z (rows a) (cols a1) (cols a - cols a1).
Definition r_blocks (a : mat) (a1 : mat) (a2 : mat) := (0%Z ≤ rows a1 ∧ rows a1 ≤ rows a) ∧ a1 = block a 0%Z (rows a1) 0%Z (cols a) ∧ a2 = block a (rows a1) (rows a - rows a1) 0%Z (cols a).
Definition quarters (a : mat) (a11 : mat) (a12 : mat) (a21 : mat) (a22 : mat) := (is_finite a ∧ is_finite a11 ∧ is_finite a12 ∧ is_finite a21 ∧ is_finite a22) ∧ (rows a11 = rows a12 ∧ rows a12 = rows a21 ∧ rows a21 = rows a22 ∧ rows a22 = cols a11 ∧ cols a11 = cols a12 ∧ cols a12 = cols a21 ∧ cols a21 = cols a22) ∧ (rows a = cols a ∧ cols a = 2%Z * rows a11) ∧ a11 = block a 0%Z (rows a11) 0%Z (cols a11) ∧ a12 = block a 0%Z (rows a11) (cols a11) (cols a11) ∧ a21 = block a (rows a11) (rows a11) 0%Z (cols a11) ∧ a22 = block a (rows a11) (rows a11) (cols a11) (cols a11).
Axiom cut_quarters : mat -> mat * (mat * (mat * mat)).
Axiom cut_quarters'def : forall  (a : mat) (fact0 : is_finite a) (fact1 : rows a = cols a) (fact2 : Z.Even (rows a)), cut_quarters a = (block a 0%Z (Z.rem (rows a) 2%Z) 0%Z (Z.rem (rows a) 2%Z), (block a 0%Z (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z), (block a (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z) 0%Z (Z.rem (rows a) 2%Z), block a (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z) (Z.rem (rows a) 2%Z)))).
Axiom cut_quarters'spec : forall  (a : mat) (fact0 : is_finite a) (fact1 : rows a = cols a) (fact2 : Z.Even (rows a)), match cut_quarters a with | (a11, (a12, (a21, a22))) => quarters a a11 a12 a21 a22 end.
Axiom o1 : mat -> mat -> mat -> mat -> Z -> Z -> Z -> Z.
Axiom o'def : forall  (a11 : mat) (a12 : mat) (a21 : mat) (a22 : mat) (s : Z) (i : Z) (j : Z), o1 a11 a12 a21 a22 s i j = (if decide (i < s ∧ j < s) then get a11 i j else if decide (i < s) then get a12 i (j - s) else if decide (j < s) then get a21 (i - s) j else get a22 (i - s) (j - s)).
Theorem paste_quarters'vc (a11 : mat) (a12 : mat) (a21 : mat) (a22 : mat) (fact0 : is_finite a11) (fact1 : is_finite a12) (fact2 : is_finite a21) (fact3 : is_finite a22) (fact4 : rows a11 = rows a12) (fact5 : rows a12 = rows a21) (fact6 : rows a21 = rows a22) (fact7 : rows a22 = cols a11) (fact8 : cols a11 = cols a12) (fact9 : cols a12 = cols a21) (fact10 : cols a21 = cols a22) : let s : Z := rows a11 in quarters (fcreate (2%Z * s) (2%Z * s) (o1 a11 a12 a21 a22 s)) a11 a12 a21 a22.
Admitted.
