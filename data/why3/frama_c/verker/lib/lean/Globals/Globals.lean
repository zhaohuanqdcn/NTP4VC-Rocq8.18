import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
open Classical
open Lean4Why3
namespace Globals
axiom Q_G_ccmp_2604_region : Memory.region (2605 : ℤ) = (0 : ℤ)
axiom Q_G_ccmp_2604_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (2605 : ℤ) = (1 : ℤ)
end Globals
