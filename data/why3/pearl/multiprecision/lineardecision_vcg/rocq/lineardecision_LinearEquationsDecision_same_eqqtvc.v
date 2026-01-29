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
Require Import Why3.mach.matrix.Matrix63.
Require Import Why3.debug.Debug.
Open Scope Z_scope.
Axiom coeff : Type.
Axiom coeff_inhabited : Inhabited coeff.
Global Existing Instance coeff_inhabited.
Axiom coeff_countable : Countable coeff.
Global Existing Instance coeff_countable.
Axiom a : Type.
Axiom a_inhabited : Inhabited a.
Global Existing Instance a_inhabited.
Axiom a_countable : Countable a.
Global Existing Instance a_countable.
Axiom infix_pl : a -> a -> a.
Axiom infix_as : a -> a -> a.
Axiom prefix_mn : a -> a.
Axiom azero : a.
Axiom aone : a.
Axiom ale : a -> a -> Prop.
Axiom Assoc : forall  (x : a) (y : a) (z : a), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : a), infix_pl azero x = x.
Axiom Unit_def_r : forall  (x : a), infix_pl x azero = x.
Axiom Inv_def_l : forall  (x : a), infix_pl (prefix_mn x) x = azero.
Axiom Inv_def_r : forall  (x : a), infix_pl x (prefix_mn x) = azero.
Axiom Comm : forall  (x : a) (y : a), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : a) (y : a) (z : a), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Mul_distr_l : forall  (x : a) (y : a) (z : a), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : a) (z : a) (x : a), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom Comm1 : forall  (x : a) (y : a), infix_as x y = infix_as y x.
Axiom Unitary : forall  (x : a), infix_as aone x = x.
Axiom NonTrivialRing : ¬ azero = aone.
Axiom Refl : forall  (x : a), ale x x.
Axiom Trans : forall  (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale y z), ale x z.
Axiom Antisymm : forall  (x : a) (y : a) (fact0 : ale x y) (fact1 : ale y x), x = y.
Axiom Total : forall  (x : a) (y : a), ale x y ∨ ale y x.
Axiom ZeroLessOne : ale azero aone.
Axiom CompatOrderAdd : forall  (x : a) (y : a) (z : a) (fact0 : ale x y), ale (infix_pl x z) (infix_pl y z).
Axiom CompatOrderMult : forall  (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale azero z), ale (infix_as x z) (infix_as y z).
Axiom infix_mn : a -> a -> a.
Axiom sub_def : forall  (a1 : a) (a2 : a), infix_mn a1 a2 = infix_pl a1 (prefix_mn a2).
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Axiom cvars : Type.
Axiom cvars_inhabited : Inhabited cvars.
Global Existing Instance cvars_inhabited.
Axiom cvars_countable : Countable cvars.
Global Existing Instance cvars_countable.
Axiom interp : coeff -> cvars -> a.
Axiom czero : coeff.
Axiom cone : coeff.
Axiom zero_def : forall  (y : cvars), interp czero y = azero.
Axiom one_def : forall  (y : cvars), interp cone y = aone.
Axiom eq : coeff -> coeff -> Prop.
Axiom eq'spec : forall  (a1 : coeff) (b : coeff) (y : cvars) (fact0 : eq a1 b), interp a1 y = interp b y.
Axiom vars1 : Type.
Axiom vars1_inhabited : Inhabited vars1.
Global Existing Instance vars1_inhabited.
Axiom vars1_countable : Countable vars1.
Global Existing Instance vars1_countable.
Inductive expr :=
  | Term : coeff -> Z -> expr
  | Add : expr -> expr -> expr
  | Cst : coeff -> expr.
Axiom expr_inhabited : Inhabited expr.
Global Existing Instance expr_inhabited.
Axiom expr_countable : Countable expr.
Global Existing Instance expr_countable.
Program Fixpoint valid_expr (e : expr) : Prop :=
match e with | Term _ i => 0%Z ≤ i | Cst _ => True | Add e1 e2 => valid_expr e1 ∧ valid_expr e2 end.
Admit Obligations.
Program Fixpoint expr_bound (e : expr) (b : Z) : Prop :=
match e with | Term _ i => 0%Z ≤ i ∧ i ≤ b | Cst _ => True | Add e1 e2 => expr_bound e1 b ∧ expr_bound e2 b end.
Admit Obligations.
Program Fixpoint interp1 (e : expr) (y : Z -> a) (z : cvars) : a :=
match e with | Term c v => infix_as (interp c z) (y v) | Add e1 e2 => infix_pl (interp1 e1 y z) (interp1 e2 y z) | Cst c => interp c z end.
Admit Obligations.
Axiom equality : Type.
Axiom equality_inhabited : Inhabited equality.
Global Existing Instance equality_inhabited.
Axiom equality_countable : Countable equality.
Global Existing Instance equality_countable.
Axiom context : Type.
Axiom context_inhabited : Inhabited context.
Global Existing Instance context_inhabited.
Axiom context_countable : Countable context.
Global Existing Instance context_countable.
Definition valid_eq (eq1 : expr * expr) := match eq1 with | (e1, e2) => valid_expr e1 ∧ valid_expr e2 end.
Definition eq_bound (eq1 : expr * expr) (b : Z) := match eq1 with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b end.
Program Fixpoint valid_ctx (ctx : list (expr * expr)) : Prop :=
match ctx with | [] => True | cons eq1 t => valid_eq eq1 ∧ valid_ctx t end.
Admit Obligations.
Program Fixpoint ctx_bound (ctx : list (expr * expr)) (b : Z) : Prop :=
match ctx with | [] => True | cons eq1 t => eq_bound eq1 b ∧ ctx_bound t b end.
Admit Obligations.
Definition interp_eq (g : expr * expr) (y : Z -> a) (z : cvars) : bool := if decide (match g with | (g1, g2) => interp1 g1 y z = interp1 g2 y z end) then true else false.
Program Fixpoint interp_ctx (l : list (expr * expr)) (g : expr * expr) (y : Z -> a) (z : cvars) : bool :=
if decide (match l with | [] => interp_eq g y z = true | cons h t => interp_eq h y z = true -> interp_ctx t g y z = true end) then true else false.
Admit Obligations.
Axiom infix_eqeq : array63 coeff -> array63 coeff -> Prop.
Axiom infix_eqeq'spec : forall  (a1 : array63 coeff) (b : array63 coeff) (fact0 : infix_eqeq a1 b), array63_length a1 = array63_length b ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (array63_length a1) -> eq (nth (Z.to_nat i) (array63_elts a1) inhabitant) (nth (Z.to_nat i) (array63_elts b) inhabitant)).
Axiom max_var : expr -> Z.
Axiom max_var'def : forall  (e : expr) (fact0 : valid_expr e), match e with | Term _ i => max_var e = i | Cst _ => max_var e = 0%Z | Add e1 e2 => max_var e = Z.max (max_var e1) (max_var e2) end.
Axiom max_var'spec'0 : forall  (e : expr) (fact0 : valid_expr e), 0%Z ≤ max_var e.
Axiom max_var'spec : forall  (e : expr) (fact0 : valid_expr e), expr_bound e (max_var e).
Axiom max_var_e : expr * expr -> Z.
Axiom max_var_e'def : forall  (e : expr * expr) (fact0 : valid_eq e), match e with | (e1, e2) => max_var_e e = Z.max (max_var e1) (max_var e2) end.
Axiom max_var_e'spec'0 : forall  (e : expr * expr) (fact0 : valid_eq e), 0%Z ≤ max_var_e e.
Axiom max_var_e'spec : forall  (e : expr * expr) (fact0 : valid_eq e), eq_bound e (max_var_e e).
Axiom max_var_ctx : list (expr * expr) -> Z.
Axiom max_var_ctx'def : forall  (l : list (expr * expr)) (fact0 : valid_ctx l), match l with | [] => max_var_ctx l = 0%Z | cons e t => max_var_ctx l = Z.max (max_var_e e) (max_var_ctx t) end.
Axiom max_var_ctx'spec'0 : forall  (l : list (expr * expr)) (fact0 : valid_ctx l), 0%Z ≤ max_var_ctx l.
Axiom max_var_ctx'spec : forall  (l : list (expr * expr)) (fact0 : valid_ctx l), ctx_bound l (max_var_ctx l).
Definition atom (e : expr) := match e with | Add _ _ => False | _ => True end.
Theorem same_eq'vc (eq2 : expr) (eq21 : expr) (eq1 : expr) (eq11 : expr) : let eq22 : expr * expr := (eq2, eq21) in let eq12 : expr * expr := (eq1, eq11) in ∀(e1 : expr) (c1 : coeff), (∀(y : Z -> a) (z : cvars), (interp_eq eq12 y z = true) = (interp_eq (e1, Cst c1) y z = true)) ∧ (∀(b : Z), eq_bound eq12 b -> expr_bound e1 b) -> (∀(e2 : expr) (c2 : coeff), (∀(y : Z -> a) (z : cvars), (interp_eq eq22 y z = true) = (interp_eq (e2, Cst c2) y z = true)) ∧ (∀(b : Z), eq_bound eq22 b -> expr_bound e2 b) -> (∀(e : expr), (∀(y : Z -> a) (z : cvars), infix_pl (interp1 e y z) (interp1 e2 y z) = interp1 e1 y z) -> (∀(o1 : bool), (o1 = true -> (∀(y : Z -> a) (z : cvars), interp1 e y z = azero)) -> (if decide (o1 = true) then true = (if decide (eq c1 c2) then true else false) ∧ (∀(y : cvars), interp c1 y = interp c2 y) else true = false) -> (∀(y : Z -> a) (z : cvars), interp_eq eq12 y z = true -> interp_eq eq22 y z = true)))).
Proof.
Admitted.
