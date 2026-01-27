import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace zalloc_Why3_ide_VCzalloc_complete_nonzero_zero_goal0
theorem goal0 (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Cint.is_uint32 i) : i = (0 : ℤ) ∨ (0 : ℤ) < i
  := sorry
end zalloc_Why3_ide_VCzalloc_complete_nonzero_zero_goal0
