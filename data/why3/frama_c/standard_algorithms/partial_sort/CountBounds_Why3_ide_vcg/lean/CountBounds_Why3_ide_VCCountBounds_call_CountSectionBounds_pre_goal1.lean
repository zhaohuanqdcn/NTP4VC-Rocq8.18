import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace CountBounds_Why3_ide_VCCountBounds_call_CountSectionBounds_pre_goal1
theorem goal1 (a : Memory.addr) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Cint.is_uint32 i) : (0 : ℤ) ≤ i
  := sorry
end CountBounds_Why3_ide_VCCountBounds_call_CountSectionBounds_pre_goal1
