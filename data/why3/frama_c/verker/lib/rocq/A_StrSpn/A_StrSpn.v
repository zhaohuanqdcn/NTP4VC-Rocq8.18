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
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Definition p_in_array (mchar_0 : addr -> Z) (s : addr) (c : Z) := ∃(a : addr), mchar_0 a = c ∧ addr_le s a ∧ addr_lt a (shift s (l_strlen mchar_0 s)).
Axiom l_strspn : addr -> addr -> Z.
Axiom Q_strspn_base_case : forall  (mchar_0 : addr -> Z) (s : addr) (accept_0 : addr) (fact0 : mchar_0 s = 0%Z), l_strspn s accept_0 = 0%Z.
Axiom Q_strspn_not_in_accept : forall  (mchar_0 : addr -> Z) (s : addr) (accept_0 : addr), ¬ mchar_0 s = 0%Z -> ¬ p_in_array mchar_0 accept_0 (mchar_0 s) -> l_strspn s accept_0 = 0%Z.
Axiom Q_strspn_in_accept : forall  (mchar_0 : addr -> Z) (s : addr) (accept_0 : addr), ¬ mchar_0 s = 0%Z -> p_in_array mchar_0 accept_0 (mchar_0 s) -> 1%Z + l_strspn (shift s 1%Z) accept_0 = l_strspn s accept_0.
