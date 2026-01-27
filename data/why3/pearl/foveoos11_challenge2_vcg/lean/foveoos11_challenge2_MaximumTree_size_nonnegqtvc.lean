import Why3.Base
open Classical
open Lean4Why3
namespace foveoos11_challenge2_MaximumTree_size_nonnegqtvc
inductive tree where
  | Empty : tree
  | Node : tree -> ℤ -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l x r) => (1 : ℤ) + size l + size r
theorem size_nonneg'vc (t : tree) : (0 : ℤ) ≤ size t
  := sorry
end foveoos11_challenge2_MaximumTree_size_nonnegqtvc
