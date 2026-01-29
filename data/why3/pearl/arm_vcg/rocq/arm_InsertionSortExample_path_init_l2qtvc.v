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
Require Import arm_vcg.arm.ARM.
Open Scope Z_scope.
Axiom a : Z.
Definition separation (fp : Z) := a + 10%Z < fp - 24%Z.
Definition inv (mem : Z -> Z) := mem a = 0%Z ∧ (∀(k : Z), 1%Z ≤ k ∧ k ≤ 10%Z -> 0%Z < mem (a + k)).
Definition inv_l2 (mem : Z -> Z) (fp : Z) (l4 : Z) := (2%Z ≤ mem (fp - 16%Z) ∧ mem (fp - 16%Z) ≤ 11%Z) ∧ l4 = mem (fp - 16%Z) - 2%Z ∧ inv mem.
Theorem path_init_l2'vc (fp : Z) (mem : Z -> Z) (fact0 : separation fp) (fact1 : inv mem) : inv_l2 (fun_updt mem (fp - 16%Z) 2%Z) fp 0%Z.
Proof.
Admitted.
