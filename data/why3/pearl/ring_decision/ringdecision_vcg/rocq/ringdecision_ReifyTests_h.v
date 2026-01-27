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
Axiom Assoc : forall  (x : Z) (y : Z) (z : Z), x + y + z = x + (y + z).
Axiom Unit_def_l : forall  (x : Z), 0%Z + x = x.
Axiom Unit_def_r : forall  (x : Z), x + 0%Z = x.
Axiom Inv_def_l : forall  (x : Z), - x + x = 0%Z.
Axiom Inv_def_r : forall  (x : Z), x + - x = 0%Z.
Axiom Comm : forall  (x : Z) (y : Z), x + y = y + x.
Axiom Assoc1 : forall  (x : Z) (y : Z) (z : Z), x * y * z = x * (y * z).
Axiom Mul_distr_l : forall  (x : Z) (y : Z) (z : Z), x * (y + z) = x * y + x * z.
Axiom Mul_distr_r : forall  (y : Z) (z : Z) (x : Z), (y + z) * x = y * x + z * x.
Axiom Comm1 : forall  (x : Z) (y : Z), x * y = y * x.
Axiom Unitary : forall  (x : Z), 1%Z * x = x.
Axiom NonTrivialRing : ¬ 0%Z = 1%Z.
Axiom Inv_def_l1 : forall  (x : Z), - x + x = 0%Z.
Axiom Inv_def_r1 : forall  (x : Z), x + - x = 0%Z.
Axiom Mul_distr_l1 : forall  (x : Z) (y : Z) (z : Z), x * (y + z) = x * y + x * z.
Axiom Mul_distr_r1 : forall  (y : Z) (z : Z) (x : Z), (y + z) * x = y * x + z * x.
Inductive t :=
  | Var : Z -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Ext : Z -> t -> t
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
Axiom asub : Z -> Z -> Z.
Axiom asub_def : forall  (x : Z) (y : Z), asub x y = x + - y.
Program Fixpoint interp (x : t) (y : Z -> Z) : Z :=
match x with | Var n => y n | Add x1 x2 => interp x1 y + interp x2 y | Mul x1 x2 => interp x1 y * interp x2 y | Sub x1 x2 => asub (interp x1 y) (interp x2 y) | Ext r x1 => r * interp x1 y end.
Admit Obligations.
Definition eq (x1 : t) (x2 : t) := ∀(y : Z -> Z), interp x1 y = interp x2 y.
Inductive m :=
  | M : Z -> list Z -> m.
Axiom m_inhabited : Inhabited m.
Global Existing Instance m_inhabited.
Axiom m_countable : Countable m.
Global Existing Instance m_countable.
Axiom t' : Type.
Axiom t'_inhabited : Inhabited t'.
Global Existing Instance t'_inhabited.
Axiom t'_countable : Countable t'.
Global Existing Instance t'_countable.
Program Fixpoint mon (x : list Z) (y : Z -> Z) : Z :=
match x with | [] => 1%Z | cons x1 l => y x1 * mon l y end.
Admit Obligations.
Program Fixpoint interp' (x : list m) (y : Z -> Z) : Z :=
match x with | [] => 0%Z | cons (M r m1) l => r * mon m1 y + interp' l y end.
Admit Obligations.
Definition eq_mon (m1 : list Z) (m2 : list Z) := ∀(y : Z -> Z), mon m1 y = mon m2 y.
Definition eq' (x1 : list m) (x2 : list m) := ∀(y : Z -> Z), interp' x1 y = interp' x2 y.
Definition append_mon (m1 : m) (m2 : m) : m := match (m1, m2) with | (M r1 l1, M r2 l2) => M (r1 * r2) (l1 ++ l2) end.
Axiom append_mon'spec : forall  (m1 : m) (m2 : m) (y : Z -> Z), interp' (cons (append_mon m1 m2) ([] : list m)) y = interp' (cons m1 ([] : list m)) y * interp' (cons m2 ([] : list m)) y.
Program Fixpoint mul_mon (mon1 : m) (x : list m) : list m :=
match x with | [] => ([] : list m) | cons m1 l => cons (append_mon mon1 m1) (mul_mon mon1 l) end.
Admit Obligations.
Axiom mul_mon'spec : forall  (mon1 : m) (x : list m) (y : Z -> Z), interp' (mul_mon mon1 x) y = interp' (cons mon1 ([] : list m)) y * interp' x y.
Program Fixpoint mul_devel (x1 : list m) (x2 : list m) : list m :=
match x1 with | [] => ([] : list m) | cons (M r m1) l => mul_mon (M r m1) x2 ++ mul_devel l x2 end.
Admit Obligations.
Axiom mul_devel'spec : forall  (x1 : list m) (x2 : list m) (y : Z -> Z), interp' (mul_devel x1 x2) y = interp' x1 y * interp' x2 y.
Program Fixpoint ext (c : Z) (x : list m) : list m :=
match x with | [] => ([] : list m) | cons (M r m1) l => cons (M (c * r) m1) (ext c l) end.
Admit Obligations.
Axiom ext'spec : forall  (c : Z) (x : list m) (y : Z -> Z), interp' (ext c x) y = c * interp' x y.
Program Fixpoint conv (x : t) : list m :=
match x with | Var v => cons (M 1%Z (cons v ([] : list Z))) ([] : list m) | Add x1 x2 => conv x1 ++ conv x2 | Mul x1 x2 => mul_devel (conv x1) (conv x2) | Ext r x1 => ext r (conv x1) | Sub x1 x2 => conv x1 ++ ext (- 1%Z) (conv x2) end.
Admit Obligations.
Axiom conv'spec : forall  (x : t) (y : Z -> Z), interp x y = interp' (conv x) y.
Program Fixpoint le_mon (x1 : list Z) (x2 : list Z) : bool :=
match (x1, x2) with | ([], _) => (if decide (Z.of_nat (length x1) < Z.of_nat (length x2)) then true else if decide (length x1 = length x2) then true else false) | (_, []) => (if decide (Z.of_nat (length x1) < Z.of_nat (length x2)) then true else false) | (cons v1 r1, cons v2 r2) => (if decide (Z.of_nat (length x1) < Z.of_nat (length x2)) then true else if decide (length x1 = length x2) then if decide (v1 < v2) then true else if decide (v1 = v2) then le_mon r1 r2 else false else false) end.
Admit Obligations.
Program Fixpoint same (l1 : list Z) (l2 : list Z) : bool :=
match (l1, l2) with | ([], []) => true | ([], _) => false | (_, []) => false | (cons x1 l11, cons x2 l21) => (if decide (x1 = x2) then same l11 l21 else false) end.
Admit Obligations.
Axiom same'spec : forall  (l1 : list Z) (l2 : list Z) (fact0 : same l1 l2 = true), eq_mon l1 l2.
Program Fixpoint insert_mon (m1 : m) (x : list m) : list m :=
match (m1, x) with | (_, []) => cons m1 ([] : list m) | (M r1 l1, cons (M r2 l2) l) => (if decide (same l1 l2 = true) then let s : Z := r1 + r2 in if decide (s = 0%Z) then l else cons (M s l1) l else if decide (le_mon l1 l2 = true) then cons m1 x else cons (M r2 l2) (insert_mon m1 l)) end.
Admit Obligations.
Axiom insert_mon'spec : forall  (m1 : m) (x : list m), eq' (insert_mon m1 x) (cons m1 x).
Program Fixpoint insertion_sort_mon (x : list m) : list m :=
match x with | [] => ([] : list m) | cons m1 l => insert_mon m1 (insertion_sort_mon l) end.
Admit Obligations.
Axiom insertion_sort_mon'spec : forall  (x : list m), eq' (insertion_sort_mon x) x.
Axiom normalize''spec : forall  (x : list m), eq' (insertion_sort_mon x) x.
Definition normalize (x : t) : list m := insertion_sort_mon (conv x).
Axiom normalize'spec : forall  (x : t), eq' (normalize x) (conv x).
Theorem h (x : Z) (y : Z) (z : Z) : x * (y * z) = x * y * z.
Admitted.
