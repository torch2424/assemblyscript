(module
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $v (func))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00c\00a\00l\00l\00-\00o\00p\00t\00i\00o\00n\00a\00l\00.\00t\00s")
 (table $0 2 anyfunc)
 (elem (i32.const 0) $null $call-optional/opt|trampoline)
 (global $~argc (mut i32) (i32.const 0))
 (global $call-optional/optIndirect (mut i32) (i32.const 1))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $call-optional/opt|trampoline (; 1 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  block $block$2$break
   block $block$3$break
    block $switch$1$default
     block $switch$1$case$5
      get_global $~argc
      i32.const 1
      i32.sub
      br_table $switch$1$case$5 $block$3$break $block$2$break $switch$1$default
     end
     i32.const -1
     set_local $1
     br $block$3$break
    end
    unreachable
   end
   i32.const -2
   set_local $2
  end
  get_local $0
  get_local $1
  i32.add
  get_local $2
  i32.add
 )
 (func $start (; 2 ;) (type $v)
  (local $0 i32)
  (local $1 i32)
  i32.const 1
  set_global $~argc
  block $block$3$break
   block $block$4$break
    block $switch$1$default
     block $switch$1$case$6
      get_global $~argc
      i32.const 1
      i32.sub
      br_table $switch$1$case$6 $block$4$break $block$3$break $switch$1$default
     end
     i32.const -1
     set_local $0
     br $block$4$break
    end
    unreachable
   end
   i32.const -2
   set_local $1
  end
  get_local $0
  i32.const 3
  i32.add
  get_local $1
  i32.add
  if
   i32.const 0
   i32.const 8
   i32.const 4
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 2
  set_global $~argc
  i32.const 4
  set_local $0
  i32.const 0
  set_local $1
  block $block$19$break
   block $block$20$break
    block $switch$17$default
     block $switch$17$case$22
      get_global $~argc
      i32.const 1
      i32.sub
      br_table $switch$17$case$22 $block$20$break $block$19$break $switch$17$default
     end
     i32.const -1
     set_local $0
     br $block$20$break
    end
    unreachable
   end
   i32.const -2
   set_local $1
  end
  get_local $0
  i32.const 3
  i32.add
  get_local $1
  i32.add
  i32.const 5
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 5
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 1
  set_global $~argc
  i32.const 3
  i32.const 0
  i32.const 0
  get_global $call-optional/optIndirect
  call_indirect (type $iiii)
  if
   i32.const 0
   i32.const 8
   i32.const 9
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 2
  set_global $~argc
  i32.const 3
  i32.const 4
  i32.const 0
  get_global $call-optional/optIndirect
  call_indirect (type $iiii)
  i32.const 5
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 10
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 3
  set_global $~argc
  i32.const 3
  i32.const 4
  i32.const 5
  get_global $call-optional/optIndirect
  call_indirect (type $iiii)
  i32.const 12
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 11
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
 )
 (func $null (; 3 ;) (type $v)
  nop
 )
)
