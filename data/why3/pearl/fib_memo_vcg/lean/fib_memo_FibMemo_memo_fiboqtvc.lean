import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fib_memo_FibMemo_memo_fiboqtvc
axiom table : Type
axiom inhabited_axiom_table : Inhabited table
attribute [instance] inhabited_axiom_table
noncomputable def inv (t : ℤ -> Option ℤ) := ∀(x : ℤ) (y : ℤ), t x = Option.some y → y = Fibonacci.fib x
theorem memo_fibo'vc (n : ℤ) (table1 : ℤ -> Option ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : inv table1) : (∀(result : ℤ), table1 n = Option.some result → result = Fibonacci.fib n ∧ inv table1) ∧ (table1 n = Option.none → (((0 : ℤ) ≤ (2 : ℤ) * n + (1 : ℤ) ∧ (2 : ℤ) * n < (2 : ℤ) * n + (1 : ℤ)) ∧ (0 : ℤ) ≤ n ∧ inv table1) ∧ (∀(table2 : ℤ -> Option ℤ), let fn : ℤ := Fibonacci.fib n; inv table2 → fn = Fibonacci.fib n ∧ inv (Function.update table2 n (Option.some fn))))
  := sorry
end fib_memo_FibMemo_memo_fiboqtvc
