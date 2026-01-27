import Why3.Base
import Why3.why3.Ref.Ref
import Why3.ocaml.Exceptions
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Height
open Classical
open Lean4Why3
namespace verifythis_2021_dll_to_bst_Top_size_altqtvc
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
theorem size_alt'vc (prev : t loc) (next : t loc) (s : List loc) (head : loc) (fact0 : dll (to_fmap prev) (to_fmap next) s head (0 : ℤ) (Int.ofNat (List.length s))) : dll (to_fmap prev) (to_fmap next) s head (0 : ℤ) (Int.ofNat (List.length s)) ∧ (∀(len : ℤ) (p : loc), dll (to_fmap prev) (to_fmap next) s p len (Int.ofNat (List.length s)) → (if ¬p = null then p ∈ to_fmap next ∧ (let o1 : loc := Finmap.lookup! (to_fmap next) p; o1 = Option.the (Finmap.lookup p (to_fmap next)) → ((0 : ℤ) ≤ Int.ofNat (List.length s) - len ∧ Int.ofNat (List.length s) - (len + (1 : ℤ)) < Int.ofNat (List.length s) - len) ∧ dll (to_fmap prev) (to_fmap next) s o1 (len + (1 : ℤ)) (Int.ofNat (List.length s))) else len = Int.ofNat (List.length s)))
  := sorry
end verifythis_2021_dll_to_bst_Top_size_altqtvc
