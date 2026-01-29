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
Definition req (a : Z * Z) (b : Z * Z) := match (a, b) with | ((n1, d1), (n2, d2)) => n1 = n2 ∧ d1 = d2 ∨ ¬ d1 = 0%Z ∧ ¬ d2 = 0%Z ∧ n1 * d2 = n2 * d1 end.
Axiom req'spec : forall  (a : Z * Z) (b : Z * Z) (y : Z -> R) (fact0 : req a b), rinterp a y = rinterp b y.
Theorem rinv'vc (n : Z) (d : Z) : let a : Z * Z := (n, d) in ¬ req a (0%Z, 1%Z) -> (∀(o1 : bool), (if decide (n = 0%Z) then o1 = true else o1 = (if decide (d = 0%Z) then true else false)) -> ¬ o1 = true -> (let result : Z * Z := (d, n) in ¬ req result (0%Z, 1%Z) ∧ (∀(y : Z -> R), Rmult (rinterp result y) (rinterp a y) = 1%R))).
Proof.
Admitted.
