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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.ptralias.Alias.
Open Scope Z_scope.
Theorem wmpn_copyd'vc (up : ptr (bv 64%N)) (n : bv 32%N) (rp : ptr (bv 64%N)) (fact0 : valid up (bv_signed n)) (fact1 : valid rp (bv_signed n)) (fact2 : writable rp = true) (fact3 : offset up ≤ offset rp ∨ offset rp + bv_signed n ≤ offset up) : int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed n - 1%Z -> (0%Z - 1%Z ≤ bv_signed o1 -> (∀(j : Z), bv_signed o1 + 1%Z ≤ j ∧ j < bv_signed n -> pelts rp (offset rp + j) = pelts up (offset up + j)) ∧ (∀(up1 : ptr (bv 64%N)) (rp1 : ptr (bv 64%N)), data up1 = data rp1 ∧ length (data rp1) = length (data up) ∧ offset up1 = offset up ∧ min up1 = min up ∧ C.max up1 = C.max up ∧ writable up1 = writable up ∧ zone1 up1 = zone1 up -> length (data rp1) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> (∀(i : bv 32%N), let i1 : Z := bv_signed i in (i1 ≤ bv_signed o1 ∧ 0%Z ≤ i1) ∧ (∀(j : Z), i1 + 1%Z ≤ j ∧ j < bv_signed n -> pelts rp1 (offset rp1 + j) = pelts up (offset up1 + j)) ∧ (∀(j : Z), j < offset rp1 ∨ offset rp1 + bv_signed n ≤ j -> pelts rp1 j = pelts rp j) ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i1 -> pelts up1 (offset up1 + j) = pelts up (offset up1 + j)) -> (min up1 ≤ offset up1 + bv_signed i ∧ offset up1 + bv_signed i < C.max up1) ∧ (let lu : bv 64%N := pelts up1 (offset up1 + bv_signed i) in (min up ≤ offset up + bv_signed i ∧ offset up + bv_signed i < C.max up) ∧ ((min rp1 ≤ offset rp1 + bv_signed i ∧ offset rp1 + bv_signed i < C.max rp1) ∧ writable rp1 = true) ∧ (∀(up2 : ptr (bv 64%N)) (rp2 : ptr (bv 64%N)), data up2 = data rp2 ∧ length (data rp2) = length (data up1) ∧ offset up2 = offset up1 ∧ min up2 = min up1 ∧ C.max up2 = C.max up1 ∧ writable up2 = writable up1 ∧ zone1 up2 = zone1 up1 -> length (data rp2) = length (data rp1) ∧ offset rp2 = offset rp1 ∧ min rp2 = min rp1 ∧ C.max rp2 = C.max rp1 ∧ writable rp2 = writable rp1 ∧ zone1 rp2 = zone1 rp1 -> pelts rp2 = fun_updt (pelts rp1) (offset rp2 + bv_signed i) lu ∧ pelts rp2 (offset rp2 + bv_signed i) = lu -> (∀(j : Z), i1 - 1%Z + 1%Z ≤ j ∧ j < bv_signed n -> pelts rp2 (offset rp2 + j) = pelts up (offset up2 + j)) ∧ (∀(j : Z), j < offset rp2 ∨ offset rp2 + bv_signed n ≤ j -> pelts rp2 j = pelts rp j) ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ i1 - 1%Z -> pelts up2 (offset up2 + j) = pelts up (offset up2 + j))))) ∧ ((∀(j : Z), 0%Z - 1%Z + 1%Z ≤ j ∧ j < bv_signed n -> pelts rp1 (offset rp1 + j) = pelts up (offset up1 + j)) ∧ (∀(j : Z), j < offset rp1 ∨ offset rp1 + bv_signed n ≤ j -> pelts rp1 j = pelts rp j) ∧ (∀(j : Z), 0%Z ≤ j ∧ j ≤ 0%Z - 1%Z -> pelts up1 (offset up1 + j) = pelts up (offset up1 + j)) -> map_eq_sub_shift (pelts rp1) (pelts up) (offset rp1) (offset up1) (bv_signed n) ∧ (∀(j : Z), j < offset rp1 ∨ offset rp1 + bv_signed n ≤ j -> pelts rp1 j = pelts rp j)))) ∧ (bv_signed o1 < 0%Z - 1%Z -> map_eq_sub_shift (pelts rp) (pelts up) (offset rp) (offset up) (bv_signed n))).
Proof.
Admitted.
