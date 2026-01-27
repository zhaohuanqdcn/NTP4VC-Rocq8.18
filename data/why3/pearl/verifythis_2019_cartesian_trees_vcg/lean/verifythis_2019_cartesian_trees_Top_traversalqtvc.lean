import Why3.Base
import Why3.why3.Ref.Ref
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_cartesian_trees_Top_traversalqtvc
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
theorem traversal'vc (dirs1 : List dir) (a : List ℤ) (s : ℤ) (e : ℤ) (top : Option ℤ) (fact0 : List.length dirs1 = List.length a) (fact1 : (0 : ℤ) ≤ s) (fact2 : s ≤ e) (fact3 : e ≤ Int.ofNat (List.length a)) (fact4 : ∀(p1 : ℤ) (p2 : ℤ) (s1 : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → descendant dirs1 p2 s1 → (dir.left1 (dirs1[Int.toNat p1]!) = Option.some p2 → s1 < p1) ∧ (dir.right1 (dirs1[Int.toNat p1]!) = Option.some p2 → p1 < s1)) (fact5 : ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) (fact6 : match top with | Option.some top1 => (∀(son : ℤ), descendant dirs1 top1 son = (s ≤ son ∧ son < e)) | Option.none => s = e) : (match top with | Option.none => True | Option.some top1 => ((0 : ℤ) ≤ top1 ∧ top1 < Int.ofNat (List.length dirs1)) ∧ (let dir1 : dir := dirs1[Int.toNat top1]!; let o1 : ℤ := top1 + (1 : ℤ); (((0 : ℤ) ≤ e - s ∧ e - o1 < e - s) ∧ List.length dirs1 = List.length a ∧ ((0 : ℤ) ≤ o1 ∧ o1 ≤ e ∧ e ≤ Int.ofNat (List.length a)) ∧ (∀(p1 : ℤ) (p2 : ℤ) (s1 : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → descendant dirs1 p2 s1 → (dir.left1 (dirs1[Int.toNat p1]!) = Option.some p2 → s1 < p1) ∧ (dir.right1 (dirs1[Int.toNat p1]!) = Option.some p2 → p1 < s1)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) ∧ (match dir.right1 dir1 with | Option.some top2 => (∀(son : ℤ), descendant dirs1 top2 son = (o1 ≤ son ∧ son < e)) | Option.none => o1 = e)) ∧ (∀(o2 : List ℤ), (∀(x : ℤ), (x ∈ o2) = (o1 ≤ x ∧ x < e)) ∧ sorted1 o2 → ((0 : ℤ) ≤ e - s ∧ top1 - s < e - s) ∧ List.length dirs1 = List.length a ∧ ((0 : ℤ) ≤ s ∧ s ≤ top1 ∧ top1 ≤ Int.ofNat (List.length a)) ∧ (∀(p1 : ℤ) (p2 : ℤ) (s1 : ℤ), (0 : ℤ) ≤ p1 ∧ p1 < Int.ofNat (List.length a) → descendant dirs1 p2 s1 → (dir.left1 (dirs1[Int.toNat p1]!) = Option.some p2 → s1 < p1) ∧ (dir.right1 (dirs1[Int.toNat p1]!) = Option.some p2 → p1 < s1)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → ¬a[Int.toNat i]! = a[Int.toNat j]!) ∧ (match dir.left1 dir1 with | Option.some top2 => (∀(son : ℤ), descendant dirs1 top2 son = (s ≤ son ∧ son < top1)) | Option.none => s = top1)))) ∧ (∀(result : List ℤ), (match top with | Option.none => result = ([] : List ℤ) | Option.some top1 => (∃(o1 : List ℤ), ((∀(x : ℤ), (x ∈ o1) = (top1 + (1 : ℤ) ≤ x ∧ x < e)) ∧ sorted1 o1) ∧ (∃(o2 : List ℤ), ((∀(x : ℤ), (x ∈ o2) = (s ≤ x ∧ x < top1)) ∧ sorted1 o2) ∧ result = o2 ++ List.cons top1 o1))) → (∀(x : ℤ), (x ∈ result) = (s ≤ x ∧ x < e)) ∧ sorted1 result)
  := sorry
end verifythis_2019_cartesian_trees_Top_traversalqtvc
