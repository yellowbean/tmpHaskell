# reproduceAeson



### Upgrade error to resolver:19.33 from resolver:18.28

#### What works ?

in `stack.yaml` ,resolver: lts-18.28

in the stack 

    *Lib> encode $ AppleA
    "{\"tag\":\"AppleA\"}"

#### What fails ? 
in `stack.yaml` ,resolver: lts-19.33

then the stack will failed to compile ..

##### (for Mac M chips)

When stack compiling need t include extra flag

    export C_INCLUDE_PATH="`xcrun --show-sdk-path`/usr/include/ffi"; stack build