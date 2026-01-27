import Why3.Base
open Classical
open Lean4Why3
namespace StackMachine
inductive asm where
  | Push : ℤ -> asm
  | Add : asm
  | Sub : asm
  | Mul : asm
axiom inhabited_axiom_asm : Inhabited asm
attribute [instance] inhabited_axiom_asm
axiom code : Type
axiom inhabited_axiom_code : Inhabited code
attribute [instance] inhabited_axiom_code
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def compute : List ℤ -> List asm -> List ℤ
  | s, ([] : List asm) => s
  | s, (List.cons a1 r) => match (a1, s) with | (asm.Push n, _) => compute (List.cons n s) r | (asm.Add, List.cons n1 (List.cons n2 s1)) => compute (List.cons (n2 + n1) s1) r | (asm.Sub, List.cons n1 (List.cons n2 s1)) => compute (List.cons (n2 - n1) s1) r | (asm.Mul, List.cons n1 (List.cons n2 s1)) => compute (List.cons (n2 * n1) s1) r | _ => s
end StackMachine
