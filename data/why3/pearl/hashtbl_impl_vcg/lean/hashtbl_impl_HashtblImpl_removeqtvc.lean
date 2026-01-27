import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_removeqtvc
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
theorem remove'vc {α : Type} [Inhabited α] (h : t α) (k : key) : let o1 : ℤ := Int.ofNat (List.length (data h)); (0 : ℤ) < o1 ∧ (let i : ℤ := bucket k o1; (0 : ℤ) ≤ i ∧ i < o1 → (let o2 : List (List (key × α)) := data h; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o2)) ∧ (let l : List (key × α) := o2[Int.toNat i]!; ∀(o3 : Option α), (match o3 with | (Option.none : Option α) => (∀(v : α), ¬(k, v) ∈ l) | Option.some v => (k, v) ∈ l) → (match o3 with | (Option.none : Option α) => view h k = (Option.none : Option α) | Option.some _ => (∀(o4 : List (key × α)), (∀(k' : key) (v : α), ((k', v) ∈ o4) = ((k', v) ∈ l ∧ ¬k' = k)) → (let o5 : List (List (key × α)) := data h; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o5)) ∧ (List.length (List.set o5 (Int.toNat i) o4) = List.length o5 → List.length (List.set o5 (Int.toNat i) o4) = List.length (data h) → getElem! (List.set o5 (Int.toNat i) o4) ∘ Int.toNat = Function.update (getElem! o5 ∘ Int.toNat) i o4 → (∀(h1 : t α), ((0 : ℤ) < Int.ofNat (List.length (List.set o5 (Int.toNat i) o4)) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set o5 (Int.toNat i) o4)) → good_hash (List.set o5 (Int.toNat i) o4) i1) ∧ (∀(k1 : key) (v : α), good_data k1 v (Function.update (view h) k (Option.none : Option α)) (List.set o5 (Int.toNat i) o4))) ∧ (Function.update (view h) k (Option.none : Option α) = view h1 ∧ List.set o5 (Int.toNat i) o4 = data h1 ∧ size h - (1 : ℤ) = size h1 → view h1 k = (Option.none : Option α) ∧ (∀(k' : key), ¬k' = k → view h1 k' = view h k'))))))))))
  := sorry
end hashtbl_impl_HashtblImpl_removeqtvc
