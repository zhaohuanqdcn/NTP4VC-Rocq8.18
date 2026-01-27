import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_tqtvc
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
theorem t'vc {α : Type} [Inhabited α] : (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(o1 : List (List (key × α))), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → o1[Int.toNat i]! = ([] : List (key × α))) ∧ Int.ofNat (List.length o1) = (1 : ℤ) → (0 : ℤ) < Int.ofNat (List.length o1) ∧ ((0 : ℤ) < Int.ofNat (List.length o1) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1) → good_hash o1 i) ∧ ((∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1) → good_hash o1 i) → (∀(k : key) (v : α), good_data k v (Const.const (Option.none : Option α)) o1))))
  := sorry
end hashtbl_impl_HashtblImpl_tqtvc
