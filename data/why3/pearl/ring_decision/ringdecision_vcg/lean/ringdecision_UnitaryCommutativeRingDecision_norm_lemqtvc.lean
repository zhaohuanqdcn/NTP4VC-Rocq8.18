import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_UnitaryCommutativeRingDecision_norm_lemqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom infix_pl : t -> t -> t
axiom prefix_mn : t -> t
axiom infix_as : t -> t -> t
axiom Assoc (x : t) (y : t) (z : t) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : t) : infix_pl zero x = x
axiom Unit_def_r (x : t) : infix_pl x zero = x
axiom Inv_def_l (x : t) : infix_pl (prefix_mn x) x = zero
axiom Inv_def_r (x : t) : infix_pl x (prefix_mn x) = zero
axiom Comm (x : t) (y : t) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : t) (y : t) (z : t) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : t) (y : t) (z : t) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : t) (z : t) (x : t) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : t) (y : t) : infix_as x y = infix_as y x
axiom one : t
axiom Unitary (x : t) : infix_as one x = x
axiom NonTrivialRing : ¬zero = one
axiom t1 : Type
axiom inhabited_axiom_t1 : Inhabited t1
attribute [instance] inhabited_axiom_t1
axiom zero1 : t1
axiom infix_pl' : t1 -> t1 -> t1
axiom prefix_mn' : t1 -> t1
axiom infix_as' : t1 -> t1 -> t1
axiom Assoc2 (x : t1) (y : t1) (z : t1) : infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z)
axiom Unit_def_l1 (x : t1) : infix_pl' zero1 x = x
axiom Unit_def_r1 (x : t1) : infix_pl' x zero1 = x
axiom Inv_def_l1 (x : t1) : infix_pl' (prefix_mn' x) x = zero1
axiom Inv_def_r1 (x : t1) : infix_pl' x (prefix_mn' x) = zero1
axiom Comm2 (x : t1) (y : t1) : infix_pl' x y = infix_pl' y x
axiom Assoc3 (x : t1) (y : t1) (z : t1) : infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z)
axiom Mul_distr_l1 (x : t1) (y : t1) (z : t1) : infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z)
axiom Mul_distr_r1 (y : t1) (z : t1) (x : t1) : infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x)
axiom Comm3 (x : t1) (y : t1) : infix_as' x y = infix_as' y x
axiom one1 : t1
axiom Unitary1 (x : t1) : infix_as' one1 x = x
axiom NonTrivialRing1 : ¬zero1 = one1
axiom morph : t1 -> t
axiom morph_zero : morph zero1 = zero
axiom morph_one : morph one1 = one
axiom morph_add (z1 : t1) (z2 : t1) : morph (infix_pl' z1 z2) = infix_pl (morph z1) (morph z2)
axiom morph_mul (z1 : t1) (z2 : t1) : morph (infix_as' z1 z2) = infix_as (morph z1) (morph z2)
axiom morph_inv (z : t1) : morph (prefix_mn' z) = prefix_mn (morph z)
axiom eq0 : t1 -> Prop
axiom eq0'spec (x : t1) : eq0 x = (x = zero1)
inductive t2 where
  | Var : ℤ -> t2
  | Add : t2 -> t2 -> t2
  | Mul : t2 -> t2 -> t2
  | Cst : t1 -> t2
axiom inhabited_axiom_t2 : Inhabited t2
attribute [instance] inhabited_axiom_t2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
noncomputable def interp : t2 -> (ℤ -> t) -> t
  | (t2.Var n), y => y n
  | (t2.Add x1 x2), y => infix_pl (interp x1 y) (interp x2 y)
  | (t2.Mul x1 x2), y => infix_as (interp x1 y) (interp x2 y)
  | (t2.Cst c), y => morph c
noncomputable def eq (x1 : t2) (x2 : t2) := ∀(y : ℤ -> t), interp x1 y = interp x2 y
inductive m where
  | M : t1 -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> t) -> t
  | ([] : List ℤ), y => one
  | (List.cons x1 r), y => infix_as (y x1) (mon r y)
noncomputable def interp' : List m -> (ℤ -> t) -> t
  | ([] : List m), y => zero
  | (List.cons (m.M a m1) r), y => infix_pl (infix_as (morph a) (mon m1 y)) (interp' r y)
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> t), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> t), interp' x1 y = interp' x2 y
noncomputable def append_mon (m1 : m) (m2 : m) := match (m1, m2) with | (m.M a1 l1, m.M a2 l2) => m.M (infix_as' a1 a2) (l1 ++ l2)
axiom append_mon'spec (m1 : m) (m2 : m) (y : ℤ -> t) : interp' (List.cons (append_mon m1 m2) ([] : List m)) y = infix_as (interp' (List.cons m1 ([] : List m)) y) (interp' (List.cons m2 ([] : List m)) y)
noncomputable def mul_mon : List m -> m -> List m
  | ([] : List m), mon1 => ([] : List m)
  | (List.cons m1 r), mon1 => List.cons (append_mon m1 mon1) (mul_mon r mon1)
axiom mul_mon'spec (x : List m) (mon1 : m) (y : ℤ -> t) : interp' (mul_mon x mon1) y = infix_as (interp' x y) (interp' (List.cons mon1 ([] : List m)) y)
noncomputable def mul_devel : List m -> List m -> List m
  | ([] : List m), x2 => ([] : List m)
  | (List.cons (m.M a m1) r), x2 => mul_mon x2 (m.M a m1) ++ mul_devel r x2
axiom mul_devel'spec (x1 : List m) (x2 : List m) (y : ℤ -> t) : interp' (mul_devel x1 x2) y = infix_as (interp' x1 y) (interp' x2 y)
noncomputable def conv : t2 -> List m
  | (t2.Var v) => List.cons (m.M one1 (List.cons v ([] : List ℤ))) ([] : List m)
  | (t2.Add x1 x2) => conv x1 ++ conv x2
  | (t2.Mul x1 x2) => mul_devel (conv x1) (conv x2)
  | (t2.Cst n) => List.cons (m.M n ([] : List ℤ)) ([] : List m)
axiom conv'spec (x : t2) (y : ℤ -> t) : interp x y = interp' (conv x) y
noncomputable def insert : ℤ -> List ℤ -> List ℤ
  | x, ([] : List ℤ) => List.cons x ([] : List ℤ)
  | x, (List.cons y r) => if x ≤ y then List.cons x (List.cons y r) else List.cons y (insert x r)
axiom insert'spec (x : ℤ) (l : List ℤ) : eq_mon (List.cons x l) (insert x l)
noncomputable def insertion_sort : List ℤ -> List ℤ
  | ([] : List ℤ) => ([] : List ℤ)
  | (List.cons x r) => insert x (insertion_sort r)
axiom insertion_sort'spec (l : List ℤ) : eq_mon l (insertion_sort l)
noncomputable def sort_mon (x : m) := match x with | m.M a m1 => m.M a (insertion_sort m1)
axiom sort_mon'spec (x : m) : eq' (List.cons x ([] : List m)) (List.cons (sort_mon x) ([] : List m))
noncomputable def sort_mons : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 r) => List.cons (sort_mon m1) (sort_mons r)
axiom sort_mons'spec (x : List m) : eq' (sort_mons x) x
noncomputable def le_mon : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), x => if List.length ([] : List ℤ) < List.length x then true else if List.length ([] : List ℤ) = List.length x then true else false
  | x, ([] : List ℤ) => if List.length x < List.length ([] : List ℤ) then true else false
  | (List.cons v1 r1), (List.cons v2 r2) => if List.length (List.cons v1 r1) < List.length (List.cons v2 r2) then true else if List.length (List.cons v1 r1) = List.length (List.cons v2 r2) then if v1 < v2 then true else if v1 = v2 then le_mon r1 r2 else false else false
noncomputable def same : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), ([] : List ℤ) => true
  | ([] : List ℤ), x => false
  | x, ([] : List ℤ) => false
  | (List.cons x1 l11), (List.cons x2 l21) => if x1 = x2 then same l11 l21 else false
axiom same'spec (l1 : List ℤ) (l2 : List ℤ) (fact0 : same l1 l2 = true) : eq_mon l1 l2
noncomputable def insert_mon : m -> List m -> List m
  | x, ([] : List m) => List.cons x ([] : List m)
  | (m.M a1 l1), (List.cons (m.M a2 l2) r) => if same l1 l2 = true then let s : t1 := infix_pl' a1 a2; if eq0 s then r else List.cons (m.M s l1) r else if le_mon l1 l2 = true then List.cons (m.M a1 l1) (List.cons (m.M a2 l2) r) else List.cons (m.M a2 l2) (insert_mon (m.M a1 l1) r)
axiom insert_mon'spec (m1 : m) (x : List m) : eq' (insert_mon m1 x) (List.cons m1 x)
noncomputable def insertion_sort_mon : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 r) => insert_mon m1 (insertion_sort_mon r)
axiom insertion_sort_mon'spec (x : List m) : eq' (insertion_sort_mon x) x
noncomputable def normalize (x : List m) := insertion_sort_mon (sort_mons x)
axiom normalize'spec (x : List m) : eq' (normalize x) x
theorem norm_lem'vc (x1 : t2) (x2 : t2) (y : ℤ -> t) (fact0 : normalize (conv x1) = normalize (conv x2)) : interp x1 y = interp x2 y
  := sorry
end ringdecision_UnitaryCommutativeRingDecision_norm_lemqtvc
