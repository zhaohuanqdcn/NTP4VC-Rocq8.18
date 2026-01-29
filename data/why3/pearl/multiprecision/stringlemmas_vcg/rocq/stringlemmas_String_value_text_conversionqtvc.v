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
Require Import multiprecision.stringlemmas.String_lemmas.
Require Import multiprecision.lemmas.Lemmas.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import Why3.mach.c.String.
Require Import Why3.mach.c.UChar.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.stringlemmas.Conversions.
Open Scope Z_scope.
Axiom abs_value_sub_text : Z -> (Z -> ascii) -> Z -> Z -> Z.
Axiom abs_value_sub_text'def : forall  (n : Z) (m : Z) (b : Z) (s : Z -> ascii), if decide (n < m) then abs_value_sub_text b s n m = text_to_num b (s (m - 1%Z)) + b * abs_value_sub_text b s n (m - 1%Z) else abs_value_sub_text b s n m = 0%Z.
Theorem text_conversion'vc (b : Z) (t : Z -> ascii) (d : Z -> bv 8%N) (n : Z) (m : Z) (fact0 : to_num b t d n m) : abs_value_sub_text b t n m = svalue_sub b d n m.
Proof.
Admitted.
