import Why3.Base
import pearl.prover.lib.lean.ISet.Types
import pearl.prover.lib.lean.Functions.Config
open Classical
open Lean4Why3
namespace ISet_Logic_iset_ok_charqtvc
inductive iset_ok : List ℤ -> Prop where
 | Set_empty : iset_ok ([] : List ℤ)
 | Set_one (x : ℤ) : iset_ok (List.cons x ([] : List ℤ))
 | Set_two (y : ℤ) (q : List ℤ) (x : ℤ) : iset_ok (List.cons y q) → x < y → iset_ok (List.cons x (List.cons y q))
theorem iset_ok_char'vc (x : ℤ) (l : List ℤ) : iset_ok (List.cons x l) = (iset_ok l ∧ (∀(y : ℤ), y ∈ l → x < y))
  := sorry
end ISet_Logic_iset_ok_charqtvc
