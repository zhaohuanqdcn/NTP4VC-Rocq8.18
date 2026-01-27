From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import multiprecision.lemmas.Lemmas.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import Why3.mach.c.String.
Require Import Why3.mach.c.UChar.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Open Scope Z_scope.
Definition num_to_lowercase_text (d : bv 8%N) : ascii := if decide (0%Z ≤ bv_signed d ∧ bv_signed d < 36%Z) then get_str_i "0123456789abcdefghijklmnopqrstuvwxyz"%string (bv_signed d) else Ascii.ascii_of_nat (Z.to_nat (- 1%Z)).
Definition to_lowercase_text (d : Z -> bv 8%N) (t : Z -> ascii) (m : Z) (n : Z) := ∀(i : Z), n ≤ i ∧ i < m -> t i = num_to_lowercase_text (d i).
Definition num_to_uppercase_text (d : bv 8%N) : ascii := if decide (0%Z ≤ bv_signed d ∧ bv_signed d < 36%Z) then get_str_i "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"%string (bv_signed d) else Ascii.ascii_of_nat (Z.to_nat (- 1%Z)).
Definition to_uppercase_text (d : Z -> bv 8%N) (t : Z -> ascii) (m : Z) (n : Z) := ∀(i : Z), n ≤ i ∧ i < m -> t i = num_to_uppercase_text (d i).
Definition num_to_bothcase_text (d : bv 8%N) : ascii := if decide (0%Z ≤ bv_signed d ∧ bv_signed d < 62%Z) then get_str_i "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"%string (bv_signed d) else Ascii.ascii_of_nat (Z.to_nat (- 1%Z)).
Definition to_bothcase_text (d : Z -> bv 8%N) (t : Z -> ascii) (m : Z) (n : Z) := ∀(i : Z), n ≤ i ∧ i < m -> t i = num_to_bothcase_text (d i).
Theorem upsub'vc : "ABCDEFGHIJKLMNOPQRSTUVWXYZ"%string = substring 10%nat 26%nat "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"%string.
Admitted.
