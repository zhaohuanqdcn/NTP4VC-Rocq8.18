import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace check_visible_string_Why3_ide_VCcheck_visible_string_assert_rte_mem_access_goal0
theorem goal0 (i_1 : ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (fact0 : ¬i_1 = (0 : ℤ)) (fact1 : ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) (fact2 : i < i_1) (fact3 : (0 : ℤ) ≤ i_1) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Memory.linked t) (fact6 : Cint.is_uint16 i) (fact7 : Cint.is_uint16 i_1) (fact8 : (0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) : Memory.valid_rd t (Memory.shift a i) (1 : ℤ)
  := sorry
end check_visible_string_Why3_ide_VCcheck_visible_string_assert_rte_mem_access_goal0
