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
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
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
Open Scope Z_scope.
Definition redc (ur : Z) (u : Z) (n : Z) (m : Z) := ZEuclid.modulo ur m = ZEuclid.modulo (Z.pow (18446744073709551615%Z + 1%Z) n * u) m.
Definition valueb (p : ptr (bv 64%N)) (nbits : Z) : Z := if decide (nbits < 0%Z) then 0%Z else let i : Z := ZEuclid.div nbits 64%Z in value p i + Z.pow (18446744073709551615%Z + 1%Z) i * ZEuclid.modulo (bv_unsigned (pelts p (offset p + i))) (Z.pow 2%Z (nbits - 64%Z * i)).
Theorem valueb_lower_bound'vc (p : ptr (bv 64%N)) (nbits : Z) : 0%Z ≤ valueb p nbits.
Proof.
Admitted.
