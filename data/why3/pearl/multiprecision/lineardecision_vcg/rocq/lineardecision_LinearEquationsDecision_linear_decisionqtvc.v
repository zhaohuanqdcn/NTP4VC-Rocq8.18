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
Axiom to_list : forall {α : Type} `{Inhabited α}, array63 α -> bv 63%N -> bv 63%N -> list α.
Theorem linear_decision'vc (g : expr) (g1 : expr) (l : list (expr * expr)) : let g2 : expr * expr := (g, g1) in valid_ctx l ∧ valid_eq g2 ∧ Z.of_nat (length l) < 100000%Z -> valid_ctx l ∧ (let o1 : Z := max_var_ctx l in 0%Z ≤ o1 ∧ ctx_bound l o1 -> valid_eq g2 ∧ (let o2 : Z := max_var_e g2 in 0%Z ≤ o2 ∧ eq_bound g2 o2 -> (let nv : Z := Z.max o2 o1 in (¬ 100000%Z ≤ nv -> nv < 100000%Z) ∧ (nv < 100000%Z -> int'63_in_bounds nv ∧ (∀(nv1 : bv 63%N), bv_signed nv1 = nv -> (let o3 : Z := Z.of_nat (length l) in int'63_in_bounds o3 ∧ (∀(ll : bv 63%N), bv_signed ll = o3 -> int'63_in_bounds (bv_signed nv1 + 1%Z) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed nv1 + 1%Z -> (0%Z ≤ bv_signed ll ∧ 0%Z ≤ bv_signed o4) ∧ (∀(a1 : matrix coeff), rows a1 = ll ∧ columns a1 = o4 ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < bv_signed ll) ∧ 0%Z ≤ j ∧ j < bv_signed o4 -> get_unsafe a1 i j = czero) -> 0%Z ≤ bv_signed ll ∧ (∀(b : array63 coeff), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed ll -> nth (Z.to_nat i) (array63_elts b) inhabitant = czero) ∧ array63_length b = ll -> int'63_in_bounds (bv_signed nv1 + 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed nv1 + 1%Z -> 0%Z ≤ bv_signed o5 ∧ (∀(v : array63 coeff), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed o5 -> nth (Z.to_nat i) (array63_elts v) inhabitant = czero) ∧ array63_length v = o5 -> (∀(a2 : matrix coeff), rows a2 = rows a1 ∧ columns a2 = columns a1 -> (∀(ex : expr) (i : bv 63%N), (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length l)) ∧ expr_bound ex (bv_signed nv1) -> (match ex with | Cst c => True | Term c j => int'63_in_bounds j ∧ (∀(j1 : bv 63%N), bv_signed j1 = j -> valid_index a2 i j1 ∧ (∀(o6 : coeff), (∀(v1 : cvars), interp o6 v1 = infix_pl (interp (get_unsafe a2 (bv_signed i) (bv_signed j1)) v1) (interp c v1)) -> valid_index a2 i j1)) | Add e1 e2 => ((match ex with | Term _ _ => False | Add f f1 => f = e1 ∨ f1 = e1 | Cst _ => False end) ∧ (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length l)) ∧ expr_bound e1 (bv_signed nv1)) ∧ (match ex with | Term _ _ => False | Add f f1 => f = e2 ∨ f1 = e2 | Cst _ => False end) ∧ (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length l)) ∧ expr_bound e2 (bv_signed nv1) end))) ∧ (∀(b1 : array63 coeff), array63_length b1 = array63_length b -> (∀(ctx : list (expr * expr)) (i : bv 63%N), ctx_bound ctx (bv_signed nv1) ∧ Z.of_nat (length l) - bv_signed i = Z.of_nat (length ctx) ∧ 0%Z ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (length l) -> (match ctx with | [] => True | cons e t => (∀(ex : expr) (c : coeff), (∀(y : Z -> a) (z : cvars), (interp_eq e y z = true) = (interp_eq (ex, Cst c) y z = true)) ∧ (∀(b2 : Z), eq_bound e b2 -> expr_bound ex b2) -> (let o6 : coeff := czero in (eq c o6 -> (∀(y : cvars), interp c y = interp o6 y)) -> (if decide (¬ eq c o6) then (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length b1)) ∧ (∀(o7 : coeff), (∀(v1 : cvars), interp o7 v1 = infix_pl (interp (nth (Z.to_nat (bv_signed i)) (array63_elts b1) inhabitant) v1) (interp c v1)) -> (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length b1)) ∧ (∀(b2 : array63 coeff), array63_length b2 = array63_length b1 -> array63_elts b2 = set_list (array63_elts b1) (Z.to_nat (bv_signed i)) o7 -> ((0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length l)) ∧ expr_bound ex (bv_signed nv1)) ∧ int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o8 : bv 63%N), bv_signed o8 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length l) - bv_signed i ∧ Z.of_nat (length l) - bv_signed o8 < Z.of_nat (length l) - bv_signed i) ∧ ctx_bound t (bv_signed nv1) ∧ Z.of_nat (length l) - bv_signed o8 = Z.of_nat (length t) ∧ 0%Z ≤ bv_signed o8 ∧ bv_signed o8 ≤ Z.of_nat (length l)))) ∧ int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o7 : bv 63%N), bv_signed o7 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length l) - bv_signed i ∧ Z.of_nat (length l) - bv_signed o7 < Z.of_nat (length l) - bv_signed i) ∧ ctx_bound t (bv_signed nv1) ∧ Z.of_nat (length l) - bv_signed o7 = Z.of_nat (length t) ∧ 0%Z ≤ bv_signed o7 ∧ bv_signed o7 ≤ Z.of_nat (length l)) else ((0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length l)) ∧ expr_bound ex (bv_signed nv1)) ∧ int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o7 : bv 63%N), bv_signed o7 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length l) - bv_signed i ∧ Z.of_nat (length l) - bv_signed o7 < Z.of_nat (length l) - bv_signed i) ∧ ctx_bound t (bv_signed nv1) ∧ Z.of_nat (length l) - bv_signed o7 = Z.of_nat (length t) ∧ 0%Z ≤ bv_signed o7 ∧ bv_signed o7 ≤ Z.of_nat (length l))))) ∧ int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o6 : bv 63%N), bv_signed o6 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length l) - bv_signed i ∧ Z.of_nat (length l) - bv_signed o6 < Z.of_nat (length l) - bv_signed i) ∧ ctx_bound t (bv_signed nv1) ∧ Z.of_nat (length l) - bv_signed o6 = Z.of_nat (length t) ∧ 0%Z ≤ bv_signed o6 ∧ bv_signed o6 ≤ Z.of_nat (length l)) end))) ∧ (∀(v1 : array63 coeff), array63_length v1 = array63_length v -> (∀(ex : expr), expr_bound ex (bv_signed nv1) -> (match ex with | Cst c => True | Term c j => int'63_in_bounds j ∧ (∀(j1 : bv 63%N), bv_signed j1 = j -> (0%Z ≤ bv_signed j1 ∧ bv_signed j1 < bv_signed (array63_length v1)) ∧ (∀(o6 : coeff), (∀(v2 : cvars), interp o6 v2 = infix_pl (interp (nth (Z.to_nat (bv_signed j1)) (array63_elts v1) inhabitant) v2) (interp c v2)) -> 0%Z ≤ bv_signed j1 ∧ bv_signed j1 < bv_signed (array63_length v1))) | Add e1 e2 => ((match ex with | Term _ _ => False | Add f f1 => f = e1 ∨ f1 = e1 | Cst _ => False end) ∧ expr_bound e1 (bv_signed nv1)) ∧ (match ex with | Term _ _ => False | Add f f1 => f = e2 ∨ f1 = e2 | Cst _ => False end) ∧ expr_bound e2 (bv_signed nv1) end))) ∧ (ctx_bound l (bv_signed nv1) ∧ Z.of_nat (length l) - 0%Z = Z.of_nat (length l) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length l)) ∧ (∀(b1 : array63 coeff) (a2 : matrix coeff), array63_length b1 = array63_length b -> rows a2 = rows a1 ∧ columns a2 = columns a1 -> (∀(ex : expr) (d : coeff), (∀(y : Z -> a) (z : cvars), (interp_eq g2 y z = true) = (interp_eq (ex, Cst d) y z = true)) ∧ (∀(b2 : Z), eq_bound g2 b2 -> expr_bound ex b2) -> expr_bound ex (bv_signed nv1) ∧ (∀(v1 : array63 coeff), array63_length v1 = array63_length v -> (rows a2 = array63_length b1 ∧ bv_signed (columns a2) < 4611686018427387903%Z) ∧ (∀(ab : matrix coeff), rows ab = rows a2 ∧ bv_signed (columns ab) = bv_signed (columns a2) + 1%Z ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < bv_signed (rows a2) -> 0%Z ≤ j ∧ j < bv_signed (columns a2) -> elts ab i j = elts a2 i j) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (rows a2) -> elts ab i (bv_signed (columns a2)) = nth (Z.to_nat i) (array63_elts b1) inhabitant) -> bv_signed (array63_length v1) < 4611686018427387903%Z ∧ (∀(cd : array63 coeff), bv_signed (array63_length cd) = bv_signed (array63_length v1) + 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < bv_signed (array63_length v1) -> nth (Z.to_nat k) (array63_elts cd) inhabitant = nth (Z.to_nat k) (array63_elts v1) inhabitant) ∧ nth (Z.to_nat (bv_signed (array63_length v1))) (array63_elts cd) inhabitant = d -> (∀(ab' : matrix coeff), rows ab' = columns ab ∧ columns ab' = rows ab -> (rows ab' = array63_length cd ∧ bv_signed (columns ab') < 4611686018427387903%Z) ∧ (∀(o6 : matrix coeff), rows o6 = rows ab' ∧ bv_signed (columns o6) = bv_signed (columns ab') + 1%Z ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < bv_signed (rows ab') -> 0%Z ≤ j ∧ j < bv_signed (columns ab') -> elts o6 i j = elts ab' i j) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (rows ab') -> elts o6 i (bv_signed (columns ab')) = nth (Z.to_nat i) (array63_elts cd) inhabitant) -> (1%Z ≤ bv_signed (rows o6) ∧ 1%Z ≤ bv_signed (columns o6)) ∧ (∀(o7 : matrix coeff), rows o7 = rows o6 ∧ columns o7 = columns o6 -> (∀(o8 : option (array63 coeff)), (match o8 with | Some r => array63_length r = columns o7 | None => True end) -> (match o8 with | Some r => (0%Z ≤ 0%Z ∧ bv_signed ll ≤ bv_signed (array63_length r)) ∧ ((∀(y : Z -> a) (z : cvars), interp_ctx l g2 y z = true) -> (∀(y : Z -> a) (z : cvars), interp_ctx l g2 y z = true)) | None => True end)))))))))))))))))))))).
Proof.
Admitted.
