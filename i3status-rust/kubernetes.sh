#!/bin/bash

KCONTEXT=$(kubectl config current-context 2>/dev/null)
if [[ $?=="0" ]]; then
    CC=$(kubectl config view -ojsonpath='{.current-context}')
    echo -n "⎈ $KCONTEXT"
fi
