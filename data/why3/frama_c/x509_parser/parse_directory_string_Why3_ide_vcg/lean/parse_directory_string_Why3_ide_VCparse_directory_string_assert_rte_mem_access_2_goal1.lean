import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_directory_string_Why3_ide_VCparse_directory_string_assert_rte_mem_access_2_goal1
theorem goal1 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(2147483646 : ℤ) ≤ i → (2 : ℤ) ≤ i → i ≤ (65537 : ℤ) → Memory.linked t → Cint.is_uint16 i → Memory.valid_rd t a_1 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t a_1 i) → Memory.valid_rd t (Memory.shift a (1 : ℤ)) (1 : ℤ)
  := sorry
end parse_directory_string_Why3_ide_VCparse_directory_string_assert_rte_mem_access_2_goal1
