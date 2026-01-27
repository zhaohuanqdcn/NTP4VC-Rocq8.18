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
Require Import Why3.map.MapEq.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Open Scope Z_scope.
Theorem cursor'vc (o1 : ptr (bv 32%N)) (fact0 : is_not_null o1) (fact1 : plength o1 = 1%Z) (fact2 : offset o1 = 0%Z) (fact3 : min o1 = 0%Z) (fact4 : C.max o1 = plength o1) (fact5 : writable o1 = true) (fact6 : bv_signed (nth 0%nat (data o1) inhabitant) = 0%Z) : 0%Z < 1%Z ∧ (0%Z < 1%Z -> plength o1 = 1%Z ∧ offset o1 = 0%Z ∧ valid o1 1%Z ∧ min o1 = 0%Z ∧ C.max o1 = 1%Z ∧ is_not_null o1 ∧ writable o1 = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 1%Z -> bv_signed (nth (Z.to_nat i) (data o1) inhabitant) < 42%Z)).
Admitted.
