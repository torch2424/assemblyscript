(module
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $v (func))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\06\00\00\00f\00o\00r\00.\00t\00s")
 (table $0 1 anyfunc)
 (elem (i32.const 0) $null)
 (global $for/i (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $start (; 1 ;) (type $v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  set_global $for/i
  loop $shape$1$continue
   get_global $for/i
   i32.const 10
   i32.lt_s
   if
    get_global $for/i
    i32.const 1
    i32.add
    set_global $for/i
    br $shape$1$continue
   end
  end
  get_global $for/i
  i32.const 10
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 5
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  loop $shape$8$continue
   get_local $0
   i32.const 10
   i32.lt_s
   if
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    br $shape$8$continue
   end
  end
  loop $shape$11$continue
   get_global $for/i
   i32.const 0
   i32.gt_s
   if
    get_global $for/i
    i32.const 1
    i32.sub
    set_global $for/i
    br $shape$11$continue
   end
  end
  get_global $for/i
  if
   i32.const 0
   i32.const 8
   i32.const 12
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  loop $shape$17$continue
   get_global $for/i
   i32.const 10
   i32.ne
   if
    get_global $for/i
    i32.const 1
    i32.add
    set_global $for/i
    br $shape$17$continue
   end
  end
  loop $shape$21$continue
   get_global $for/i
   i32.const 1
   i32.sub
   set_global $for/i
   get_global $for/i
   br_if $shape$21$continue
  end
  i32.const 0
  set_local $0
  loop $shape$25$continue
   get_local $0
   i32.const 10
   i32.lt_s
   if
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    br $shape$25$continue
   end
  end
  get_local $0
  i32.const 10
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 19
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 0
  set_local $0
  loop $shape$32$continue
   get_local $0
   i32.const 10
   i32.lt_s
   if
    i32.const 0
    set_local $1
    loop $shape$35$continue
     get_local $1
     i32.const 10
     i32.lt_s
     if
      get_local $1
      i32.const 1
      i32.add
      set_local $1
      br $shape$35$continue
     end
    end
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    br $shape$32$continue
   end
  end
 )
 (func $null (; 2 ;) (type $v)
  nop
 )
)
