import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace FIND
axiom x_N : ℤ
axiom f : ℤ
axiom f_N_range : (1 : ℤ) ≤ f ∧ f ≤ x_N
noncomputable def found (a : List ℤ) := ∀(p : ℤ) (q : ℤ), (1 : ℤ) ≤ p ∧ p ≤ f ∧ f ≤ q ∧ q ≤ x_N → a[Int.toNat p]! ≤ a[Int.toNat f]! ∧ a[Int.toNat f]! ≤ a[Int.toNat q]!
noncomputable def m_invariant (m : ℤ) (a : List ℤ) := m ≤ f ∧ (∀(p : ℤ) (q : ℤ), (1 : ℤ) ≤ p ∧ p < m ∧ m ≤ q ∧ q ≤ x_N → a[Int.toNat p]! ≤ a[Int.toNat q]!)
noncomputable def n_invariant (n : ℤ) (a : List ℤ) := f ≤ n ∧ (∀(p : ℤ) (q : ℤ), (1 : ℤ) ≤ p ∧ p ≤ n ∧ n < q ∧ q ≤ x_N → a[Int.toNat p]! ≤ a[Int.toNat q]!)
noncomputable def i_invariant (m : ℤ) (n : ℤ) (i : ℤ) (q : ℤ) (r : ℤ) (a : List ℤ) := m ≤ i ∧ (∀(p : ℤ), (1 : ℤ) ≤ p ∧ p < i → a[Int.toNat p]! ≤ r) ∧ (i ≤ n → (i ≤ q ∧ q ≤ n) ∧ r ≤ a[Int.toNat q]!)
noncomputable def j_invariant (m : ℤ) (n : ℤ) (j : ℤ) (p : ℤ) (r : ℤ) (a : List ℤ) := j ≤ n ∧ (∀(q : ℤ), j < q ∧ q ≤ x_N → r ≤ a[Int.toNat q]!) ∧ (m ≤ j → (m ≤ p ∧ p ≤ j) ∧ a[Int.toNat p]! ≤ r)
noncomputable def termination (i : ℤ) (j : ℤ) (i0 : ℤ) (j0 : ℤ) (r : ℤ) (a : List ℤ) := i0 < i ∧ j < j0 ∨ (i ≤ f ∧ f ≤ j) ∧ a[Int.toNat f]! = r
end FIND
