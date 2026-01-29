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
Require Import Why3.int.Sum.
Require Import Why3.cursor.Cursor.
Open Scope Z_scope.
Axiom get_closure : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom get_closure_def : forall  {α : Type} `{Inhabited α} (y : list α) (y1 : Z), get_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Theorem sum'vc (c : cursor Z) (fact0 : permitted c) (fact1 : visited c = ([] : list Z)) : permitted c ∧ 0%Z = sum (get_closure (visited c)) 0%Z (Z.of_nat (length (visited c))) ∧ (∀(c1 : cursor Z), permitted c1 -> permitted c1 ∧ (if decide (¬ complete c1) then (¬ complete c1 ∧ permitted c1) ∧ (∀(c2 : cursor Z) (x : Z), visited c2 = visited c1 ++ [x] ∧ permitted c2 -> permitted c2 ∧ sum (get_closure (visited c1)) 0%Z (Z.of_nat (length (visited c1))) + x = sum (get_closure (visited c2)) 0%Z (Z.of_nat (length (visited c2)))) else True)).
Proof.
Admitted.
