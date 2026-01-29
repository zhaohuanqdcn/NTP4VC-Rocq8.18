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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom rvars : Type.
Axiom rvars_inhabited : Inhabited rvars.
Global Existing Instance rvars_inhabited.
Axiom rvars_countable : Countable rvars.
Global Existing Instance rvars_countable.
Definition rinterp (t1 : Z * Z) (x_v : Z -> R) : R := match t1 with | (n, d) => Rdiv (Rdefinitions.IZR n) (Rdefinitions.IZR d) end.
Theorem req'vc (a : Z) (b : Z) (a1 : Z) (b1 : Z) (y : Z -> R) (fact0 : ∃(o1 : bool), (if decide (a = b) then o1 = (if decide (a1 = b1) then true else false) else o1 = false) ∧ (if decide (o1 = true) then True else if decide (¬ a1 = 0%Z) then if decide (¬ b1 = 0%Z) then true = (if decide (a * b1 = b * a1) then true else false) else true = false else true = false)) : rinterp (a, a1) y = rinterp (b, b1) y.
Proof.
Admitted.
