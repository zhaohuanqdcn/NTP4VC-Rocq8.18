import Why3.Base
import Why3.why3.Ref.Ref
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_Iteration_height1qtvc
inductive cont (α : Type) where
  | Id : cont α
  | Kleft : Tree.tree α -> cont α -> cont α
  | Kright : ℤ -> cont α -> cont α
axiom inhabited_axiom_cont {α : Type} [Inhabited α] : Inhabited (cont α)
attribute [instance] inhabited_axiom_cont
inductive what (α : Type) where
  | Argument : Tree.tree α -> what α
  | Result : ℤ -> what α
axiom inhabited_axiom_what {α : Type} [Inhabited α] : Inhabited (what α)
attribute [instance] inhabited_axiom_what
noncomputable def is_id {α : Type} [Inhabited α] (k : cont α) := match k with | (cont.Id : cont α) => True | _ => False
noncomputable def is_result {α : Type} [Inhabited α] (w : what α) := match w with | what.Result _ => True | _ => False
noncomputable def evalk {α : Type} [Inhabited α] : cont α -> ℤ -> ℤ
  | (cont.Id : cont α), r => r
  | (cont.Kleft l k1), r => evalk k1 ((1 : ℤ) + max (Height.height l) r)
  | (cont.Kright x k1), r => evalk k1 ((1 : ℤ) + max x r)
noncomputable def evalw {α : Type} [Inhabited α] (w : what α) := match w with | what.Argument t => Height.height t | what.Result x => x
noncomputable def sizek {α : Type} [Inhabited α] : cont α -> ℤ
  | (cont.Id : cont α) => (0 : ℤ)
  | (cont.Kleft t k1) => (3 : ℤ) + (4 : ℤ) * Size.size t + sizek k1
  | (cont.Kright x k1) => (1 : ℤ) + sizek k1
noncomputable def sizew {α : Type} [Inhabited α] (w : what α) := match w with | what.Argument t => (1 : ℤ) + (4 : ℤ) * Size.size t | what.Result _ => (0 : ℤ)
theorem height1'vc {α : Type} [Inhabited α] (t : Tree.tree α) : evalk (cont.Id : cont α) (evalw (what.Argument t)) = Height.height t ∧ (∀(k : cont α) (w : what α), evalk k (evalw w) = Height.height t → (∀(o1 : Bool), (if is_id k then o1 = (if is_result w then true else false) else o1 = false) → (if ¬o1 = true then match k with | (cont.Id : cont α) => (match w with | what.Argument x => (match x with | (Tree.tree.Empty : Tree.tree α) => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek k + sizew ((what.Result : ℤ -> what α) (0 : ℤ)) < sizek k + sizew w) ∧ evalk k (evalw ((what.Result : ℤ -> what α) (0 : ℤ))) = Height.height t | Tree.tree.Node x1 x2 x3 => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek (cont.Kleft x3 k) + sizew (what.Argument x1) < sizek k + sizew w) ∧ evalk (cont.Kleft x3 k) (evalw (what.Argument x1)) = Height.height t) | what.Result x => False) | cont.Kleft x x1 => (match w with | what.Argument x2 => (match x2 with | (Tree.tree.Empty : Tree.tree α) => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek k + sizew ((what.Result : ℤ -> what α) (0 : ℤ)) < sizek k + sizew w) ∧ evalk k (evalw ((what.Result : ℤ -> what α) (0 : ℤ))) = Height.height t | Tree.tree.Node x3 x4 x5 => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek (cont.Kleft x5 k) + sizew (what.Argument x3) < sizek k + sizew w) ∧ evalk (cont.Kleft x5 k) (evalw (what.Argument x3)) = Height.height t) | what.Result x2 => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek (cont.Kright x2 x1) + sizew (what.Argument x) < sizek k + sizew w) ∧ evalk (cont.Kright x2 x1) (evalw (what.Argument x)) = Height.height t) | cont.Kright x x1 => (match w with | what.Argument x2 => (match x2 with | (Tree.tree.Empty : Tree.tree α) => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek k + sizew ((what.Result : ℤ -> what α) (0 : ℤ)) < sizek k + sizew w) ∧ evalk k (evalw ((what.Result : ℤ -> what α) (0 : ℤ))) = Height.height t | Tree.tree.Node x3 x4 x5 => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek (cont.Kleft x5 k) + sizew (what.Argument x3) < sizek k + sizew w) ∧ evalk (cont.Kleft x5 k) (evalw (what.Argument x3)) = Height.height t) | what.Result x2 => ((0 : ℤ) ≤ sizek k + sizew w ∧ sizek x1 + sizew ((what.Result : ℤ -> what α) ((1 : ℤ) + max x x2)) < sizek k + sizew w) ∧ evalk x1 (evalw ((what.Result : ℤ -> what α) ((1 : ℤ) + max x x2))) = Height.height t) else (match w with | what.Result r => True | _ => False) ∧ (∀(result : ℤ), (match w with | what.Result r => result = r | _ => False) → result = Height.height t))))
  := sorry
end tree_height_Iteration_height1qtvc
