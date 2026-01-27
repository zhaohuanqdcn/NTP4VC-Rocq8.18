import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_complete_not_empty_empty_goal0
theorem goal0 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : i = (0 : ℤ) ∨ (0 : ℤ) < i
  := sorry
end max_element_Why3_ide_VCmax_element_complete_not_empty_empty_goal0
