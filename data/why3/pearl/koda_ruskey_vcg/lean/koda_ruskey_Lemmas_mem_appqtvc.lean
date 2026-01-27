import Why3.Base
import pearl.koda_ruskey_vcg.lean.koda_ruskey.KodaRuskey_Spec
open Classical
open Lean4Why3
namespace koda_ruskey_Lemmas_mem_appqtvc
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def mem_stack : ℤ -> List KodaRuskey_Spec.forest -> Prop
  | n, ([] : List KodaRuskey_Spec.forest) => False
  | n, (List.cons f tl) => KodaRuskey_Spec.mem_forest n f ∨ mem_stack n tl
theorem mem_app'vc (n : ℤ) (st1 : List KodaRuskey_Spec.forest) (st2 : List KodaRuskey_Spec.forest) (fact0 : mem_stack n (st1 ++ st2)) : mem_stack n st1 ∨ mem_stack n st2
  := sorry
end koda_ruskey_Lemmas_mem_appqtvc
