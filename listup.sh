#!/bin/bash

 for f in .??*
 do
     [[ "$f" == ".bash_profile" ]] && continue
     [[ "$f" == ".git" ]] && continue
     echo "$f"
done  
