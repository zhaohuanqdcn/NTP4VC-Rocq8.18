import Why3.Base
import pearl.add_list_vcg.lean.add_list.SumList
open Classical
open Lean4Why3
namespace add_list_AddListRec_sumqtvc
theorem sum'vc (l : List SumList.or_integer_float) : (match l with | ([] : List SumList.or_integer_float) => True | List.cons h t => (match l with | ([] : List SumList.or_integer_float) => False | List.cons _ f => f = t) ∧ (match h with | SumList.or_integer_float.Integer n => True | SumList.or_integer_float.Real x => True)) ∧ (∀(si : ℤ) (sf : ℝ), (match l with | ([] : List SumList.or_integer_float) => si = (0 : ℤ) ∧ sf = (0 : ℝ) | List.cons h t => (match h with | SumList.or_integer_float.Integer n => si = n + SumList.add_int t ∧ sf = SumList.add_real t | SumList.or_integer_float.Real x => si = SumList.add_int t ∧ sf = x + SumList.add_real t)) → si = SumList.add_int l ∧ sf = SumList.add_real l)
  := sorry
end add_list_AddListRec_sumqtvc
