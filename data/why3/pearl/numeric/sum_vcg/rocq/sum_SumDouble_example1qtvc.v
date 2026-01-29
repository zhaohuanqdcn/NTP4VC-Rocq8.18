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
Require Import Why3.real.Sum.
Require Import Why3.ieee_float.RoundingMode.
Require Import Why3.ufloat.UDouble.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.UDoubleLemmas.
Open Scope Z_scope.
Axiom abs_real_fun : (Z -> udouble) -> Z -> R.
Axiom abs_real_fun'def : forall  (f : Z -> udouble) (i : Z), abs_real_fun f i = Rabs (to_real (f i)).
Axiom exact_f : Z -> R.
Axiom f' : Z -> R.
Axiom f'_def : forall  (i : Z), f' i = Rabs (exact_f i).
Axiom f_rel_err : R.
Axiom f_cst_err : R.
Theorem example1'vc (n : Z) (f : Z -> udouble) (fact0 : 0%Z ≤ n) (fact1 : ∀(i : Z), Rle (Rabs (Rminus (to_real (f i)) (exact_f i))) (Rmult (f' i) f_rel_err)) : 0%Z ≤ n ∧ (∀(result : udouble), Rle (Rabs (Rminus (to_real result) (sum (real_fun f) 0%Z n))) (Rmult (sum (abs_real_fun f) 0%Z n) (Rmult eps (Rdefinitions.IZR n))) -> Rle (Rabs (Rminus (to_real result) (sum exact_f 0%Z n))) (Rmult (sum f' 0%Z n) (Rplus f_rel_err (Rmult (Rmult eps (Rdefinitions.IZR n)) (Rplus 1%R f_rel_err))))).
Proof.
Admitted.
