import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_Tests_g
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm1 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing : ¬(0 : ℤ) = (1 : ℤ)
axiom Assoc2 (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l1 (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r1 (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l1 (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r1 (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm2 (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc3 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l1 (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r1 (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm3 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary1 (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing1 : ¬(0 : ℤ) = (1 : ℤ)
inductive t where
  | Var : ℤ -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Cst : ℤ -> t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
noncomputable def interp : t -> (ℤ -> ℤ) -> ℤ
  | (t.Var n), y => y n
  | (t.Add x1 x2), y => interp x1 y + interp x2 y
  | (t.Mul x1 x2), y => interp x1 y * interp x2 y
  | (t.Cst c), y => c
noncomputable def eq (x1 : t) (x2 : t) := ∀(y : ℤ -> ℤ), interp x1 y = interp x2 y
inductive m where
  | M : ℤ -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> ℤ) -> ℤ
  | ([] : List ℤ), y => (1 : ℤ)
  | (List.cons x1 r), y => y x1 * mon r y
noncomputable def interp' : List m -> (ℤ -> ℤ) -> ℤ
  | ([] : List m), y => (0 : ℤ)
  | (List.cons (m.M a m1) r), y => a * mon m1 y + interp' r y
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> ℤ), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> ℤ), interp' x1 y = interp' x2 y
noncomputable def append_mon (m1 : m) (m2 : m) := match (m1, m2) with | (m.M a1 l1, m.M a2 l2) => m.M (a1 * a2) (l1 ++ l2)
axiom append_mon'spec (m1 : m) (m2 : m) (y : ℤ -> ℤ) : interp' (List.cons (append_mon m1 m2) ([] : List m)) y = interp' (List.cons m1 ([] : List m)) y * interp' (List.cons m2 ([] : List m)) y
noncomputable def mul_mon : List m -> m -> List m
  | ([] : List m), mon1 => ([] : List m)
  | (List.cons m1 r), mon1 => List.cons (append_mon m1 mon1) (mul_mon r mon1)
axiom mul_mon'spec (x : List m) (mon1 : m) (y : ℤ -> ℤ) : interp' (mul_mon x mon1) y = interp' x y * interp' (List.cons mon1 ([] : List m)) y
noncomputable def mul_devel : List m -> List m -> List m
  | ([] : List m), x2 => ([] : List m)
  | (List.cons (m.M a m1) r), x2 => mul_mon x2 (m.M a m1) ++ mul_devel r x2
axiom mul_devel'spec (x1 : List m) (x2 : List m) (y : ℤ -> ℤ) : interp' (mul_devel x1 x2) y = interp' x1 y * interp' x2 y
noncomputable def conv : t -> List m
  | (t.Var v) => List.cons (m.M (1 : ℤ) (List.cons v ([] : List ℤ))) ([] : List m)
  | (t.Add x1 x2) => conv x1 ++ conv x2
  | (t.Mul x1 x2) => mul_devel (conv x1) (conv x2)
  | (t.Cst n) => List.cons (m.M n ([] : List ℤ)) ([] : List m)
axiom conv'spec (x : t) (y : ℤ -> ℤ) : interp x y = interp' (conv x) y
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
  | (m.M a1 l1), (List.cons (m.M a2 l2) r) => if same l1 l2 = true then let s : ℤ := a1 + a2; if s = (0 : ℤ) then r else List.cons (m.M s l1) r else if le_mon l1 l2 = true then List.cons (m.M a1 l1) (List.cons (m.M a2 l2) r) else List.cons (m.M a2 l2) (insert_mon (m.M a1 l1) r)
axiom insert_mon'spec (m1 : m) (x : List m) : eq' (insert_mon m1 x) (List.cons m1 x)
noncomputable def insertion_sort_mon : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 r) => insert_mon m1 (insertion_sort_mon r)
axiom insertion_sort_mon'spec (x : List m) : eq' (insertion_sort_mon x) x
noncomputable def normalize (x : List m) := insertion_sort_mon (sort_mons x)
axiom normalize'spec (x : List m) : eq' (normalize x) x
theorem g (x : ℤ) : (x + (3 : ℤ)) * (x + (2 : ℤ)) = x * x + (5 : ℤ) * x + (6 : ℤ)
  := sorry
end ringdecision_Tests_g
