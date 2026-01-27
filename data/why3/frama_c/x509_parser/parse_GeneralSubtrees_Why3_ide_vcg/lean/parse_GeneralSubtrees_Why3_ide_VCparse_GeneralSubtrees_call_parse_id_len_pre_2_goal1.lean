import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_GeneralSubtrees_Why3_ide_VCparse_GeneralSubtrees_call_parse_id_len_pre_2_goal1
theorem goal1 (a : Memory.addr) (i_2 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; let a_2 : Memory.addr := Memory.shift a (i_2 + i_3); let x : ℤ := i_4 - i_3; ¬i_1 = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → i_4 ≤ i_1 → i_3 < i_4 → (0 : ℤ) ≤ i_4 → i_2 + i_4 ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (1 : ℤ) → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_3 → i_3 ≤ (2147483648 : ℤ) + i_4 → i_4 ≤ (65535 : ℤ) + i_3 → i_4 ≤ (2147483647 : ℤ) + i_3 → Memory.linked t → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_sint32 i → Cint.is_uint16 x → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) → ((0 : ℤ) < i_4 → Memory.valid_rd t a_1 i_4) → Memory.valid_rd t a_2 x
  := sorry
end parse_GeneralSubtrees_Why3_ide_VCparse_GeneralSubtrees_call_parse_id_len_pre_2_goal1
