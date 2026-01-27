import Why3.Base
import pearl.prover.lib.lean.ISet.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.ISet.Logic
open Classical
open Lean4Why3
namespace ISet_Impl_insertqtvc
theorem insert'vc (l : List ℤ) (x : ℤ) (fact0 : Logic.iset_ok l) : (match l with | ([] : List ℤ) => True | List.cons y q => ¬x < y → y < x → (match l with | ([] : List ℤ) => False | List.cons _ f => f = q) ∧ Logic.iset_ok q) ∧ (∀(result : List ℤ), (match l with | ([] : List ℤ) => result = List.cons x ([] : List ℤ) | List.cons y q => (if x < y then result = List.cons x l else if y < x then ∃(o1 : List ℤ), (Logic.iset_ok o1 ∧ (∀(y1 : ℤ), (y1 ∈ o1) = (y1 = x ∨ y1 ∈ q))) ∧ result = List.cons y o1 else result = l)) → Logic.iset_ok result ∧ (∀(y : ℤ), (y ∈ result) = (y = x ∨ y ∈ l)))
  := sorry
end ISet_Impl_insertqtvc
