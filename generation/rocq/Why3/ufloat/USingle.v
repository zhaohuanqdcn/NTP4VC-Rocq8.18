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
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Axiom usingle : Type.
Axiom usingle_inhabited : Inhabited usingle.
Global Existing Instance usingle_inhabited.
Axiom usingle_countable : Countable usingle.
Global Existing Instance usingle_countable.
Definition eps : R := Rdiv (Rdiv 1%R 16777216) (Rplus 1%R (Rdiv 1%R 16777216)).
Definition eta : R := Rdiv 1%R 1427247692705959881058285969449495136382746624.
Axiom uround : mode -> R -> usingle.
Axiom to_real : usingle -> R.
Axiom of_int : Z -> usingle.
Axiom to_real_of_int : forall  (x : Z), to_real (of_int x) = Rdefinitions.IZR x.
Axiom uzero : usingle.
Axiom uzero_spec : to_real uzero = 0%R.
Axiom uone : usingle.
Axiom uone_spec : to_real uone = 1%R.
Axiom utwo : usingle.
Axiom utwo_spec : to_real utwo = 2%R.
Axiom eps_bounds : Rlt 0%R eps ∧ Rlt eps 1%R.
Axiom eta_bounds : Rlt 0%R eta ∧ Rlt eta 1%R.
Definition uadd (x : usingle) (y : usingle) : usingle := uround RNE (Rplus (to_real x) (to_real y)).
Axiom uadd'spec'1 : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rabs (to_real x)).
Axiom uadd'spec'0 : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rabs (to_real y)).
Axiom uadd'spec : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rmult (Rabs (Rplus (to_real x) (to_real y))) eps).
Definition usub (x : usingle) (y : usingle) : usingle := uround RNE (Rminus (to_real x) (to_real y)).
Axiom usub'spec'1 : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rabs (to_real x)).
Axiom usub'spec'0 : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rabs (to_real y)).
Axiom usub'spec : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rmult (Rabs (Rminus (to_real x) (to_real y))) eps).
Definition umul (x : usingle) (y : usingle) : usingle := uround RNE (Rmult (to_real x) (to_real y)).
Axiom umul'spec : forall  (x : usingle) (y : usingle), Rle (Rabs (Rminus (to_real (umul x y)) (Rmult (to_real x) (to_real y)))) (Rplus (Rmult (Rabs (Rmult (to_real x) (to_real y))) eps) eta).
Axiom udiv : usingle -> usingle -> usingle.
Axiom udiv'def : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R), udiv x y = uround RNE (Rdiv (to_real x) (to_real y)).
Axiom udiv'spec : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R), Rle (Rabs (Rminus (to_real (udiv x y)) (Rdiv (to_real x) (to_real y)))) (Rplus (Rmult (Rabs (Rdiv (to_real x) (to_real y))) eps) eta).
Definition uminus (x : usingle) : usingle := uround RNE (Ropp (to_real x)).
Axiom uminus'spec : forall  (x : usingle), to_real (uminus x) = Ropp (to_real x).
Axiom is_exact : (usingle -> usingle -> usingle) -> usingle -> usingle -> Prop.
Axiom udiv_exact : usingle -> usingle -> usingle.
Axiom udiv_closure : usingle -> usingle -> usingle.
Axiom udiv_closure_def : forall  (y : usingle) (y1 : usingle), udiv_closure y y1 = udiv y y1.
Axiom udiv_exact'def : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), udiv_exact x y = uround RNE (Rdiv (to_real x) (to_real y)).
Axiom udiv_exact'spec : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), Rle (Rabs (Rminus (to_real (udiv_exact x y)) (Rdiv (to_real x) (to_real y)))) eta.
Axiom infix_slsldot : usingle -> usingle -> usingle.
Axiom infix_slsldot'def : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R), infix_slsldot x y = udiv x y.
Axiom infix_slslsldot : usingle -> usingle -> usingle.
Axiom infix_slslsldot'def : forall  (y : usingle) (x : usingle) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), infix_slslsldot x y = udiv_exact x y.
Axiom u0 : usingle.
Axiom to_real_u0 : to_real u0 = 0%R.
Axiom u1 : usingle.
Axiom to_real_u1 : to_real u1 = 1%R.
Axiom u2 : usingle.
Axiom to_real_u2 : to_real u2 = 2%R.
Axiom u4 : usingle.
Axiom to_real_u4 : to_real u4 = 4%R.
Axiom u8 : usingle.
Axiom to_real_u8 : to_real u8 = 8%R.
Axiom u16 : usingle.
Axiom to_real_u16 : to_real u16 = 16%R.
Axiom u32 : usingle.
Axiom to_real_u32 : to_real u32 = 32%R.
Axiom u64 : usingle.
Axiom to_real_u64 : to_real u64 = 64%R.
Axiom u128 : usingle.
Axiom to_real_u128 : to_real u128 = 128%R.
Axiom u256 : usingle.
Axiom to_real_u256 : to_real u256 = 256%R.
Axiom u512 : usingle.
Axiom to_real_u512 : to_real u512 = 512%R.
Axiom u1024 : usingle.
Axiom to_real_u1024 : to_real u1024 = 1024%R.
Axiom u2048 : usingle.
Axiom to_real_u2048 : to_real u2048 = 2048%R.
Axiom u4096 : usingle.
Axiom to_real_u4096 : to_real u4096 = 4096%R.
Axiom u8192 : usingle.
Axiom to_real_u8192 : to_real u8192 = 8192%R.
Axiom u16384 : usingle.
Axiom to_real_u16384 : to_real u16384 = 16384%R.
Axiom u32768 : usingle.
Axiom to_real_u32768 : to_real u32768 = 32768%R.
Axiom u65536 : usingle.
Axiom to_real_u65536 : to_real u65536 = 65536%R.
Definition is_positive_power_of_2 (x : usingle) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536.
Axiom div_by_positive_power_of_2_is_exact : forall  (y : usingle) (x : usingle) (fact0 : is_positive_power_of_2 y), is_exact udiv_closure x y.
