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
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Axiom l_check_bytes8 : (addr -> Z) -> addr -> Z -> Z -> addr.
Axiom fix_l_check_bytes8 : forall  (mint_0 : addr -> Z) (start_0 : addr) (value_0 : Z) (bytes_0 : Z), if decide (bytes_0 = 0%Z) then l_check_bytes8 mint_0 start_0 value_0 bytes_0 = Mk_addr 0%Z 0%Z else if decide (mint_0 start_0 = value_0) then l_check_bytes8 mint_0 (shift start_0 1%Z) value_0 (bytes_0 - 1%Z) = l_check_bytes8 mint_0 start_0 value_0 bytes_0 else l_check_bytes8 mint_0 start_0 value_0 bytes_0 = start_0.
