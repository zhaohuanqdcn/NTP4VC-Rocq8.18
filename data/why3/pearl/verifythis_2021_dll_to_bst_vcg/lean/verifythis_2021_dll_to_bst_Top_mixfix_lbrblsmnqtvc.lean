import Why3.Base
import Why3.ocaml.Exceptions
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace verifythis_2021_dll_to_bst_Top_mixfix_lbrblsmnqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom t : Type -> Type
axiom inhabited_axiom_t {χ : Type} [Inhabited χ] : Inhabited (t χ)
attribute [instance] inhabited_axiom_t
axiom to_fmap :  {χ : Type} -> [Inhabited χ] -> t χ -> Finmap (fun (_ : loc) => χ)
theorem mixfix_lbrblsmn'vc : True
  := sorry
end verifythis_2021_dll_to_bst_Top_mixfix_lbrblsmnqtvc
