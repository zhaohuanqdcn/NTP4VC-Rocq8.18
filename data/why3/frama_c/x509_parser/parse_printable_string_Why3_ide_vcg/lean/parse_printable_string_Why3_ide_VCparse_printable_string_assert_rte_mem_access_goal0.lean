import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_printable_string_Why3_ide_VCparse_printable_string_assert_rte_mem_access_goal0
theorem goal0 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint16 i → ((0 : ℤ) < i → Memory.valid_rd t a_1 i) → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end parse_printable_string_Why3_ide_VCparse_printable_string_assert_rte_mem_access_goal0
