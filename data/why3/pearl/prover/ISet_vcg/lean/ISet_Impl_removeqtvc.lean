import Why3.Base
import pearl.prover.lib.lean.ISet.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.ISet.Logic
open Classical
open Lean4Why3
namespace ISet_Impl_removeqtvc
theorem remove'vc (l : List ℤ) (x : ℤ) (fact0 : Logic.iset_ok l) : (match l with | ([] : List ℤ) => True | List.cons y q => (match l with | ([] : List ℤ) => False | List.cons _ f => f = q) ∧ Logic.iset_ok q) ∧ (∀(result : List ℤ), (match l with | ([] : List ℤ) => result = ([] : List ℤ) | List.cons y q => (if y = x then Logic.iset_ok result ∧ (∀(y1 : ℤ), (y1 ∈ result) = (y1 ∈ q ∧ ¬y1 = x)) else ∃(o1 : List ℤ), (Logic.iset_ok o1 ∧ (∀(y1 : ℤ), (y1 ∈ o1) = (y1 ∈ q ∧ ¬y1 = x))) ∧ result = List.cons y o1)) → Logic.iset_ok result ∧ (∀(y : ℤ), (y ∈ result) = (y ∈ l ∧ ¬y = x)))
  := sorry
end ISet_Impl_removeqtvc
