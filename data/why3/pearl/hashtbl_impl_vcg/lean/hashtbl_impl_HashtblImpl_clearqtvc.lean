import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_clearqtvc
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
theorem clear'vc {α : Type} [Inhabited α] (h : t α) : let o1 : ℤ := Int.ofNat (List.length (data h)); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ (0 : ℤ) + o1 ≤ Int.ofNat (List.length (data h))) ∧ (∀(h_data : List (List (key × α))), List.length h_data = List.length (data h) → List.length h_data = List.length (data h) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + o1 ≤ i ∧ i < Int.ofNat (List.length h_data) → h_data[Int.toNat i]! = (data h)[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + o1 → h_data[Int.toNat i]! = ([] : List (key × α))) → (∀(h1 : t α), ((0 : ℤ) < Int.ofNat (List.length h_data) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length h_data) → good_hash h_data i) ∧ (∀(k : key) (v : α), good_data k v (Const.const (Option.none : Option α)) h_data)) ∧ (Const.const (Option.none : Option α) = view h1 ∧ h_data = data h1 ∧ (0 : ℤ) = size h1 → view h1 = Const.const (Option.none : Option α))))
  := sorry
end hashtbl_impl_HashtblImpl_clearqtvc
