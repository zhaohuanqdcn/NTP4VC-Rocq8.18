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
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Open Scope Z_scope.
Theorem goal0 (t : Z -> Z) : let x : Z := t 0%Z in let x_1 : Z := t 1%Z in let x_2 : Z := t 2%Z in is_uint16 x -> is_uint16 x_1 -> is_uint16 x_2 -> is_uint64 x_2 -> 0%Z ≤ to_sint32 (Z.rem (to_uint64 (Z.quot (to_uint64 (11%Z + to_uint64 (25214903917%Z * lor (to_uint64 (lsl x 32%Z)) (lor (to_uint64 (lsl x_1 16%Z)) x_2)))) 281474976710656%Z)) 131072%Z).
Proof.
Admitted.
