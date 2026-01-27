import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace rac_PolyRefContracts_test2_auxqtvc
theorem test2_aux'vc {α : Type} [Inhabited α] (argref : α) (argx : α) (argy : α) (fact0 : ¬argref = argx) : argx = argy
  := sorry
end rac_PolyRefContracts_test2_auxqtvc
