import Why3.Base
import Why3.why3.Ref.Ref
import pearl.add_list_vcg.lean.add_list.SumList
open Classical
open Lean4Why3
namespace add_list_AddListImp_sumqtvc
theorem sum'vc (l : List SumList.or_integer_float) : (0 : ℤ) + SumList.add_int l = SumList.add_int l ∧ (0 : ℝ) + SumList.add_real l = SumList.add_real l ∧ (∀(ll : List SumList.or_integer_float) (sf : ℝ) (si : ℤ), si + SumList.add_int ll = SumList.add_int l ∧ sf + SumList.add_real ll = SumList.add_real l → (match ll with | ([] : List SumList.or_integer_float) => si = SumList.add_int l ∧ sf = SumList.add_real l | List.cons (SumList.or_integer_float.Integer n) t => (match ll with | ([] : List SumList.or_integer_float) => False | List.cons _ f => f = t) ∧ si + n + SumList.add_int t = SumList.add_int l ∧ sf + SumList.add_real t = SumList.add_real l | List.cons (SumList.or_integer_float.Real x) t => (match ll with | ([] : List SumList.or_integer_float) => False | List.cons _ f => f = t) ∧ si + SumList.add_int t = SumList.add_int l ∧ sf + x + SumList.add_real t = SumList.add_real l))
  := sorry
end add_list_AddListImp_sumqtvc
