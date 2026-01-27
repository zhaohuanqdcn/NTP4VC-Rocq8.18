import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_GeneralSubtrees_Why3_ide_VCparse_GeneralSubtrees_call_parse_GeneralName_pre_goal0
theorem goal0 (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_2 ≤ i_1 → i + i_2 ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) → Memory.valid_rd t a_1 i
  := sorry
end parse_GeneralSubtrees_Why3_ide_VCparse_GeneralSubtrees_call_parse_GeneralName_pre_goal0
