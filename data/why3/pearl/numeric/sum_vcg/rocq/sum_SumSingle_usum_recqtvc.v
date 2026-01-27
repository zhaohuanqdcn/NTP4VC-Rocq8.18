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
Require Import Why3.real.Sum.
Require Import Why3.ieee_float.RoundingMode.
Require Import Why3.ufloat.USingle.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.USingleLemmas.
Open Scope Z_scope.
Axiom abs_real_fun : (Z -> usingle) -> Z -> R.
Axiom abs_real_fun'def : forall  (f : Z -> usingle) (i : Z), abs_real_fun f i = Rabs (to_real (f i)).
Theorem usum_rec'vc (n : Z) (f : Z -> usingle) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> (let o1 : Z := n - 1%Z in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1)) ∧ (∀(result : usingle), (if decide (n = 0%Z) then result = uzero else let o1 : Z := n - 1%Z in ∃(o2 : usingle), Rle (Rabs (Rminus (to_real o2) (sum (real_fun f) 0%Z o1))) (Rmult (sum (abs_real_fun f) 0%Z o1) (Rmult eps (Rdefinitions.IZR o1))) ∧ result = uadd o2 (f (n - 1%Z))) -> Rle (Rabs (Rminus (to_real result) (sum (real_fun f) 0%Z n))) (Rmult (sum (abs_real_fun f) 0%Z n) (Rmult eps (Rdefinitions.IZR n)))).
Admitted.
