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
Axiom r : Type.
Axiom r_inhabited : Inhabited r.
Global Existing Instance r_inhabited.
Axiom r_countable : Countable r.
Global Existing Instance r_countable.
Axiom a : Type.
Axiom a_inhabited : Inhabited a.
Global Existing Instance a_inhabited.
Axiom a_countable : Countable a.
Global Existing Instance a_countable.
Axiom rzero : r.
Axiom rone : r.
Axiom aone : a.
Axiom azero : a.
Axiom rplus : r -> r -> r.
Axiom rtimes : r -> r -> r.
Axiom ropp : r -> r.
Axiom aplus : a -> a -> a.
Axiom atimes : a -> a -> a.
Axiom aopp : a -> a.
Axiom Assoc : forall  (x : r) (y : r) (z : r), rplus (rplus x y) z = rplus x (rplus y z).
Axiom Unit_def_l : forall  (x : r), rplus rzero x = x.
Axiom Unit_def_r : forall  (x : r), rplus x rzero = x.
Axiom Inv_def_l : forall  (x : r), rplus (ropp x) x = rzero.
Axiom Inv_def_r : forall  (x : r), rplus x (ropp x) = rzero.
Axiom Comm : forall  (x : r) (y : r), rplus x y = rplus y x.
Axiom Assoc1 : forall  (x : r) (y : r) (z : r), rtimes (rtimes x y) z = rtimes x (rtimes y z).
Axiom Mul_distr_l : forall  (x : r) (y : r) (z : r), rtimes x (rplus y z) = rplus (rtimes x y) (rtimes x z).
Axiom Mul_distr_r : forall  (y : r) (z : r) (x : r), rtimes (rplus y z) x = rplus (rtimes y x) (rtimes z x).
Axiom Comm1 : forall  (x : r) (y : r), rtimes x y = rtimes y x.
Axiom Unitary : forall  (x : r), rtimes rone x = x.
Axiom NonTrivialRing : ¬ rzero = rone.
Axiom Assoc2 : forall  (x : a) (y : a) (z : a), aplus (aplus x y) z = aplus x (aplus y z).
Axiom Unit_def_l1 : forall  (x : a), aplus azero x = x.
Axiom Unit_def_r1 : forall  (x : a), aplus x azero = x.
Axiom Inv_def_l1 : forall  (x : a), aplus (aopp x) x = azero.
Axiom Inv_def_r1 : forall  (x : a), aplus x (aopp x) = azero.
Axiom Comm2 : forall  (x : a) (y : a), aplus x y = aplus y x.
Axiom Assoc3 : forall  (x : a) (y : a) (z : a), atimes (atimes x y) z = atimes x (atimes y z).
Axiom Mul_distr_l1 : forall  (x : a) (y : a) (z : a), atimes x (aplus y z) = aplus (atimes x y) (atimes x z).
Axiom Mul_distr_r1 : forall  (y : a) (z : a) (x : a), atimes (aplus y z) x = aplus (atimes y x) (atimes z x).
Axiom AUnitary : forall  (x : a), atimes aone x = atimes x aone ∧ atimes x aone = x.
Axiom ANonTrivial : ¬ azero = aone.
Axiom infix_dl : r -> a -> a.
Axiom ExtDistSumA : forall  (r1 : r) (x : a) (y : a), infix_dl r1 (aplus x y) = aplus (infix_dl r1 x) (infix_dl r1 y).
Axiom ExtDistSumR : forall  (r1 : r) (s : r) (x : a), infix_dl (rplus r1 s) x = aplus (infix_dl r1 x) (infix_dl s x).
Axiom AssocMulExt : forall  (r1 : r) (s : r) (x : a), infix_dl (rtimes r1 s) x = infix_dl r1 (infix_dl s x).
Axiom UnitExt : forall  (x : a), infix_dl rone x = x.
Axiom CommMulExt : forall  (r1 : r) (x : a) (y : a), infix_dl r1 (atimes x y) = atimes (infix_dl r1 x) y ∧ atimes (infix_dl r1 x) y = atimes x (infix_dl r1 y).
Axiom eq0 : r -> Prop.
Axiom eq0'spec : forall  (r1 : r), eq0 r1 = (r1 = rzero).
Inductive t :=
  | Var : Z -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Ext : r -> t -> t
  | Sub : t -> t -> t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Axiom asub : a -> a -> a.
Axiom asub_def : forall  (x : a) (y : a), asub x y = aplus x (aopp y).
Program Fixpoint interp (x : t) (y : Z -> a) : a :=
match x with | Var n => y n | Add x1 x2 => aplus (interp x1 y) (interp x2 y) | Mul x1 x2 => atimes (interp x1 y) (interp x2 y) | Sub x1 x2 => asub (interp x1 y) (interp x2 y) | Ext r1 x1 => infix_dl r1 (interp x1 y) end.
Admit Obligations.
Definition eq (x1 : t) (x2 : t) := ∀(y : Z -> a), interp x1 y = interp x2 y.
Inductive m :=
  | M : r -> list Z -> m.
Axiom m_inhabited : Inhabited m.
Global Existing Instance m_inhabited.
Axiom m_countable : Countable m.
Global Existing Instance m_countable.
Axiom t' : Type.
Axiom t'_inhabited : Inhabited t'.
Global Existing Instance t'_inhabited.
Axiom t'_countable : Countable t'.
Global Existing Instance t'_countable.
Program Fixpoint mon (x : list Z) (y : Z -> a) : a :=
match x with | [] => aone | cons x1 l => atimes (y x1) (mon l y) end.
Admit Obligations.
Program Fixpoint interp' (x : list m) (y : Z -> a) : a :=
match x with | [] => azero | cons (M r1 m1) l => aplus (infix_dl r1 (mon m1 y)) (interp' l y) end.
Admit Obligations.
Definition eq_mon (m1 : list Z) (m2 : list Z) := ∀(y : Z -> a), mon m1 y = mon m2 y.
Definition eq' (x1 : list m) (x2 : list m) := ∀(y : Z -> a), interp' x1 y = interp' x2 y.
Theorem interp_sum'vc (x1 : list m) (x2 : list m) (y : Z -> a) : interp' (x1 ++ x2) y = aplus (interp' x1 y) (interp' x2 y).
Admitted.
