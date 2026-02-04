import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
open Classical
open Lean4Why3
namespace Compound
noncomputable def shift___anonstruct__name_oid_11 (p : Memory.addr) (k : ℤ) := Memory.shift p ((3 : ℤ) * k)
noncomputable def shift___anonstruct__ext_oid_14 (p : Memory.addr) (k : ℤ) := Memory.shift p ((3 : ℤ) * k)
noncomputable def shift___anonstruct__kp_oid_13 (p : Memory.addr) (k : ℤ) := Memory.shift p ((2 : ℤ) * k)
end Compound
