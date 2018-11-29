(module
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $v (func))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\05\00\00\00d\00o\00.\00t\00s")
 (table $0 1 anyfunc)
 (elem (i32.const 0) $null)
 (global $do/n (mut i32) (i32.const 10))
 (global $do/m (mut i32) (i32.const 0))
 (global $do/o (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $start (; 1 ;) (type $v)
  (local $0 i32)
  loop $shape$1$continue
   get_global $do/n
   i32.const 1
   i32.sub
   set_global $do/n
   get_global $do/m
   i32.const 1
   i32.add
   set_global $do/m
   get_global $do/n
   br_if $shape$1$continue
  end
  get_global $do/n
  if
   i32.const 0
   i32.const 8
   i32.const 7
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $do/m
  i32.const 10
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 8
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 10
  set_global $do/n
  loop $shape$10$continue
   get_global $do/n
   tee_local $0
   i32.const 1
   i32.sub
   set_global $do/n
   get_local $0
   br_if $shape$10$continue
  end
  get_global $do/n
  i32.const -1
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 12
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 10
  set_global $do/n
  i32.const 0
  set_global $do/m
  block $block$33$break
   block $block$28$break
    loop $shape$16$continue
     get_global $do/n
     i32.const 1
     i32.sub
     set_global $do/n
     get_global $do/m
     i32.const 1
     i32.add
     set_global $do/m
     loop $shape$18$continue
      get_global $do/n
      i32.const 1
      i32.sub
      set_global $do/n
      get_global $do/o
      i32.const 1
      i32.add
      set_global $do/o
      get_global $do/n
      br_if $shape$18$continue
     end
     get_global $do/n
     br_if $block$28$break
     get_global $do/o
     i32.const 9
     i32.ne
     br_if $block$33$break
     get_global $do/n
     br_if $shape$16$continue
    end
    get_global $do/n
    if
     i32.const 0
     i32.const 8
     i32.const 27
     i32.const 0
     call $~lib/env/abort
     unreachable
    end
    get_global $do/m
    i32.const 1
    i32.ne
    if
     i32.const 0
     i32.const 8
     i32.const 28
     i32.const 0
     call $~lib/env/abort
     unreachable
    end
    get_global $do/o
    i32.const 9
    i32.ne
    if
     i32.const 0
     i32.const 8
     i32.const 29
     i32.const 0
     call $~lib/env/abort
     unreachable
    else     
     return
    end
    unreachable
   end
   i32.const 0
   i32.const 8
   i32.const 24
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  i32.const 0
  i32.const 8
  i32.const 25
  i32.const 2
  call $~lib/env/abort
  unreachable
 )
 (func $null (; 2 ;) (type $v)
  nop
 )
)
