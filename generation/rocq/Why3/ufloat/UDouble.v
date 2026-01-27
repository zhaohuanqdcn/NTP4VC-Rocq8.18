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
Require Import Why3.ieee_float.RoundingMode.
Open Scope Z_scope.
Axiom udouble : Type.
Axiom udouble_inhabited : Inhabited udouble.
Global Existing Instance udouble_inhabited.
Axiom udouble_countable : Countable udouble.
Global Existing Instance udouble_countable.
Definition eps : R := Rdiv (Rdiv 1%R 9007199254740992) (Rplus 1%R (Rdiv 1%R 9007199254740992)).
Definition eta : R := Rdiv 1%R 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568.
Axiom uround : mode -> R -> udouble.
Axiom to_real : udouble -> R.
Axiom of_int : Z -> udouble.
Axiom to_real_of_int : forall  (x : Z), to_real (of_int x) = Rdefinitions.IZR x.
Axiom uzero : udouble.
Axiom uzero_spec : to_real uzero = 0%R.
Axiom uone : udouble.
Axiom uone_spec : to_real uone = 1%R.
Axiom utwo : udouble.
Axiom utwo_spec : to_real utwo = 2%R.
Axiom eps_bounds : Rlt 0%R eps ∧ Rlt eps 1%R.
Axiom eta_bounds : Rlt 0%R eta ∧ Rlt eta 1%R.
Definition uadd (x : udouble) (y : udouble) : udouble := uround RNE (Rplus (to_real x) (to_real y)).
Axiom uadd'spec'1 : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rabs (to_real x)).
Axiom uadd'spec'0 : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rabs (to_real y)).
Axiom uadd'spec : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (uadd x y)) (Rplus (to_real x) (to_real y)))) (Rmult (Rabs (Rplus (to_real x) (to_real y))) eps).
Definition usub (x : udouble) (y : udouble) : udouble := uround RNE (Rminus (to_real x) (to_real y)).
Axiom usub'spec'1 : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rabs (to_real x)).
Axiom usub'spec'0 : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rabs (to_real y)).
Axiom usub'spec : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (usub x y)) (Rminus (to_real x) (to_real y)))) (Rmult (Rabs (Rminus (to_real x) (to_real y))) eps).
Definition umul (x : udouble) (y : udouble) : udouble := uround RNE (Rmult (to_real x) (to_real y)).
Axiom umul'spec : forall  (x : udouble) (y : udouble), Rle (Rabs (Rminus (to_real (umul x y)) (Rmult (to_real x) (to_real y)))) (Rplus (Rmult (Rabs (Rmult (to_real x) (to_real y))) eps) eta).
Axiom udiv : udouble -> udouble -> udouble.
Axiom udiv'def : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R), udiv x y = uround RNE (Rdiv (to_real x) (to_real y)).
Axiom udiv'spec : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R), Rle (Rabs (Rminus (to_real (udiv x y)) (Rdiv (to_real x) (to_real y)))) (Rplus (Rmult (Rabs (Rdiv (to_real x) (to_real y))) eps) eta).
Definition uminus (x : udouble) : udouble := uround RNE (Ropp (to_real x)).
Axiom uminus'spec : forall  (x : udouble), to_real (uminus x) = Ropp (to_real x).
Axiom is_exact : (udouble -> udouble -> udouble) -> udouble -> udouble -> Prop.
Axiom udiv_exact : udouble -> udouble -> udouble.
Axiom udiv_closure : udouble -> udouble -> udouble.
Axiom udiv_closure_def : forall  (y : udouble) (y1 : udouble), udiv_closure y y1 = udiv y y1.
Axiom udiv_exact'def : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), udiv_exact x y = uround RNE (Rdiv (to_real x) (to_real y)).
Axiom udiv_exact'spec : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), Rle (Rabs (Rminus (to_real (udiv_exact x y)) (Rdiv (to_real x) (to_real y)))) eta.
Axiom infix_slsldot : udouble -> udouble -> udouble.
Axiom infix_slsldot'def : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R), infix_slsldot x y = udiv x y.
Axiom infix_slslsldot : udouble -> udouble -> udouble.
Axiom infix_slslsldot'def : forall  (y : udouble) (x : udouble) (fact0 : ¬ to_real y = 0%R) (fact1 : is_exact udiv_closure x y), infix_slslsldot x y = udiv_exact x y.
Axiom u0 : udouble.
Axiom to_real_u0 : to_real u0 = 0%R.
Axiom u1 : udouble.
Axiom to_real_u1 : to_real u1 = 1%R.
Axiom u2 : udouble.
Axiom to_real_u2 : to_real u2 = 2%R.
Axiom u4 : udouble.
Axiom to_real_u4 : to_real u4 = 4%R.
Axiom u8 : udouble.
Axiom to_real_u8 : to_real u8 = 8%R.
Axiom u16 : udouble.
Axiom to_real_u16 : to_real u16 = 16%R.
Axiom u32 : udouble.
Axiom to_real_u32 : to_real u32 = 32%R.
Axiom u64 : udouble.
Axiom to_real_u64 : to_real u64 = 64%R.
Axiom u128 : udouble.
Axiom to_real_u128 : to_real u128 = 128%R.
Axiom u256 : udouble.
Axiom to_real_u256 : to_real u256 = 256%R.
Axiom u512 : udouble.
Axiom to_real_u512 : to_real u512 = 512%R.
Axiom u1024 : udouble.
Axiom to_real_u1024 : to_real u1024 = 1024%R.
Axiom u2048 : udouble.
Axiom to_real_u2048 : to_real u2048 = 2048%R.
Axiom u4096 : udouble.
Axiom to_real_u4096 : to_real u4096 = 4096%R.
Axiom u8192 : udouble.
Axiom to_real_u8192 : to_real u8192 = 8192%R.
Axiom u16384 : udouble.
Axiom to_real_u16384 : to_real u16384 = 16384%R.
Axiom u32768 : udouble.
Axiom to_real_u32768 : to_real u32768 = 32768%R.
Axiom u65536 : udouble.
Axiom to_real_u65536 : to_real u65536 = 65536%R.
Definition is_positive_power_of_2 (x : udouble) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536.
Axiom div_by_positive_power_of_2_is_exact : forall  (y : udouble) (x : udouble) (fact0 : is_positive_power_of_2 y), is_exact udiv_closure x y.
