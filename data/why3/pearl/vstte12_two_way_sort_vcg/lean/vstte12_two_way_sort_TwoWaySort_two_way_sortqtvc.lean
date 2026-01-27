import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace vstte12_two_way_sort_TwoWaySort_two_way_sortqtvc
noncomputable def le (x : Bool) (y : Bool) := x = false ∨ y = true
noncomputable def sorted (a : List Bool) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 ≤ i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem two_way_sort'vc (a : List Bool) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); (((0 : ℤ) ≤ (0 : ℤ) ∧ o1 < Int.ofNat (List.length a)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < (0 : ℤ) → a[Int.toNat k]! = false) ∧ (∀(k : ℤ), o1 < k ∧ k < Int.ofNat (List.length a) → a[Int.toNat k]! = true) ∧ List.Perm a a) ∧ (∀(j : ℤ) (i : ℤ) (a1 : List Bool), List.length a1 = List.length a → ((0 : ℤ) ≤ i ∧ j < Int.ofNat (List.length a1)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i → a1[Int.toNat k]! = false) ∧ (∀(k : ℤ), j < k ∧ k < Int.ofNat (List.length a1) → a1[Int.toNat k]! = true) ∧ List.Perm a a1 → (if i < j then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (if ¬a1[Int.toNat i]! = true then ((0 : ℤ) ≤ j - i ∧ j - (i + (1 : ℤ)) < j - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ j < Int.ofNat (List.length a1)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i + (1 : ℤ) → a1[Int.toNat k]! = false) ∧ (∀(k : ℤ), j < k ∧ k < Int.ofNat (List.length a1) → a1[Int.toNat k]! = true) ∧ List.Perm a a1 else ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a1)) ∧ (if a1[Int.toNat j]! = true then ((0 : ℤ) ≤ j - i ∧ j - (1 : ℤ) - i < j - i) ∧ ((0 : ℤ) ≤ i ∧ j - (1 : ℤ) < Int.ofNat (List.length a1)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i → a1[Int.toNat k]! = false) ∧ (∀(k : ℤ), j - (1 : ℤ) < k ∧ k < Int.ofNat (List.length a1) → a1[Int.toNat k]! = true) ∧ List.Perm a a1 else (((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a1)) ∧ (∀(a2 : List Bool), List.length a2 = List.length a1 → Lean4Why3.arrayExchange a1 a2 i j → ((0 : ℤ) ≤ j - i ∧ j - (1 : ℤ) - (i + (1 : ℤ)) < j - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ j - (1 : ℤ) < Int.ofNat (List.length a2)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i + (1 : ℤ) → a2[Int.toNat k]! = false) ∧ (∀(k : ℤ), j - (1 : ℤ) < k ∧ k < Int.ofNat (List.length a2) → a2[Int.toNat k]! = true) ∧ List.Perm a a2))) else sorted a1 ∧ List.Perm a a1))
  := sorry
end vstte12_two_way_sort_TwoWaySort_two_way_sortqtvc
