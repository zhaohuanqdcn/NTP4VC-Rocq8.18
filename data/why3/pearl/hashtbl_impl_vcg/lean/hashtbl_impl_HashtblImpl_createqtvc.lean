import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_createqtvc
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
theorem create'vc {α : Type} [Inhabited α] (n : ℤ) (fact0 : (1 : ℤ) ≤ n) : let o1 : key -> Option α := Const.const (Option.none : Option α); (0 : ℤ) ≤ n ∧ (∀(o2 : List (List (key × α))), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → o2[Int.toNat i]! = ([] : List (key × α))) ∧ Int.ofNat (List.length o2) = n → ((0 : ℤ) < Int.ofNat (List.length o2) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o2) → good_hash o2 i) ∧ (∀(k : key) (v : α), good_data k v o1 o2)) ∧ (∀(result : t α), size result = (0 : ℤ) ∧ data result = o2 ∧ view result = o1 → view result = Const.const (Option.none : Option α)))
  := sorry
end hashtbl_impl_HashtblImpl_createqtvc
