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
Theorem usum'vc (n : Z) (f : Z -> udouble) (fact0 : 0%Z ≤ n) : let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> Rle (Rabs (Rminus (to_real u0) (sum (real_fun f) 0%Z 0%Z))) (Rmult (sum (abs_real_fun f) 0%Z 0%Z) (Rmult eps (Rdefinitions.IZR 0%Z))) ∧ (∀(s : udouble), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ Rle (Rabs (Rminus (to_real s) (sum (real_fun f) 0%Z i))) (Rmult (sum (abs_real_fun f) 0%Z i) (Rmult eps (Rdefinitions.IZR i))) -> Rle (Rabs (Rminus (to_real (uadd s (f i))) (sum (real_fun f) 0%Z (i + 1%Z)))) (Rmult (sum (abs_real_fun f) 0%Z (i + 1%Z)) (Rmult eps (Rdefinitions.IZR (i + 1%Z))))) ∧ (Rle (Rabs (Rminus (to_real s) (sum (real_fun f) 0%Z (o1 + 1%Z)))) (Rmult (sum (abs_real_fun f) 0%Z (o1 + 1%Z)) (Rmult eps (Rdefinitions.IZR (o1 + 1%Z)))) -> Rle (Rabs (Rminus (to_real s) (sum (real_fun f) 0%Z n))) (Rmult (sum (abs_real_fun f) 0%Z n) (Rmult eps (Rdefinitions.IZR n)))))) ∧ (o1 + 1%Z < 0%Z -> Rle (Rabs (Rminus (to_real u0) (sum (real_fun f) 0%Z n))) (Rmult (sum (abs_real_fun f) 0%Z n) (Rmult eps (Rdefinitions.IZR n)))).
Proof.
Admitted.
