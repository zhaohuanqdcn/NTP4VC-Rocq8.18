import Why3.Base
import pearl.prover.lib.lean.ISet.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.ISet.Logic
open Classical
open Lean4Why3
namespace ISet_Impl_mergeqtvc
theorem merge'vc (l1 : List ℤ) (l2 : List ℤ) (fact0 : Logic.iset_ok l1) (fact1 : Logic.iset_ok l2) : (match l1 with | ([] : List ℤ) => True | List.cons x q1 => (match l2 with | ([] : List ℤ) => True | List.cons y q2 => (if x < y then (match l1 with | ([] : List ℤ) => False | List.cons _ f => f = q1) ∧ Logic.iset_ok q1 ∧ Logic.iset_ok l2 else if y < x then (match l2 with | ([] : List ℤ) => False | List.cons _ f => f = q2) ∧ Logic.iset_ok l1 ∧ Logic.iset_ok q2 else ((match l1 with | ([] : List ℤ) => False | List.cons _ f => f = q1) ∨ l1 = q1 ∧ (match l2 with | ([] : List ℤ) => False | List.cons _ f => f = q2)) ∧ Logic.iset_ok q1 ∧ Logic.iset_ok q2))) ∧ (∀(result : List ℤ), (match l1 with | ([] : List ℤ) => result = l2 | List.cons x q1 => (match l2 with | ([] : List ℤ) => result = l1 | List.cons y q2 => (if x < y then ∃(o1 : List ℤ), (Logic.iset_ok o1 ∧ (∀(y1 : ℤ), (y1 ∈ o1) = (y1 ∈ q1 ∨ y1 ∈ l2))) ∧ result = List.cons x o1 else if y < x then ∃(o1 : List ℤ), (Logic.iset_ok o1 ∧ (∀(y1 : ℤ), (y1 ∈ o1) = (y1 ∈ l1 ∨ y1 ∈ q2))) ∧ result = List.cons y o1 else ∃(o1 : List ℤ), (Logic.iset_ok o1 ∧ (∀(y1 : ℤ), (y1 ∈ o1) = (y1 ∈ q1 ∨ y1 ∈ q2))) ∧ result = List.cons x o1))) → Logic.iset_ok result ∧ (∀(y : ℤ), (y ∈ result) = (y ∈ l1 ∨ y ∈ l2)))
  := sorry
end ISet_Impl_mergeqtvc
