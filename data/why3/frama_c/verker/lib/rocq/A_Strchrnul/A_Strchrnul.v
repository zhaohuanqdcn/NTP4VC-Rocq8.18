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
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Axiom l_strchrnul : (addr -> Z) -> addr -> Z -> addr.
Axiom fix_l_strchrnul : forall  (mchar_0 : addr -> Z) (str_0 : addr) (c : Z), if decide (mchar_0 str_0 = c) then l_strchrnul mchar_0 str_0 c = str_0 else if decide (mchar_0 str_0 = 0%Z) then l_strchrnul mchar_0 str_0 c = str_0 else l_strchrnul mchar_0 (shift str_0 1%Z) c = l_strchrnul mchar_0 str_0 c.
