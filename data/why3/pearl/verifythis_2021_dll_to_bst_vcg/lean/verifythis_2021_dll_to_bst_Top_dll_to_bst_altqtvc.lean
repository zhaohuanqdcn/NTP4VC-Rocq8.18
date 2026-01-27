import Why3.Base
import Why3.why3.Ref.Ref
import Why3.ocaml.Exceptions
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace verifythis_2021_dll_to_bst_Top_dll_to_bst_altqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom t : Type -> Type
axiom inhabited_axiom_t {χ : Type} [Inhabited χ] : Inhabited (t χ)
attribute [instance] inhabited_axiom_t
axiom to_fmap :  {χ : Type} -> [Inhabited χ] -> t χ -> Finmap (fun (_ : loc) => χ)
axiom null : loc
noncomputable def valid (prev : Finmap (fun (_ : loc) => loc)) (next : Finmap (fun (_ : loc) => loc)) (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬s[Int.toNat i]! = null ∧ s[Int.toNat i]! ∈ prev ∧ s[Int.toNat i]! ∈ next ∧ (∀(j : ℤ), i < j ∧ j < Int.ofNat (List.length s) → ¬s[Int.toNat i]! = s[Int.toNat j]!)
noncomputable def dll (prev : Finmap (fun (_ : loc) => loc)) (next : Finmap (fun (_ : loc) => loc)) (s : List loc) (head : loc) (lo : ℤ) (hi : ℤ) := valid prev next s ∧ ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length s)) ∧ head = (if lo = Int.ofNat (List.length s) then null else s[Int.toNat lo]!) ∧ (∀(i : ℤ), lo ≤ i ∧ i < hi - (1 : ℤ) → Finmap.lookup! next (s[Int.toNat i]!) = s[Int.toNat (i + (1 : ℤ))]!) ∧ (∀(i : ℤ), lo < i ∧ i < hi → Finmap.lookup! prev (s[Int.toNat i]!) = s[Int.toNat (i - (1 : ℤ))]!) ∧ (lo < hi → Finmap.lookup! next (s[Int.toNat (hi - (1 : ℤ))]!) = (if hi = Int.ofNat (List.length s) then null else s[Int.toNat hi]!)) ∧ (lo < hi → Finmap.lookup! prev (s[Int.toNat lo]!) = (if lo = (0 : ℤ) then null else s[Int.toNat (lo - (1 : ℤ))]!))
noncomputable def tree : Finmap (fun (_ : loc) => loc) -> Finmap (fun (_ : loc) => loc) -> List loc -> loc -> Tree.tree ℤ -> ℤ -> ℤ -> Prop
  | prev, next, s, root, t1, lo, hi => valid prev next s ∧ ((0 : ℤ) ≤ lo ∧ lo ≤ hi ∧ hi ≤ Int.ofNat (List.length s)) ∧ (match t1 with | (Tree.tree.Empty : Tree.tree ℤ) => root = null ∧ lo = hi | Tree.tree.Node l p r => (lo ≤ p ∧ p < hi) ∧ root = s[Int.toNat p]! ∧ tree prev next s (Finmap.lookup! prev root) l lo p ∧ tree prev next s (Finmap.lookup! next root) r (p + (1 : ℤ)) hi)
noncomputable def inorder : List loc -> Tree.tree ℤ -> List loc
  | s, (Tree.tree.Empty : Tree.tree ℤ) => ([] : List loc)
  | s, (Tree.tree.Node l p r) => inorder s l ++ List.cons (s[Int.toNat p]!) (inorder s r)
theorem dll_to_bst_alt'vc (prev : t loc) (next : t loc) (s : List loc) (head : loc) (fact0 : dll (to_fmap prev) (to_fmap next) s head (0 : ℤ) (Int.ofNat (List.length s))) : dll (to_fmap prev) (to_fmap next) s head (0 : ℤ) (Int.ofNat (List.length s)) ∧ (let n : ℤ := Int.ofNat (List.length s); dll (to_fmap prev) (to_fmap next) s head (0 : ℤ) ((0 : ℤ) + n) ∧ (∀(next1 : t loc) (prev1 : t loc) (o1 : loc) (o2 : Tree.tree ℤ), tree (to_fmap prev1) (to_fmap next1) s o1 o2 (0 : ℤ) ((0 : ℤ) + n) ∧ Finmap.keys (to_fmap prev1) = Finmap.keys (to_fmap prev) ∧ Finmap.keys (to_fmap next1) = Finmap.keys (to_fmap next) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → Finmap.lookup! (to_fmap prev1) (s[Int.toNat i]!) = Finmap.lookup! (to_fmap prev) (s[Int.toNat i]!)) ∧ (∀(i : ℤ), (0 : ℤ) + n ≤ i ∧ i < Int.ofNat (List.length s) → Finmap.lookup! (to_fmap prev1) (s[Int.toNat i]!) = Finmap.lookup! (to_fmap prev) (s[Int.toNat i]!)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → Finmap.lookup! (to_fmap next1) (s[Int.toNat i]!) = Finmap.lookup! (to_fmap next) (s[Int.toNat i]!)) ∧ (∀(i : ℤ), (0 : ℤ) + n ≤ i ∧ i < Int.ofNat (List.length s) → Finmap.lookup! (to_fmap next1) (s[Int.toNat i]!) = Finmap.lookup! (to_fmap next) (s[Int.toNat i]!)) ∧ ((0 : ℤ) < n → (let h : ℤ := Height.height o2; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ n ∧ n < HPow.hPow (2 : ℤ) (Int.toNat h))) → tree (to_fmap prev1) (to_fmap next1) s o1 o2 (0 : ℤ) (Int.ofNat (List.length s)) ∧ Size.size o2 = Int.ofNat (List.length s) ∧ inorder s o2 = s ∧ ((0 : ℤ) < Int.ofNat (List.length s) → (let h : ℤ := Height.height o2; HPow.hPow (2 : ℤ) (Int.toNat (h - (1 : ℤ))) ≤ Int.ofNat (List.length s) ∧ Int.ofNat (List.length s) < HPow.hPow (2 : ℤ) (Int.toNat h)))))
  := sorry
end verifythis_2021_dll_to_bst_Top_dll_to_bst_altqtvc
