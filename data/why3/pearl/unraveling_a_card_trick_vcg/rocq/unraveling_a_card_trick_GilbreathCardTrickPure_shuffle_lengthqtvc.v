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
Open Scope Z_scope.
Axiom m : Z.
Axiom m_positive : 0%Z < m.
Axiom n : Z.
Axiom n_nonnegative : 0%Z ≤ n.
Inductive shuffle { α : Type} : list α -> list α -> list α -> Prop :=
 | Shuffle_nil_left (l : list α) : shuffle l ([] : list α) l
 | Shuffle_nil_right (l : list α) : shuffle ([] : list α) l l
 | Shuffle_cons_left (a : list α) (b : list α) (c : list α) (x : α) : shuffle a b c -> shuffle (cons x a) b (cons x c)
 | Shuffle_cons_right (a : list α) (b : list α) (c : list α) (x : α) : shuffle a b c -> shuffle a (cons x b) (cons x c).
Theorem shuffle_length'vc {α : Type} `{Inhabited α} (a : list α) (b : list α) (c : list α) (fact0 : shuffle a b c) : Z.of_nat (length a) + Z.of_nat (length b) = Z.of_nat (length c).
Admitted.
