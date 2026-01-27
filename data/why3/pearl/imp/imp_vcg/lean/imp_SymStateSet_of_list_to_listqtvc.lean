import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.Svar
import pearl.imp.lib.lean.imp.Constraint
import pearl.imp.lib.lean.imp.SymState
open Classical
open Lean4Why3
namespace imp_SymStateSet_of_list_to_listqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset SymState.sym_state
axiom mk : Finset SymState.sym_state -> set
axiom mk'spec (s : Finset SymState.sym_state) : to_fset (mk s) = s
axiom choose1 : set -> SymState.sym_state
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom to_list : set -> List SymState.sym_state
axiom to_list'spec (e : SymState.sym_state) (s : set) : (e ∈ to_fset s) = (e ∈ to_list s)
axiom of_list : List SymState.sym_state -> set
axiom of_list'spec (e : SymState.sym_state) (l : List SymState.sym_state) : (e ∈ to_fset (of_list l)) = (e ∈ l)
theorem of_list_to_list'vc (s : set) : to_fset (of_list (to_list s)) = to_fset s
  := sorry
end imp_SymStateSet_of_list_to_listqtvc
