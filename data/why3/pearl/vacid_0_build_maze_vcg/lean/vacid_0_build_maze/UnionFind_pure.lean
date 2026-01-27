import Why3.Base
open Classical
open Lean4Why3
namespace UnionFind_pure
axiom uf_pure : Type
axiom inhabited_axiom_uf_pure : Inhabited uf_pure
attribute [instance] inhabited_axiom_uf_pure
axiom repr : uf_pure -> ℤ -> ℤ -> Prop
axiom size : uf_pure -> ℤ
axiom num : uf_pure -> ℤ
axiom Repr_function_1 (x : ℤ) (u : uf_pure) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < size u) : ∃(y : ℤ), ((0 : ℤ) ≤ y ∧ y < size u) ∧ repr u x y
axiom Repr_function_2 (x : ℤ) (u : uf_pure) (y : ℤ) (z : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < size u) (fact2 : repr u x y) (fact3 : repr u x z) : y = z
noncomputable def same (u : uf_pure) (x : ℤ) (y : ℤ) := ∀(r : ℤ), repr u x r = repr u y r
noncomputable def same_reprs (u1 : uf_pure) (u2 : uf_pure) := ∀(x : ℤ) (r : ℤ), repr u1 x r = repr u2 x r
axiom OneClass (u : uf_pure) (x : ℤ) (y : ℤ) (fact0 : num u = (1 : ℤ)) (fact1 : (0 : ℤ) ≤ x) (fact2 : x < size u) (fact3 : (0 : ℤ) ≤ y) (fact4 : y < size u) : same u x y
end UnionFind_pure
