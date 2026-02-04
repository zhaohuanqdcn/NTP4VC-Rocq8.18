#!/bin/bash
eval $(opam env)

if [ ! -f "README.md" ]; then
    echo "Error: the working directory must be the home of NTP4Verif"
fi

first_line=$(head -n 1 README.md)
if [ "$first_line" != "# Neural Theorem Proving for Verification Conditions" ]; then
    echo "Error: the working directory must be the home of NTP4VC"
fi

if [[ "$PATH" != "$(pwd)/why3/bin"* ]]; then
    export PATH="$(pwd)/why3/bin:$PATH"
fi

if [[ "$PYTHONPATH" != *"$(pwd)"* ]]; then
    export PYTHONPATH="$(pwd):$PYTHONPATH"
fi


