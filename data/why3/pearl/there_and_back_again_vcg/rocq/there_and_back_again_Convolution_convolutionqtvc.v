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
Theorem convolution'vc {α : Type} `{Inhabited α} (x : list α) (y : list α) (fact0 : length x = length y) : Z.of_nat (length x) ≤ Z.of_nat (length y) ∧ (∀(o1 : list (α * α)) (o2 : list α), (∃(y0 : list α), y = y0 ++ o2 ∧ length y0 = length x ∧ o1 = zip x (rev y0)) -> o1 = zip x (rev y)).
Proof.
Admitted.
