import Why3.Base
import pearl.koda_ruskey_vcg.lean.koda_ruskey.KodaRuskey_Spec
open Classical
open Lean4Why3
namespace koda_ruskey_Lemmas_white_forest_equivqtvc
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def mem_stack : ℤ -> List KodaRuskey_Spec.forest -> Prop
  | n, ([] : List KodaRuskey_Spec.forest) => False
  | n, (List.cons f tl) => KodaRuskey_Spec.mem_forest n f ∨ mem_stack n tl
noncomputable def size_stack : List KodaRuskey_Spec.forest -> ℤ
  | ([] : List KodaRuskey_Spec.forest) => (0 : ℤ)
  | (List.cons f st1) => KodaRuskey_Spec.size_forest f + size_stack st1
theorem white_forest_equiv'vc (f : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) : KodaRuskey_Spec.white_forest f c = (∀(i : ℤ), KodaRuskey_Spec.mem_forest i f → c i = KodaRuskey_Spec.color.White)
  := sorry
end koda_ruskey_Lemmas_white_forest_equivqtvc
