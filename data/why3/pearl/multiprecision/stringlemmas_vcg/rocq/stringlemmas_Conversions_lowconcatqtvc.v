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
Theorem lowconcat'vc : "0123456789abcdefghijklmnopqrstuvwxyz"%string = append "0123456789"%string "abcdefghijklmnopqrstuvwxyz"%string.
Proof.
Admitted.
