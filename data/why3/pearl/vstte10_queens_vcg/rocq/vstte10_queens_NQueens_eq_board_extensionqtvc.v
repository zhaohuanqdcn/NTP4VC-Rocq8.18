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
Definition eq_board (b1 : list Z) (b2 : list Z) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> nth (Z.to_nat q) b1 inhabitant = nth (Z.to_nat q) b2 inhabitant.
Theorem eq_board_extension'vc (b1 : list Z) (b2 : list Z) (pos : Z) (fact0 : eq_board b1 b2 pos) (fact1 : nth (Z.to_nat pos) b1 inhabitant = nth (Z.to_nat pos) b2 inhabitant) : eq_board b1 b2 (pos + 1%Z).
Proof.
Admitted.
