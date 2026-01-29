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
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal0 (i : Z) (i_1 : Z) (fact0 : is_sint32 i) (fact1 : is_sint32 i_1) (fact2 : if decide (48%Z ≤ i_1) then if decide (i_1 ≤ 57%Z) then i = 1%Z else i = 0%Z else i = 0%Z) : p_isdigit i_1 = (¬ i = 0%Z).
Proof.
Admitted.
