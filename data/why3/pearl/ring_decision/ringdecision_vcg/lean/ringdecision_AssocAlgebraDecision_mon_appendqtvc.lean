import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_AssocAlgebraDecision_mon_appendqtvc
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
theorem mon_append'vc (x1 : List ℤ) (x2 : List ℤ) (y : ℤ -> a) : mon (x1 ++ x2) y = atimes (mon x1 y) (mon x2 y)
  := sorry
end ringdecision_AssocAlgebraDecision_mon_appendqtvc
