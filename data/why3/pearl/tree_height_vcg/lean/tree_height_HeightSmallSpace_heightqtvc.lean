import Why3.Base
import Why3.why3.Ref.Ref
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace tree_height_HeightSmallSpace_heightqtvc
noncomputable def leaves {α : Type} [Inhabited α] (t : Tree.tree α) := (1 : ℤ) + Size.size t
theorem height'vc {α : Type} [Inhabited α] (t : Tree.tree α) : (0 : ℤ) < (1 : ℤ) ∧ (∀(lim : ℤ), (0 : ℤ) < lim → ((0 : ℤ) < lim ∧ (0 : ℤ) ≤ (0 : ℤ)) ∧ (∀(o1 : Option (ℤ × ℤ)), (match o1 with | Option.none => lim < leaves t | Option.some (res, dl) => res = max (0 : ℤ) ((0 : ℤ) + Height.height t) ∧ lim = leaves t + dl ∧ (0 : ℤ) ≤ dl) → (match o1 with | Option.none => ((0 : ℤ) ≤ leaves t - lim ∧ leaves t - lim * (2 : ℤ) < leaves t - lim) ∧ (0 : ℤ) < lim * (2 : ℤ) | Option.some (h, _) => h = Height.height t)))
  := sorry
end tree_height_HeightSmallSpace_heightqtvc
