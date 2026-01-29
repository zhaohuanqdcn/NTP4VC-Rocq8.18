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
Require Import Why3.Cint.Cint.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal6 (i_1 : Z) (i : Z) (i_2 : Z) (i_3 : Z) (a : addr) (t : Z -> Z) : let x : Z := 4%Z + i_1 in let x_1 : Z := i - 4%Z in ¬ i = 0%Z -> ¬ i = 3%Z -> ¬ i_2 = 0%Z -> ¬ i_3 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> 0%Z ≤ i -> 0%Z ≤ i_1 -> region (base a) ≤ 0%Z -> - 2147483646%Z ≤ i -> - 2147483645%Z ≤ i -> - 2147483644%Z ≤ i -> 2%Z ≤ i -> 3%Z ≤ i -> 4%Z ≤ i -> i ≤ 65%Z -> i ≤ 65537%Z -> i ≤ 65538%Z -> i ≤ 65539%Z -> x ≤ i -> 5%Z + i_1 ≤ i -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_sint32 i_2 -> is_sint32 i_3 -> is_uint16 x_1 -> is_uint16 (i - 3%Z) -> is_uint16 (i - 2%Z) -> valid_rd t (shift a 2%Z) 1%Z -> valid_rd t (shift a (3%Z + to_sint32 x_1)) 1%Z -> (0%Z < i -> valid_rd t (shift a 0%Z) i) -> valid_rd t (shift a x) 1%Z.
Proof.
Admitted.
