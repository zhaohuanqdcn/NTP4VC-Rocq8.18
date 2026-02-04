import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
open Classical
open Lean4Why3
namespace Globals
axiom Q_G___stdio_headnode_1722_region : Memory.region (1723 : ℤ) = (0 : ℤ)
axiom Q_G___stdio_headnode_1722_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (1723 : ℤ) = (11 : ℤ)
axiom Q_L___va_arg0_38234_region : Memory.region (38235 : ℤ) = (2 : ℤ)
axiom Q_L___va_arg0_38234_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (38235 : ℤ) = (0 : ℤ)
axiom Q_L_ch_20234_region : Memory.region (20235 : ℤ) = (2 : ℤ)
axiom Q_L_ch_20234_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (20235 : ℤ) = (0 : ℤ)
end Globals
