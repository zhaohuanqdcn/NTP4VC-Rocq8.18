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
Theorem gauss_jordan'vc (a1 : matrix coeff) (fact0 : 1%Z ≤ bv_signed (rows a1)) (fact1 : 1%Z ≤ bv_signed (columns a1)) : let n : bv 63%N := rows a1 in let m : bv 63%N := columns a1 in (∀(a2 : matrix coeff), rows a2 = rows a1 ∧ columns a2 = columns a1 -> (∀(i : bv 63%N) (j : bv 63%N), (0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed n) ∧ 0%Z ≤ bv_signed j ∧ bv_signed j < bv_signed m -> (¬ bv_signed n ≤ bv_signed i -> (let o1 : coeff := czero in valid_index a2 i j ∧ (let o2 : coeff := get_unsafe a2 (bv_signed i) (bv_signed j) in (eq o2 o1 -> (∀(y : cvars), interp o2 y = interp o1 y)) -> eq o2 o1 -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed o3 < bv_signed n - bv_signed i) ∧ (0%Z ≤ bv_signed o3 ∧ bv_signed o3 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed j ∧ bv_signed j < bv_signed m)))) ∧ (∀(result : bv 63%N), (if decide (bv_signed n ≤ bv_signed i) then result = n else let o1 : coeff := czero in let o2 : coeff := get_unsafe a2 (bv_signed i) (bv_signed j) in (eq o2 o1 -> (∀(y : cvars), interp o2 y = interp o1 y)) ∧ (if decide (eq o2 o1) then ∃(o3 : bv 63%N), bv_signed o3 = bv_signed i + 1%Z ∧ (bv_signed o3 ≤ bv_signed result ∧ bv_signed result ≤ bv_signed n) ∧ (bv_signed result < bv_signed n -> ¬ eq (elts a2 (bv_signed result) (bv_signed j)) czero) else result = i)) -> (bv_signed i ≤ bv_signed result ∧ bv_signed result ≤ bv_signed n) ∧ (bv_signed result < bv_signed n -> ¬ eq (elts a2 (bv_signed result) (bv_signed j)) czero)))) ∧ 0%Z ≤ bv_signed n ∧ (∀(pivots : array63 (bv 63%N)), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed n -> nth (Z.to_nat i) (array63_elts pivots) inhabitant = (0%bv : bv 63%N)) ∧ array63_length pivots = n -> int'63_in_bounds (bv_signed m - 2%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed m - 2%Z -> (0%Z ≤ bv_signed o1 + 1%Z -> ((- 1%Z ≤ - 1%Z ∧ - 1%Z < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ - 1%Z -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ - 1%Z -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots) inhabitant)) ∧ (0%Z ≤ - 1%Z -> bv_signed (nth (Z.to_nat (- 1%Z)) (array63_elts pivots) inhabitant) < 0%Z)) ∧ (∀(r : bv 63%N) (pivots1 : array63 (bv 63%N)) (a2 : matrix coeff), array63_length pivots1 = array63_length pivots -> rows a2 = rows a1 ∧ columns a2 = columns a1 -> (∀(j : bv 63%N), let j1 : Z := bv_signed j in (0%Z ≤ j1 ∧ j1 ≤ bv_signed o1) ∧ (- 1%Z ≤ bv_signed r ∧ bv_signed r < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed r -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots1) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed r -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots1) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots1) inhabitant)) ∧ (0%Z ≤ bv_signed r -> bv_signed (nth (Z.to_nat (bv_signed r)) (array63_elts pivots1) inhabitant) < j1) -> int'63_in_bounds (bv_signed r + 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed r + 1%Z -> ((0%Z ≤ bv_signed o2 ∧ bv_signed o2 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed j ∧ bv_signed j < bv_signed m) ∧ (∀(k : bv 63%N), (bv_signed o2 ≤ bv_signed k ∧ bv_signed k ≤ bv_signed n) ∧ (bv_signed k < bv_signed n -> ¬ eq (elts a2 (bv_signed k) (bv_signed j)) czero) -> (if decide (bv_signed k < bv_signed n) then int'63_in_bounds (bv_signed r + 1%Z) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed r + 1%Z -> (0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (array63_length pivots1)) ∧ (∀(pivots2 : array63 (bv 63%N)), array63_length pivots2 = array63_length pivots1 -> array63_elts pivots2 = set_list (array63_elts pivots1) (Z.to_nat (bv_signed o3)) j -> valid_index a2 k j ∧ ¬ eq (get_unsafe a2 (bv_signed k) (bv_signed j)) czero ∧ (∀(o4 : coeff), ¬ eq o4 czero -> ((0%Z ≤ bv_signed k ∧ bv_signed k < bv_signed (rows a2)) ∧ ¬ eq o4 czero) ∧ (∀(a3 : matrix coeff), rows a3 = rows a2 ∧ columns a3 = columns a2 -> (bv_signed k = bv_signed o3 -> k = o3) -> (if decide (¬ k = o3) then ((0%Z ≤ bv_signed k ∧ bv_signed k < bv_signed (rows a3)) ∧ 0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (rows a3)) ∧ (∀(a4 : matrix coeff), rows a4 = rows a3 ∧ columns a4 = columns a3 -> int'63_in_bounds (bv_signed n - 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed n - 1%Z -> (0%Z ≤ bv_signed o5 + 1%Z -> (∀(a5 : matrix coeff), rows a5 = rows a4 ∧ columns a5 = columns a4 -> (∀(i : bv 63%N), let i1 : Z := bv_signed i in 0%Z ≤ i1 ∧ i1 ≤ bv_signed o5 -> (bv_signed i = bv_signed o3 -> i = o3) -> ¬ i = o3 -> valid_index a5 i j ∧ (∀(o6 : coeff), (∀(v : cvars), interp o6 v = prefix_mn (interp (get_unsafe a5 (bv_signed i) (bv_signed j)) v)) -> (0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (rows a5)) ∧ 0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (rows a5))) ∧ (- 1%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed o3 -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots2) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots2) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots2) inhabitant)) ∧ (0%Z ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat (bv_signed o3)) (array63_elts pivots2) inhabitant) < j1 + 1%Z))) ∧ (bv_signed o5 + 1%Z < 0%Z -> (- 1%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed o3 -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots2) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots2) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots2) inhabitant)) ∧ (0%Z ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat (bv_signed o3)) (array63_elts pivots2) inhabitant) < j1 + 1%Z)))) else int'63_in_bounds (bv_signed n - 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed n - 1%Z -> (0%Z ≤ bv_signed o5 + 1%Z -> (∀(a4 : matrix coeff), rows a4 = rows a3 ∧ columns a4 = columns a3 -> (∀(i : bv 63%N), let i1 : Z := bv_signed i in 0%Z ≤ i1 ∧ i1 ≤ bv_signed o5 -> (bv_signed i = bv_signed o3 -> i = o3) -> ¬ i = o3 -> valid_index a4 i j ∧ (∀(o6 : coeff), (∀(v : cvars), interp o6 v = prefix_mn (interp (get_unsafe a4 (bv_signed i) (bv_signed j)) v)) -> (0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (rows a4)) ∧ 0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (rows a4))) ∧ (- 1%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed o3 -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots2) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots2) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots2) inhabitant)) ∧ (0%Z ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat (bv_signed o3)) (array63_elts pivots2) inhabitant) < j1 + 1%Z))) ∧ (bv_signed o5 + 1%Z < 0%Z -> (- 1%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed o3 -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots2) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots2) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots2) inhabitant)) ∧ (0%Z ≤ bv_signed o3 -> bv_signed (nth (Z.to_nat (bv_signed o3)) (array63_elts pivots2) inhabitant) < j1 + 1%Z)))))))) else (- 1%Z ≤ bv_signed r ∧ bv_signed r < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed r -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots1) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed r -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots1) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots1) inhabitant)) ∧ (0%Z ≤ bv_signed r -> bv_signed (nth (Z.to_nat (bv_signed r)) (array63_elts pivots1) inhabitant) < j1 + 1%Z))))) ∧ ((- 1%Z ≤ bv_signed r ∧ bv_signed r < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed r -> 0%Z ≤ bv_signed (nth (Z.to_nat i) (array63_elts pivots1) inhabitant)) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 ≤ bv_signed r -> bv_signed (nth (Z.to_nat i1) (array63_elts pivots1) inhabitant) < bv_signed (nth (Z.to_nat i2) (array63_elts pivots1) inhabitant)) ∧ (0%Z ≤ bv_signed r -> bv_signed (nth (Z.to_nat (bv_signed r)) (array63_elts pivots1) inhabitant) < bv_signed o1 + 1%Z) -> ¬ bv_signed r < 0%Z -> 0%Z ≤ bv_signed m ∧ (∀(v : array63 coeff), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed m -> nth (Z.to_nat i) (array63_elts v) inhabitant = czero) ∧ array63_length v = m -> (0%Z ≤ bv_signed r + 1%Z -> (∀(v1 : array63 coeff), array63_length v1 = array63_length v -> (∀(i : bv 63%N), let i1 : Z := bv_signed i in 0%Z ≤ i1 ∧ i1 ≤ bv_signed r -> int'63_in_bounds (bv_signed m - 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed m - 1%Z -> valid_index a2 i o2 ∧ (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length pivots1)) ∧ (let o3 : bv 63%N := nth (Z.to_nat (bv_signed i)) (array63_elts pivots1) inhabitant in 0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (array63_length v1)))) ∧ array63_length v1 = columns a2)) ∧ (bv_signed r + 1%Z < 0%Z -> array63_length v = columns a2))))) ∧ (bv_signed o1 + 1%Z < 0%Z -> ¬ - 1%Z < 0%Z -> 0%Z ≤ bv_signed m ∧ (∀(v : array63 coeff), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed m -> nth (Z.to_nat i) (array63_elts v) inhabitant = czero) ∧ array63_length v = m -> (0%Z ≤ - 1%Z + 1%Z -> (∀(v1 : array63 coeff), array63_length v1 = array63_length v -> (∀(i : bv 63%N), let i1 : Z := bv_signed i in 0%Z ≤ i1 ∧ i1 ≤ - 1%Z -> int'63_in_bounds (bv_signed m - 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed m - 1%Z -> valid_index a1 i o2 ∧ (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length pivots)) ∧ (let o3 : bv 63%N := nth (Z.to_nat (bv_signed i)) (array63_elts pivots) inhabitant in 0%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed (array63_length v1)))) ∧ array63_length v1 = columns a1)) ∧ (- 1%Z + 1%Z < 0%Z -> array63_length v = columns a1))))).
Admitted.
