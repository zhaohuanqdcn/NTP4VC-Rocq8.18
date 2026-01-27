import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_GeneralName_Why3_ide_VCparse_GeneralName_assert_rte_mem_access_goal11
theorem goal11 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬i = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a_1 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → Memory.valid_rd t a_3 (1 : ℤ)
  := sorry
end parse_GeneralName_Why3_ide_VCparse_GeneralName_assert_rte_mem_access_goal11
