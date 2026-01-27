import Why3.Base
import Why3.why3.Ref.Ref
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_cartesian_trees_Top_other_descendantqtvc
axiom Trans (y : ℤ) (x : ℤ) (z : ℤ) (fact0 : y ≤ x) (fact1 : z ≤ y) : z ≤ x
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (y : ℤ) (x : ℤ) (l : List ℤ) : y ≤ x → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → y ≤ x) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → y ≤ x)) = sorted (l1 ++ l2)
axiom destruct :  {ty'xi : Type} -> [Inhabited ty'xi] -> List ty'xi -> ty'xi × List ty'xi
axiom destruct'def {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : match l with | List.cons h t => destruct l = (h, t) | _ => False
axiom peek :  {ty'xi : Type} -> [Inhabited ty'xi] -> List ty'xi -> ty'xi
axiom peek'def {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : match destruct l with | (h, _) => peek l = h
axiom peek'spec {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : peek l ∈ l
axiom tail :  {ty'xi : Type} -> [Inhabited ty'xi] -> List ty'xi -> List ty'xi
axiom tail'def {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : match destruct l with | (_, t) => tail l = t
structure dir where
  left1 : Option ℤ
  right1 : Option ℤ
axiom inhabited_axiom_dir : Inhabited dir
attribute [instance] inhabited_axiom_dir
axiom dirs : Type
axiom inhabited_axiom_dirs : Inhabited dirs
attribute [instance] inhabited_axiom_dirs
noncomputable def parent (t : List dir) (p : ℤ) (s : ℤ) := dir.left1 (t[Int.toNat p]!) = Option.some s ∨ dir.right1 (t[Int.toNat p]!) = Option.some s
inductive descendant : List dir -> ℤ -> ℤ -> Prop where
 | Self (p : ℤ) (s : ℤ) (t : List dir) : p = s → descendant t p s
 | Son_left (t : List dir) (p : ℤ) (s1 : ℤ) (s2 : ℤ) : descendant t p s1 → dir.left1 (t[Int.toNat s1]!) = Option.some s2 → descendant t p s2
 | Son_right (t : List dir) (p : ℤ) (s1 : ℤ) (s2 : ℤ) : descendant t p s1 → dir.right1 (t[Int.toNat s1]!) = Option.some s2 → descendant t p s2
noncomputable def is_smallest (a : List ℤ) (i : ℤ) := ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → a[Int.toNat i]! ≤ a[Int.toNat j]!)
theorem other_descendant'vc (t : List dir) (p1 : ℤ) (p2 : ℤ) (s : ℤ) (fact0 : parent t p1 p2) (fact1 : descendant t p2 s) : descendant t p1 s
  := sorry
end verifythis_2019_cartesian_trees_Top_other_descendantqtvc
