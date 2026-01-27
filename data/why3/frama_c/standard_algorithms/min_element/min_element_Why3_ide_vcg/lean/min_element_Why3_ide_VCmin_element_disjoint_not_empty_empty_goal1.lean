import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.min_element.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace min_element_Why3_ide_VCmin_element_disjoint_not_empty_empty_goal1
theorem goal1 (a : Memory.addr) (t : ℤ -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 (0 : ℤ)) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (0 : ℤ)) : ¬True ∨ (0 : ℤ) ≤ (0 : ℤ)
  := sorry
end min_element_Why3_ide_VCmin_element_disjoint_not_empty_empty_goal1
