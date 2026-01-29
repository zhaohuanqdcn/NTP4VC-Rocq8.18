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
Require Import numeric.lse.Helpers.
Require Import Why3.ieee_float.RoundingMode.
Require Import Why3.ufloat.USingle.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.USingleLemmas.
Open Scope Z_scope.
Axiom exp_of_f : (Z -> usingle) -> Z -> R.
Axiom exp_of_f'def : forall  (f : Z -> usingle) (i : Z), exp_of_f f i = exp (real_fun f i).
Theorem lse'vc (n : Z) (f' : Z -> usingle) (f : Z -> usingle) (fact0 : 0%Z < n) (fact1 : n < 8388608%Z) (fact2 : ∀(i : Z), f' i = exp_approx (f i)) : 0%Z ≤ n - 0%Z ∧ (let s : usingle := usum_rec f' 0%Z n in Rle (Rabs (Rminus (to_real s) (sum (real_fun f') 0%Z n))) (Rmult (sum (abs_real_fun f') 0%Z n) (Rmult eps (Rdefinitions.IZR (n - 0%Z)))) -> (let o1 : R := exp_error in let o2 : R := Rmult eps (Rdefinitions.IZR n) in let o3 : Z -> R := abs_real_fun f' in ((∀(i : Z), 0%Z ≤ i ∧ i < n -> Rle (Rabs (Rminus (real_fun f' i) (exp_of_f f i))) (Rplus (Rmult o1 (exp_of_f f i)) 0%R)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> Rle (Rminus (Rminus (exp_of_f f i) (Rmult o1 (exp_of_f f i))) 0%R) (o3 i) ∧ Rle (o3 i) (Rplus (Rplus (exp_of_f f i) (Rmult o1 (exp_of_f f i))) 0%R)) ∧ Rle (Rabs (Rminus (to_real s) (sum (real_fun f') 0%Z n))) (Rplus (Rmult o2 (sum o3 0%Z n)) 0%R) ∧ Rle 0%R o2 ∧ 0%Z ≤ n) ∧ (Rle (Rabs (Rminus (to_real s) (sum (exp_of_f f) 0%Z n))) (Rplus (Rmult (Rplus o1 (Rmult o2 (Rplus 1%R o1))) (sum (exp_of_f f) 0%Z n)) (Rplus (Rmult (Rmult 0%R (Rdefinitions.IZR n)) (Rplus 1%R o2)) 0%R)) -> (0%Z < n ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> Rlt 0%R (to_real (f' i)))) ∧ (Rlt 0%R (to_real (usum_rec f' 0%Z n)) -> (let o4 : Z -> R := exp_of_f f in (0%Z < n ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> Rlt 0%R (o4 i))) ∧ (Rlt 0%R (sum o4 0%Z n) ∧ sum o4 0%Z n = sum (abs_fun o4) 0%Z n -> Rlt 0%R (to_real s) ∧ (let result : usingle := log_approx s in Rle (Rabs (Rminus (to_real result) (ln (to_real s)))) (Rmult (Rabs (ln (to_real s))) log_error) -> Rle (Rabs (Rminus (to_real result) (ln (sum (exp_of_f f) 0%Z n)))) (Rminus (Rmult (Rabs (ln (sum (exp_of_f f) 0%Z n))) log_error) (Rmult (ln (Rminus 1%R (Rplus exp_error (Rmult (Rmult (Rdefinitions.IZR n) eps) (Rplus 1%R exp_error))))) (Rplus 1%R log_error)))))))))).
Proof.
Admitted.
