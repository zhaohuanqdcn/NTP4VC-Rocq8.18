import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_AssocAlgebraDecision_norm_lem2qtvc
axiom r : Type
axiom inhabited_axiom_r : Inhabited r
attribute [instance] inhabited_axiom_r
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom rzero : r
axiom rone : r
axiom aone : a
axiom azero : a
axiom rplus : r -> r -> r
axiom rtimes : r -> r -> r
axiom ropp : r -> r
axiom aplus : a -> a -> a
axiom atimes : a -> a -> a
axiom aopp : a -> a
axiom Assoc (x : r) (y : r) (z : r) : rplus (rplus x y) z = rplus x (rplus y z)
axiom Unit_def_l (x : r) : rplus rzero x = x
axiom Unit_def_r (x : r) : rplus x rzero = x
axiom Inv_def_l (x : r) : rplus (ropp x) x = rzero
axiom Inv_def_r (x : r) : rplus x (ropp x) = rzero
axiom Comm (x : r) (y : r) : rplus x y = rplus y x
axiom Assoc1 (x : r) (y : r) (z : r) : rtimes (rtimes x y) z = rtimes x (rtimes y z)
axiom Mul_distr_l (x : r) (y : r) (z : r) : rtimes x (rplus y z) = rplus (rtimes x y) (rtimes x z)
axiom Mul_distr_r (y : r) (z : r) (x : r) : rtimes (rplus y z) x = rplus (rtimes y x) (rtimes z x)
axiom Comm1 (x : r) (y : r) : rtimes x y = rtimes y x
axiom Unitary (x : r) : rtimes rone x = x
axiom NonTrivialRing : ¬rzero = rone
axiom Assoc2 (x : a) (y : a) (z : a) : aplus (aplus x y) z = aplus x (aplus y z)
axiom Unit_def_l1 (x : a) : aplus azero x = x
axiom Unit_def_r1 (x : a) : aplus x azero = x
axiom Inv_def_l1 (x : a) : aplus (aopp x) x = azero
axiom Inv_def_r1 (x : a) : aplus x (aopp x) = azero
axiom Comm2 (x : a) (y : a) : aplus x y = aplus y x
axiom Assoc3 (x : a) (y : a) (z : a) : atimes (atimes x y) z = atimes x (atimes y z)
axiom Mul_distr_l1 (x : a) (y : a) (z : a) : atimes x (aplus y z) = aplus (atimes x y) (atimes x z)
axiom Mul_distr_r1 (y : a) (z : a) (x : a) : atimes (aplus y z) x = aplus (atimes y x) (atimes z x)
axiom AUnitary (x : a) : atimes aone x = atimes x aone ∧ atimes x aone = x
axiom ANonTrivial : ¬azero = aone
axiom infix_dl : r -> a -> a
axiom ExtDistSumA (r1 : r) (x : a) (y : a) : infix_dl r1 (aplus x y) = aplus (infix_dl r1 x) (infix_dl r1 y)
axiom ExtDistSumR (r1 : r) (s : r) (x : a) : infix_dl (rplus r1 s) x = aplus (infix_dl r1 x) (infix_dl s x)
axiom AssocMulExt (r1 : r) (s : r) (x : a) : infix_dl (rtimes r1 s) x = infix_dl r1 (infix_dl s x)
axiom UnitExt (x : a) : infix_dl rone x = x
axiom CommMulExt (r1 : r) (x : a) (y : a) : infix_dl r1 (atimes x y) = atimes (infix_dl r1 x) y ∧ atimes (infix_dl r1 x) y = atimes x (infix_dl r1 y)
axiom eq0 : r -> Prop
axiom eq0'spec (r1 : r) : eq0 r1 = (r1 = rzero)
inductive t where
  | Var : ℤ -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Ext : r -> t -> t
  | Sub : t -> t -> t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom asub : a -> a -> a
axiom asub_def (x : a) (y : a) : asub x y = aplus x (aopp y)
noncomputable def interp : t -> (ℤ -> a) -> a
  | (t.Var n), y => y n
  | (t.Add x1 x2), y => aplus (interp x1 y) (interp x2 y)
  | (t.Mul x1 x2), y => atimes (interp x1 y) (interp x2 y)
  | (t.Sub x1 x2), y => asub (interp x1 y) (interp x2 y)
  | (t.Ext r1 x1), y => infix_dl r1 (interp x1 y)
noncomputable def eq (x1 : t) (x2 : t) := ∀(y : ℤ -> a), interp x1 y = interp x2 y
inductive m where
  | M : r -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> a) -> a
  | ([] : List ℤ), y => aone
  | (List.cons x1 l), y => atimes (y x1) (mon l y)
noncomputable def interp' : List m -> (ℤ -> a) -> a
  | ([] : List m), y => azero
  | (List.cons (m.M r1 m1) l), y => aplus (infix_dl r1 (mon m1 y)) (interp' l y)
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> a), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> a), interp' x1 y = interp' x2 y
noncomputable def append_mon (m1 : m) (m2 : m) := match (m1, m2) with | (m.M r1 l1, m.M r2 l2) => m.M (rtimes r1 r2) (l1 ++ l2)
axiom append_mon'spec (m1 : m) (m2 : m) (y : ℤ -> a) : interp' (List.cons (append_mon m1 m2) ([] : List m)) y = atimes (interp' (List.cons m1 ([] : List m)) y) (interp' (List.cons m2 ([] : List m)) y)
noncomputable def mul_mon : m -> List m -> List m
  | mon1, ([] : List m) => ([] : List m)
  | mon1, (List.cons m1 l) => List.cons (append_mon mon1 m1) (mul_mon mon1 l)
axiom mul_mon'spec (mon1 : m) (x : List m) (y : ℤ -> a) : interp' (mul_mon mon1 x) y = atimes (interp' (List.cons mon1 ([] : List m)) y) (interp' x y)
noncomputable def mul_devel : List m -> List m -> List m
  | ([] : List m), x2 => ([] : List m)
  | (List.cons (m.M r1 m1) l), x2 => mul_mon (m.M r1 m1) x2 ++ mul_devel l x2
axiom mul_devel'spec (x1 : List m) (x2 : List m) (y : ℤ -> a) : interp' (mul_devel x1 x2) y = atimes (interp' x1 y) (interp' x2 y)
noncomputable def ext : r -> List m -> List m
  | c, ([] : List m) => ([] : List m)
  | c, (List.cons (m.M r1 m1) l) => List.cons (m.M (rtimes c r1) m1) (ext c l)
axiom ext'spec (c : r) (x : List m) (y : ℤ -> a) : interp' (ext c x) y = infix_dl c (interp' x y)
noncomputable def conv : t -> List m
  | (t.Var v) => List.cons (m.M rone (List.cons v ([] : List ℤ))) ([] : List m)
  | (t.Add x1 x2) => conv x1 ++ conv x2
  | (t.Mul x1 x2) => mul_devel (conv x1) (conv x2)
  | (t.Ext r1 x1) => ext r1 (conv x1)
  | (t.Sub x1 x2) => conv x1 ++ ext (ropp rone) (conv x2)
axiom conv'spec (x : t) (y : ℤ -> a) : interp x y = interp' (conv x) y
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
  | (m.M r1 l1), (List.cons (m.M r2 l2) l) => if same l1 l2 = true then let s : r := rplus r1 r2; if eq0 s then l else List.cons (m.M s l1) l else if le_mon l1 l2 = true then List.cons (m.M r1 l1) (List.cons (m.M r2 l2) l) else List.cons (m.M r2 l2) (insert_mon (m.M r1 l1) l)
axiom insert_mon'spec (m1 : m) (x : List m) : eq' (insert_mon m1 x) (List.cons m1 x)
noncomputable def insertion_sort_mon : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 l) => insert_mon m1 (insertion_sort_mon l)
axiom insertion_sort_mon'spec (x : List m) : eq' (insertion_sort_mon x) x
axiom normalize''spec (x : List m) : eq' (insertion_sort_mon x) x
noncomputable def normalize (x : t) := insertion_sort_mon (conv x)
axiom normalize'spec (x : t) : eq' (normalize x) (conv x)
theorem norm_lem2'vc (x1 : List m) (x2 : List m) (fact0 : insertion_sort_mon x1 = insertion_sort_mon x2) : eq' x1 x2
  := sorry
end ringdecision_AssocAlgebraDecision_norm_lem2qtvc
