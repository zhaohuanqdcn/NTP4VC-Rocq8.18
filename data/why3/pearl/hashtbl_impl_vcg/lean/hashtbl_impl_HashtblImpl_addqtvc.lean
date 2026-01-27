import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_addqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom hash : key -> ℤ
axiom hash'spec (x : key) : (0 : ℤ) ≤ hash x
axiom bucket : key -> ℤ -> ℤ
axiom bucket'def (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : bucket k n = Int.tmod (hash k) n
axiom bucket'spec (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : (0 : ℤ) ≤ bucket k n ∧ bucket k n < n
noncomputable def in_data {α : Type} [Inhabited α] (k : key) (v : α) (d : List (List (key × α))) := (k, v) ∈ d[Int.toNat (bucket k (Int.ofNat (List.length d)))]!
noncomputable def good_data {α : Type} [Inhabited α] (k : key) (v : α) (m : key -> Option α) (d : List (List (key × α))) := (m k = Option.some v) = in_data k v d
noncomputable def good_hash {α : Type} [Inhabited α] (d : List (List (key × α))) (i : ℤ) := ∀(k : key) (v : α), (k, v) ∈ d[Int.toNat i]! → bucket k (Int.ofNat (List.length d)) = i
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom size :  {α : Type} -> [Inhabited α] -> t α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> t α -> List (List (key × α))
axiom view :  {α : Type} -> [Inhabited α] -> t α -> key -> Option α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : (0 : ℤ) < Int.ofNat (List.length (data self)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (data self)) → good_hash (data self) i) ∧ (∀(k : key) (v : α), good_data k v (view self) (data self))
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := size a = size b ∧ data a = data b ∧ view a = view b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
theorem add'vc {α : Type} [Inhabited α] (h : t α) (k : key) (v : α) : if size h = Int.ofNat (List.length (data h)) then ∀(h1 : t α), view h = view h1 ∧ size h = size h1 → (∀(h2 : t α), List.length (data h2) = List.length (data h1) → view h2 k = (Option.none : Option α) ∧ (∀(k' : key), ¬k' = k → view h2 k' = view h1 k') → (let o1 : ℤ := Int.ofNat (List.length (data h2)); (0 : ℤ) < o1 ∧ (let i : ℤ := bucket k o1; (0 : ℤ) ≤ i ∧ i < o1 → (let o2 : List (List (key × α)) := data h2; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o2)) ∧ (let o3 : List (key × α) := List.cons (k, v) (o2[Int.toNat i]!); let o4 : List (List (key × α)) := data h2; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o4)) ∧ (List.length (List.set o4 (Int.toNat i) o3) = List.length o4 → List.length (List.set o4 (Int.toNat i) o3) = List.length (data h2) → getElem! (List.set o4 (Int.toNat i) o3) ∘ Int.toNat = Function.update (getElem! o4 ∘ Int.toNat) i o3 → (∀(h3 : t α), ((0 : ℤ) < Int.ofNat (List.length (List.set o4 (Int.toNat i) o3)) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set o4 (Int.toNat i) o3)) → good_hash (List.set o4 (Int.toNat i) o3) i1) ∧ (∀(k1 : key) (v1 : α), good_data k1 v1 (Function.update (view h2) k (Option.some v)) (List.set o4 (Int.toNat i) o3))) ∧ (Function.update (view h2) k (Option.some v) = view h3 ∧ List.set o4 (Int.toNat i) o3 = data h3 ∧ size h2 + (1 : ℤ) = size h3 → view h3 k = Option.some v ∧ (∀(k' : key), ¬k' = k → view h3 k' = view h k'))))))))) else ∀(h1 : t α), List.length (data h1) = List.length (data h) → view h1 k = (Option.none : Option α) ∧ (∀(k' : key), ¬k' = k → view h1 k' = view h k') → (let o1 : ℤ := Int.ofNat (List.length (data h1)); (0 : ℤ) < o1 ∧ (let i : ℤ := bucket k o1; (0 : ℤ) ≤ i ∧ i < o1 → (let o2 : List (List (key × α)) := data h1; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o2)) ∧ (let o3 : List (key × α) := List.cons (k, v) (o2[Int.toNat i]!); let o4 : List (List (key × α)) := data h1; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o4)) ∧ (List.length (List.set o4 (Int.toNat i) o3) = List.length o4 → List.length (List.set o4 (Int.toNat i) o3) = List.length (data h1) → getElem! (List.set o4 (Int.toNat i) o3) ∘ Int.toNat = Function.update (getElem! o4 ∘ Int.toNat) i o3 → (∀(h2 : t α), ((0 : ℤ) < Int.ofNat (List.length (List.set o4 (Int.toNat i) o3)) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set o4 (Int.toNat i) o3)) → good_hash (List.set o4 (Int.toNat i) o3) i1) ∧ (∀(k1 : key) (v1 : α), good_data k1 v1 (Function.update (view h1) k (Option.some v)) (List.set o4 (Int.toNat i) o3))) ∧ (Function.update (view h1) k (Option.some v) = view h2 ∧ List.set o4 (Int.toNat i) o3 = data h2 ∧ size h1 + (1 : ℤ) = size h2 → view h2 k = Option.some v ∧ (∀(k' : key), ¬k' = k → view h2 k' = view h k'))))))))
  := sorry
end hashtbl_impl_HashtblImpl_addqtvc
