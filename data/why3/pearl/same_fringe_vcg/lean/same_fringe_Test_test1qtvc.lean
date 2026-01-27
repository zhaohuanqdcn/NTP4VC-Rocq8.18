import Why3.Base
open Classical
open Lean4Why3
namespace same_fringe_Test_test1qtvc
inductive tree where
  | Empty : tree
  | Node : tree -> ℤ -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def elements : tree -> List ℤ
  | tree.Empty => ([] : List ℤ)
  | (tree.Node l x r) => elements l ++ List.cons x (elements r)
inductive enum where
  | Done : enum
  | Next : ℤ -> tree -> enum -> enum
axiom inhabited_axiom_enum : Inhabited enum
attribute [instance] inhabited_axiom_enum
noncomputable def enum_elements : enum -> List ℤ
  | enum.Done => ([] : List ℤ)
  | (enum.Next x r e1) => List.cons x (elements r ++ enum_elements e1)
axiom a : ℤ
axiom b : ℤ
theorem test1'vc : True
  := sorry
end same_fringe_Test_test1qtvc
