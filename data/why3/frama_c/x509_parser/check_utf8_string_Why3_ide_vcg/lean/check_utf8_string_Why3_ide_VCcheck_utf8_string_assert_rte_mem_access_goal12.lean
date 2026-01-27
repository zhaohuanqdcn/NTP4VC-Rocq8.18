import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_utf8_string_Why3_ide_VCcheck_utf8_string_assert_rte_mem_access_goal12
theorem goal12 (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Memory.valid_rd t a_2 i → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) → Memory.valid_rd t a_2 (1 : ℤ)
  := sorry
end check_utf8_string_Why3_ide_VCcheck_utf8_string_assert_rte_mem_access_goal12
