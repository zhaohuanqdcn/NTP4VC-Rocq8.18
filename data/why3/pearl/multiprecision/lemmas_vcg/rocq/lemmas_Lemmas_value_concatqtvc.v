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
Open Scope Z_scope.
Definition map_eq_sub_shift {α : Type} `{Inhabited α} (x : Z -> α) (y : Z -> α) (xi : Z) (yi : Z) (sz : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < sz -> x (xi + i) = y (yi + i).
Axiom value_sub : (Z -> bv 64%N) -> Z -> Z -> Z.
Axiom value_sub'def : forall  (n : Z) (m : Z) (x : Z -> bv 64%N), if decide (n < m) then value_sub x n m = bv_unsigned (x n) + (18446744073709551615%Z + 1%Z) * value_sub x (n + 1%Z) m else value_sub x n m = 0%Z.
Definition value (x : ptr (bv 64%N)) (sz : Z) : Z := value_sub (pelts x) (offset x) (offset x + sz).
Theorem value_concat'vc (n : bv 32%N) (m : bv 32%N) (x : ptr (bv 64%N)) (fact0 : 0%Z ≤ bv_signed n) (fact1 : bv_signed n ≤ bv_signed m) : value x (bv_signed m) = value x (bv_signed n) + Z.pow (18446744073709551615%Z + 1%Z) (bv_signed n) * value_sub (pelts x) (offset x + bv_signed n) (offset x + bv_signed m).
Proof.
Admitted.
