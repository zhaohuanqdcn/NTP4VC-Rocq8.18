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
Theorem add_expr'vc (e2 : expr) (e1 : expr) : (∀(c : coeff) (i : Z), let o1 : coeff := czero in (eq o1 c -> (∀(y : cvars), interp o1 y = interp c y)) -> (∀(result : expr), (if decide (eq o1 c) then result = Cst czero else result = Term c i) -> (∀(y : Z -> a) (z : cvars), interp1 result y z = interp1 (Term c i) y z))) ∧ (∀(e : expr) (a1 : expr), atom a1 -> (match a1 with | Term x x1 => (match e with | Term x2 x3 => (if decide (x3 = x1) then ∀(o1 : coeff), (∀(v : cvars), interp o1 v = infix_pl (interp x2 v) (interp x v)) -> (∀(o2 : expr), (∀(y : Z -> a) (z : cvars), interp1 o2 y z = interp1 (Term o1 x3) y z) -> (∀(y : Z -> a) (z : cvars), interp1 o2 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else let o1 : coeff := czero in (eq x2 o1 -> (∀(y : cvars), interp x2 y = interp o1 y)) -> (∀(r : expr) (result : bool), (if decide (eq x2 o1) then (∀(y : Z -> a) (z : cvars), interp1 r y z = interp1 (Term x x1) y z) ∧ result = true else let o2 : coeff := czero in (eq x o2 -> (∀(y : cvars), interp x y = interp o2 y)) ∧ (if decide (eq x o2) then r = e ∧ result = true else r = Add e a1 ∧ result = false)) -> (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | Cst x2 => (let o1 : coeff := czero in (eq x o1 -> (∀(y : cvars), interp x y = interp o1 y)) -> (∀(r : expr) (result : bool), (if decide (eq x o1) then r = e ∧ result = true else let o2 : coeff := czero in (eq x2 o2 -> (∀(y : cvars), interp x2 y = interp o2 y)) ∧ (if decide (eq x2 o2) then r = a1 ∧ result = true else r = Add e a1 ∧ result = false)) -> (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | Add x2 x3 => ((match e with | Term _ _ => False | Add f f1 => f = x2 ∨ f1 = x2 | Cst _ => False end) ∧ atom a1) ∧ (∀(r : expr) (b : bool), (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) -> (if decide (b = true) then (match r with | Cst c => True | _ => True end) ∧ (∀(r1 : expr) (result : bool), (match r with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r1 = x3 ∧ result = true else r1 = Add r x3 ∧ result = true)) | _ => r1 = Add r x3 ∧ result = true end) -> (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | Term _ _ => False | Add f f1 => f = x3 ∨ f1 = x3 | Cst _ => False end) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : bool), (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x3 y z) (interp1 a1 y z)) -> (match r1 with | Cst c => True | _ => True end) ∧ (∀(r2 : expr) (result : bool), (match r1 with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r2 = x2 ∧ result = true else r2 = Add x2 r1 ∧ result = b1)) | _ => r2 = Add x2 r1 ∧ result = b1 end) -> (∀(y : Z -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z)))))) end) | Cst x => (match e with | Cst x1 => (∀(o1 : coeff), (∀(v : cvars), interp o1 v = infix_pl (interp x1 v) (interp x v)) -> (∀(y : Z -> a) (z : cvars), interp1 (Cst o1) y z = infix_pl (interp1 e y z) (interp1 a1 y z))) | Term x1 x2 => (let o1 : coeff := czero in (eq x1 o1 -> (∀(y : cvars), interp x1 y = interp o1 y)) -> (∀(r : expr) (result : bool), (if decide (eq x1 o1) then r = a1 ∧ result = true else let o2 : coeff := czero in (eq x o2 -> (∀(y : cvars), interp x y = interp o2 y)) ∧ (if decide (eq x o2) then r = e ∧ result = true else r = Add e a1 ∧ result = false)) -> (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e y z) (interp1 a1 y z)))) | Add x1 x2 => ((match e with | Term _ _ => False | Add f f1 => f = x1 ∨ f1 = x1 | Cst _ => False end) ∧ atom a1) ∧ (∀(r : expr) (b : bool), (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x1 y z) (interp1 a1 y z)) -> (if decide (b = true) then (match r with | Cst c => True | _ => True end) ∧ (∀(r1 : expr) (result : bool), (match r with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r1 = x2 ∧ result = true else r1 = Add r x2 ∧ result = true)) | _ => r1 = Add r x2 ∧ result = true end) -> (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | Term _ _ => False | Add f f1 => f = x2 ∨ f1 = x2 | Cst _ => False end) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : bool), (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) -> (match r1 with | Cst c => True | _ => True end) ∧ (∀(r2 : expr) (result : bool), (match r1 with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r2 = x1 ∧ result = true else r2 = Add x1 r1 ∧ result = b1)) | _ => r2 = Add x1 r1 ∧ result = b1 end) -> (∀(y : Z -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z)))))) end) | Add x x1 => (match e with | Add x2 x3 => ((match e with | Term _ _ => False | Add f f1 => f = x2 ∨ f1 = x2 | Cst _ => False end) ∧ atom a1) ∧ (∀(r : expr) (b : bool), (∀(y : Z -> a) (z : cvars), interp1 r y z = infix_pl (interp1 x2 y z) (interp1 a1 y z)) -> (if decide (b = true) then (match r with | Cst c => True | _ => True end) ∧ (∀(r1 : expr) (result : bool), (match r with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r1 = x3 ∧ result = true else r1 = Add r x3 ∧ result = true)) | _ => r1 = Add r x3 ∧ result = true end) -> (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 e y z) (interp1 a1 y z))) else ((match e with | Term _ _ => False | Add f f1 => f = x3 ∨ f1 = x3 | Cst _ => False end) ∧ atom a1) ∧ (∀(r1 : expr) (b1 : bool), (∀(y : Z -> a) (z : cvars), interp1 r1 y z = infix_pl (interp1 x3 y z) (interp1 a1 y z)) -> (match r1 with | Cst c => True | _ => True end) ∧ (∀(r2 : expr) (result : bool), (match r1 with | Cst c => (let o1 : coeff := czero in (eq c o1 -> (∀(y : cvars), interp c y = interp o1 y)) ∧ (if decide (eq c o1) then r2 = x2 ∧ result = true else r2 = Add x2 r1 ∧ result = b1)) | _ => r2 = Add x2 r1 ∧ result = b1 end) -> (∀(y : Z -> a) (z : cvars), interp1 r2 y z = infix_pl (interp1 e y z) (interp1 a1 y z)))))) | _ => False end) end)) ∧ (match e2 with | Add e1' e2' => (match e2 with | Term _ _ => False | Add f f1 => f = e1' ∨ f1 = e1' | Cst _ => False end) ∧ (∀(o1 : expr), (∀(y : Z -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e1' y z)) -> (match e2 with | Term _ _ => False | Add f f1 => f = e2' ∨ f1 = e2' | Cst _ => False end) ∧ (∀(result : expr), (∀(y : Z -> a) (z : cvars), interp1 result y z = infix_pl (interp1 o1 y z) (interp1 e2' y z)) -> (∀(y : Z -> a) (z : cvars), interp1 result y z = infix_pl (interp1 e1 y z) (interp1 e2 y z)))) | _ => atom e2 ∧ (∀(o1 : expr), (∀(y : Z -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e2 y z)) -> (∀(y : Z -> a) (z : cvars), interp1 o1 y z = infix_pl (interp1 e1 y z) (interp1 e2 y z))) end).
Admitted.
