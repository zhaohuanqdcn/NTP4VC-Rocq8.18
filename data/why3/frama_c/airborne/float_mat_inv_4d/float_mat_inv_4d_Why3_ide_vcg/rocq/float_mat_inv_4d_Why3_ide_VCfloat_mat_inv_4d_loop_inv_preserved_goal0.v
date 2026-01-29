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
Require Import Why3.Memory.Memory.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import Why3.Cint.Cint.
Require Import float_mat_inv_4d.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (i : Z) (r : R) (a : addr) (a_1 : addr) (t : Z -> Z) (r_1 : R) (fact0 : 0%Z ≤ i) (fact1 : Rle 0%R r) (fact2 : Rle (Rdiv 7378697629483821%R 73786976294838206464%R) r) (fact3 : region (base a) ≤ 0%Z) (fact4 : region (base a_1) ≤ 0%Z) (fact5 : i ≤ 15%Z) (fact6 : i ≤ 16%Z) (fact7 : linked t) (fact8 : is_finite32 r) (fact9 : is_finite32 r_1) (fact10 : is_sint32 i) (fact11 : is_float32 r) (fact12 : is_float32 r_1) (fact13 : is_sint32 (1%Z + i)) (fact14 : valid_rd t (shift a 0%Z) 16%Z) (fact15 : valid_rw t (shift a_1 0%Z) 16%Z) (fact16 : r_1 = r ∨ Rplus r r_1 = 0%R) : - 1%Z ≤ i.
Proof.
Admitted.
