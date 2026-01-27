import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace zalloc_Why3_ide_VCzalloc_disjoint_nonzero_zero_goal1
theorem goal1 (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_uint32 (0 : ℤ)) : ¬True ∨ (0 : ℤ) ≤ (0 : ℤ)
  := sorry
end zalloc_Why3_ide_VCzalloc_disjoint_nonzero_zero_goal1
