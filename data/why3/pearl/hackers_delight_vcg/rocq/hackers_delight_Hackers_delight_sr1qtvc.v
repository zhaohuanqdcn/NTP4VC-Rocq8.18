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
Require Import Why3.int.NumOf.
Require Import hackers_delight_vcg.hackers_delight.Utils.
Open Scope Z_scope.
Definition validAscii (b : bv 32%N) := Z.testbit (bv_unsigned (count b)) (bv_unsigned (0%bv : bv 32%N)) = false.
Definition toGray (bv : definitions.bv 32%N) : definitions.bv 32%N := bv_xor bv (bv_shiftr bv (1%bv : definitions.bv 32%N)).
Definition fromGray (gr : bv 32%N) : bv 32%N := let b : bv 32%N := bv_xor gr (bv_shiftr gr (1%bv : bv 32%N)) in let b1 : bv 32%N := bv_xor b (bv_shiftr b (2%bv : bv 32%N)) in let b2 : bv 32%N := bv_xor b1 (bv_shiftr b1 (4%bv : bv 32%N)) in let b3 : bv 32%N := bv_xor b2 (bv_shiftr b2 (8%bv : bv 32%N)) in bv_xor b3 (bv_shiftr b3 (16%bv : bv 32%N)).
Theorem sr1'vc (n : bv 32%N) (x : bv 32%N) (fact0 : bv_ult n w32_size_bv) : bv_or (bv_shiftr x n) (bv_shiftl (bv_opp (bv_shiftr x (31%bv : bv 32%N))) (bv_sub (31%bv : bv 32%N) n)) = bv_ashiftr x n.
Proof.
Admitted.
