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
Require Import Why3.mach.c.UChar.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Require Import multiprecision.powm.Powm.
Require Import multiprecision.compare.Compare.
Require Import multiprecision.valuation.Valuation.
Require Import multiprecision.util.Util.
Require Import multiprecision.ptralias.Alias.
Require Import multiprecision.util.UtilOld.
Require Import multiprecision.add.Add.
Require Import multiprecision.add.AddOld.
Require Import multiprecision.sub.SubOld.
Require Import multiprecision.mul.Mul.
Require Import multiprecision.mul.Mul_basecase.
Require Import multiprecision.logical.LogicalUtil.
Require Import multiprecision.logical.Logical.
Require Import multiprecision.logical.LogicalOld.
Require Import multiprecision.div.Div.
Require Import multiprecision.toom.Toom.
Require Import multiprecision.add_1.Add_1.
Require Import multiprecision.sub_1.Sub_1.
Require Import multiprecision.stringlemmas.String_lemmas.
Require Import multiprecision.base_info.BaseInfo.
Open Scope Z_scope.
Theorem wmpn_set_str'vc (sp : ptr (bv 8%N)) (sn : bv 32%N) (rp : ptr (bv 64%N)) (sz : bv 32%N) (base : bv 32%N) (fact0 : valid sp (bv_unsigned sn)) (fact1 : valid rp (bv_signed sz)) (fact2 : 0%Z < bv_signed sz) (fact3 : 0%Z ≤ bv_unsigned sn) (fact4 : Z.pow (bv_signed base) (bv_unsigned sn) ≤ Z.pow (18446744073709551615%Z + 1%Z) (bv_signed sz - 1%Z)) (fact5 : 2%Z ≤ bv_signed base) (fact6 : bv_signed base ≤ 256%Z) (fact7 : writable rp = true) (fact8 : in_base (bv_signed base) (pelts sp) (offset sp) (offset sp + bv_unsigned sn)) (fact9 : bv_unsigned sn = 0%Z -> sn = (0%bv : bv 32%N)) : if decide (sn = (0%bv : bv 32%N)) then 0%Z ≤ bv_signed sz - 1%Z ∧ value rp 0%Z = svalue (bv_signed base) sp (bv_unsigned sn) ∧ (0%Z < bv_unsigned sn -> 0%Z < bv_signed (pelts sp (offset sp)) -> 0%Z < bv_unsigned (pelts rp (offset rp + 0%Z - 1%Z))) else 0%Z ≤ bv_signed base ∧ (∀(o1 : bv 64%N), bv_unsigned o1 = bv_signed base -> (2%Z ≤ bv_unsigned o1 ∧ bv_unsigned o1 ≤ 256%Z) ∧ (∀(bits : bv 32%N), (0%Z ≤ bv_unsigned bits ∧ bv_unsigned bits ≤ 8%Z) ∧ (¬ bv_unsigned bits = 0%Z -> Z.pow 2%Z (bv_unsigned bits) = bv_unsigned o1) ∧ (bv_unsigned bits = 0%Z -> (∀(n : Z), 0%Z ≤ n -> ¬ Z.pow 2%Z n = bv_unsigned o1)) -> (bv_unsigned bits = 0%Z -> bits = (0%bv : bv 32%N)) -> (if decide (¬ bits = (0%bv : bv 32%N)) then int'32_in_bounds (bv_signed sz - 1%Z) ∧ (∀(o2 : bv 32%N), bv_signed o2 = bv_signed sz - 1%Z -> ((0%Z < bv_unsigned sn ∧ bv_unsigned sn ≤ 2147483647%Z) ∧ 0%Z < bv_signed o2 ∧ valid rp (bv_signed o2) ∧ valid sp (bv_unsigned sn) ∧ (1%Z ≤ bv_unsigned bits ∧ bv_unsigned bits ≤ 8%Z) ∧ Z.pow 2%Z (bv_unsigned bits * bv_unsigned sn) ≤ Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o2) ∧ writable rp = true ∧ in_base (Z.pow 2%Z (bv_unsigned bits)) (pelts sp) (offset sp) (offset sp + bv_unsigned sn)) ∧ (∀(rp1 : ptr (bv 64%N)), length (data rp1) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> (∀(r : bv 32%N), (0%Z ≤ bv_signed r ∧ bv_signed r ≤ bv_signed o2) ∧ value rp1 (bv_signed r) = svalue (Z.pow 2%Z (bv_unsigned bits)) sp (bv_unsigned sn) ∧ (0%Z < bv_signed r -> 0%Z < bv_unsigned (pelts rp1 (offset rp1 + bv_signed r - 1%Z))) -> bv_signed r ≤ bv_signed sz - 1%Z ∧ value rp1 (bv_signed r) = svalue (bv_signed base) sp (bv_unsigned sn) ∧ (0%Z < bv_unsigned sn -> 0%Z < bv_signed (pelts sp (offset sp)) -> 0%Z < bv_unsigned (pelts rp1 (offset rp1 + bv_signed r - 1%Z)))))) else 0%Z ≤ bv_signed base ∧ (∀(o2 : bv 64%N), bv_unsigned o2 = bv_signed base -> (2%Z ≤ bv_unsigned o2 ∧ bv_unsigned o2 ≤ 256%Z) ∧ (∀(info : wmpn_base_info), b info = bv_unsigned o2 -> 0%Z ≤ bv_signed base ∧ (∀(o3 : bv 64%N), bv_unsigned o3 = bv_signed base -> int'32_in_bounds (bv_signed sz - 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed sz - 1%Z -> ((0%Z < bv_unsigned sn ∧ bv_unsigned sn ≤ 2147483647%Z) ∧ 0%Z < bv_signed o4 ∧ valid rp (bv_signed o4) ∧ valid sp (bv_unsigned sn) ∧ (2%Z ≤ bv_unsigned o3 ∧ bv_unsigned o3 ≤ 256%Z) ∧ Z.pow (bv_unsigned o3) (bv_unsigned sn) ≤ Z.pow (18446744073709551615%Z + 1%Z) (bv_signed o4) ∧ writable rp = true ∧ in_base (bv_unsigned o3) (pelts sp) (offset sp) (offset sp + bv_unsigned sn) ∧ b info = bv_unsigned o3) ∧ (∀(rp1 : ptr (bv 64%N)), length (data rp1) = length (data rp) ∧ offset rp1 = offset rp ∧ min rp1 = min rp ∧ C.max rp1 = C.max rp ∧ writable rp1 = writable rp ∧ zone1 rp1 = zone1 rp -> (∀(r : bv 32%N), (0%Z < svalue (bv_unsigned o3) sp (bv_unsigned sn) -> 1%Z ≤ bv_signed r ∧ bv_signed r ≤ bv_signed o4) ∧ value rp1 (bv_signed r) = svalue (bv_unsigned o3) sp (bv_unsigned sn) ∧ (0%Z < svalue (bv_unsigned o3) sp (bv_unsigned sn) -> 0%Z < bv_unsigned (pelts rp1 (offset rp1 + bv_signed r - 1%Z))) ∧ (svalue (bv_unsigned o3) sp (bv_unsigned sn) = 0%Z -> bv_signed r = 1%Z) ∧ 0%Z < bv_signed r -> bv_signed r ≤ bv_signed sz - 1%Z ∧ value rp1 (bv_signed r) = svalue (bv_signed base) sp (bv_unsigned sn) ∧ (0%Z < bv_unsigned sn -> 0%Z < bv_signed (pelts sp (offset sp)) -> 0%Z < bv_unsigned (pelts rp1 (offset rp1 + bv_signed r - 1%Z)))))))))))).
Proof.
Admitted.
