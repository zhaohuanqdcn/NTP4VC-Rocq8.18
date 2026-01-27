namespace IntInf
inductive t where
  | Finite : ℤ -> t
  | Infinite : t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def add (x : t) (y : t) := match x with | t.Infinite => t.Infinite | t.Finite x1 => (match y with | t.Infinite => t.Infinite | t.Finite y1 => t.Finite (x1 + y1))
noncomputable def eq (x : t) (y : t) := match (x, y) with | (t.Infinite, t.Infinite) => True | (t.Finite x1, t.Finite y1) => x1 = y1 | (_, _) => False
noncomputable def lt (x : t) (y : t) := match x with | t.Infinite => False | t.Finite x1 => (match y with | t.Infinite => True | t.Finite y1 => x1 < y1)
noncomputable def le (x : t) (y : t) := lt x y ∨ eq x y
axiom Refl (x : t) : le x x
axiom Trans (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Antisymm (x : t) (y : t) (fact0 : le x y) (fact1 : le y x) : x = y
axiom Total (x : t) (y : t) : le x y ∨ le y x
end IntInf
