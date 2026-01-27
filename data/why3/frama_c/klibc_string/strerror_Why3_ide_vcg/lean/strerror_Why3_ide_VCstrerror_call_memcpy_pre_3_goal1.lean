import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strerror_Why3_ide_VCstrerror_call_memcpy_pre_3_goal1
theorem goal1 (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := Cint.to_uint32 i; Cint.to_uint32 (Int.tdiv i_1 (10 : ℤ)) = (0 : ℤ) → (0 : ℤ) < x → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i_1 → x ≤ (26 : ℤ)
  := sorry
end strerror_Why3_ide_VCstrerror_call_memcpy_pre_3_goal1
