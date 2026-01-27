import Why3.Base
import Why3.why3.Ref.Ref
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_cartesian_trees_Top_in_orderqtvc
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
axiom Trans1 (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x < y) (fact1 : y < z) : x < z
inductive sorted1 : List ℤ -> Prop where
 | Sorted_Nil1 : sorted1 ([] : List ℤ)
 | Sorted_One1 (x : ℤ) : sorted1 (List.cons x ([] : List ℤ))
 | Sorted_Two1 (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted1 (List.cons y l) → sorted1 (List.cons x (List.cons y l))
axiom sorted_mem1 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted1 l) = sorted1 (List.cons x l)
axiom sorted_append1 (l1 : List ℤ) (l2 : List ℤ) : (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted1 (l1 ++ l2)
theorem in_order'vc (a : List ℤ) (fact0 : ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) : let o1 : ℤ := Int.ofNat (List.length a); ∀(o2 : Option ℤ), (match o2 with | Option.some mv => is_smallest a mv | Option.none => Int.ofNat (List.length a) = (0 : ℤ)) → (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) ∧ (∀(o3 : List dir), List.length o3 = List.length a ∧ (∀(j : ℤ) (v : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → (dir.left1 (o3[Int.toNat j]!) = Option.some v → a[Int.toNat j]! < a[Int.toNat v]! ∧ ((0 : ℤ) ≤ v ∧ v < j) ∧ (∀(x : ℤ), v < x ∧ x < j → a[Int.toNat j]! < a[Int.toNat x]!)) ∧ (dir.right1 (o3[Int.toNat j]!) = Option.some v → a[Int.toNat j]! < a[Int.toNat v]! ∧ (j < v ∧ v < Int.ofNat (List.length a)) ∧ (∀(x : ℤ), j < x ∧ x < v → a[Int.toNat j]! < a[Int.toNat x]!))) ∧ (∀(p : ℤ) (s : ℤ), (0 : ℤ) ≤ p ∧ p < Int.ofNat (List.length a) → descendant o3 p s → ((0 : ℤ) ≤ s ∧ s < Int.ofNat (List.length a)) ∧ a[Int.toNat p]! ≤ a[Int.toNat s]!) ∧ (∀(p1 : ℤ) (p2 : ℤ) (s : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → descendant o3 p2 s → (dir.left1 (o3[Int.toNat p1]!) = Option.some p2 → s < p1) ∧ (dir.right1 (o3[Int.toNat p1]!) = Option.some p2 → p1 < s)) ∧ (∀(i : ℤ) (k : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → a[Int.toNat k]! < a[Int.toNat i]! → (∃(sm : ℤ), ((0 : ℤ) ≤ sm ∧ sm < Int.ofNat (List.length a)) ∧ parent o3 sm i)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → is_smallest a i ∨ (∃(sm : ℤ), ((0 : ℤ) ≤ sm ∧ sm < Int.ofNat (List.length a)) ∧ parent o3 sm i)) ∧ (∀(p1 : ℤ) (p2 : ℤ) (s : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → (0 : ℤ) ≤ p2 ∧ p2 < Int.ofNat (List.length a) → (0 : ℤ) ≤ s ∧ s < Int.ofNat (List.length a) → parent o3 p1 s → parent o3 p2 s → p1 = p2) ∧ (∀(p1 : ℤ) (p2 : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → (0 : ℤ) ≤ p2 ∧ p2 < Int.ofNat (List.length a) → (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → parent o3 p1 p2 → descendant o3 p2 p1 → ¬True) → (List.length o3 = List.length a ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ (∀(p1 : ℤ) (p2 : ℤ) (s : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → descendant o3 p2 s → (dir.left1 (o3[Int.toNat p1]!) = Option.some p2 → s < p1) ∧ (dir.right1 (o3[Int.toNat p1]!) = Option.some p2 → p1 < s)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) ∧ (match o2 with | Option.some top => (∀(son : ℤ), descendant o3 top son = ((0 : ℤ) ≤ son ∧ son < o1)) | Option.none => (0 : ℤ) = o1)) ∧ (∀(result : List ℤ), (∀(x : ℤ), (x ∈ result) = ((0 : ℤ) ≤ x ∧ x < o1)) ∧ sorted1 result → (∀(x : ℤ), (x ∈ result) = ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a))) ∧ sorted1 result))
  := sorry
end verifythis_2019_cartesian_trees_Top_in_orderqtvc
