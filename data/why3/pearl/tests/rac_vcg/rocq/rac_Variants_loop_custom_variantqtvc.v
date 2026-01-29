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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.relations.WellFounded.
Open Scope Z_scope.
Definition p (i : Z) (i_old : Z) := i_old ≤ 2%Z ∧ i_old < i.
Axiom p_closure : Z -> Z -> bool.
Axiom p_closure_def : forall  (y : Z) (y1 : Z), (p_closure y y1 = true) = p y y1.
Theorem loop_custom_variant'vc (i : Z) : if decide (0%Z ≤ i) then p (2%Z - (i - 1%Z)) (2%Z - i) ∧ acc p_closure (2%Z - i) else ∀(i1 : Z), - 1%Z ≤ i1 -> p (2%Z - (i1 - 1%Z)) (2%Z - i1) ∧ acc p_closure (2%Z - i1).
Proof.
Admitted.
