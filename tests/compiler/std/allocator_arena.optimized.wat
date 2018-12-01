(module
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $v (func))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\16\00\00\00s\00t\00d\00/\00a\00l\00l\00o\00c\00a\00t\00o\00r\00_\00a\00r\00e\00n\00a\00.\00t\00s")
 (table $0 1 anyfunc)
 (elem (i32.const 0) $null)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $std/allocator_arena/ptr1 (mut i32) (i32.const 0))
 (global $std/allocator_arena/ptr2 (mut i32) (i32.const 0))
 (global $std/allocator_arena/i (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $~lib/allocator/arena/__memory_allocate (; 1 ;) (type $FUNCSIG$i) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  get_global $~lib/allocator/arena/offset
  tee_local $0
  i32.const 49
  i32.add
  i32.const -8
  i32.and
  tee_local $1
  current_memory
  tee_local $2
  i32.const 16
  i32.shl
  i32.gt_u
  if
   block $block$8$break
    get_local $2
    get_local $1
    get_local $0
    i32.sub
    i32.const 65535
    i32.add
    i32.const -65536
    i32.and
    i32.const 16
    i32.shr_u
    tee_local $3
    get_local $2
    get_local $3
    i32.gt_s
    select
    grow_memory
    i32.const 0
    i32.ge_s
    br_if $block$8$break
    get_local $3
    grow_memory
    i32.const 0
    i32.ge_s
    br_if $block$8$break
    unreachable
   end
  end
  get_local $1
  set_global $~lib/allocator/arena/offset
  get_local $0
 )
 (func $~lib/internal/memory/memset (; 2 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  get_local $0
  i32.const 18
  i32.store8
  get_local $0
  i32.const 42
  i32.add
  tee_local $1
  i32.const 1
  i32.sub
  i32.const 18
  i32.store8
  get_local $0
  i32.const 1
  i32.add
  i32.const 18
  i32.store8
  get_local $0
  i32.const 2
  i32.add
  i32.const 18
  i32.store8
  get_local $1
  i32.const 2
  i32.sub
  i32.const 18
  i32.store8
  get_local $1
  i32.const 3
  i32.sub
  i32.const 18
  i32.store8
  get_local $0
  i32.const 3
  i32.add
  i32.const 18
  i32.store8
  get_local $1
  i32.const 4
  i32.sub
  i32.const 18
  i32.store8
  i32.const 0
  get_local $0
  i32.sub
  i32.const 3
  i32.and
  tee_local $1
  get_local $0
  i32.add
  tee_local $0
  i32.const 303174162
  i32.store
  i32.const 42
  get_local $1
  i32.sub
  i32.const -4
  i32.and
  tee_local $2
  get_local $0
  i32.add
  i32.const 4
  i32.sub
  i32.const 303174162
  i32.store
  get_local $2
  i32.const 8
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 4
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  i32.const 8
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  get_local $2
  i32.add
  tee_local $1
  i32.const 12
  i32.sub
  i32.const 303174162
  i32.store
  get_local $1
  i32.const 8
  i32.sub
  i32.const 303174162
  i32.store
  get_local $2
  i32.const 24
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 12
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  i32.const 16
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  i32.const 20
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  i32.const 24
  i32.add
  i32.const 303174162
  i32.store
  get_local $0
  get_local $2
  i32.add
  tee_local $1
  i32.const 28
  i32.sub
  i32.const 303174162
  i32.store
  get_local $1
  i32.const 24
  i32.sub
  i32.const 303174162
  i32.store
  get_local $1
  i32.const 20
  i32.sub
  i32.const 303174162
  i32.store
  get_local $1
  i32.const 16
  i32.sub
  i32.const 303174162
  i32.store
  get_local $0
  i32.const 4
  i32.and
  i32.const 24
  i32.add
  tee_local $1
  get_local $0
  i32.add
  set_local $0
  get_local $2
  get_local $1
  i32.sub
  set_local $2
  loop $shape$7$continue
   get_local $2
   i32.const 32
   i32.ge_u
   if
    get_local $0
    i64.const 1302123111085380114
    i64.store
    get_local $0
    i32.const 8
    i32.add
    i64.const 1302123111085380114
    i64.store
    get_local $0
    i32.const 16
    i32.add
    i64.const 1302123111085380114
    i64.store
    get_local $0
    i32.const 24
    i32.add
    i64.const 1302123111085380114
    i64.store
    get_local $2
    i32.const 32
    i32.sub
    set_local $2
    get_local $0
    i32.const 32
    i32.add
    set_local $0
    br $shape$7$continue
   end
  end
 )
 (func $~lib/internal/memory/memcpy (; 3 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  loop $shape$1$continue
   get_local $2
   if (result i32)
    get_local $1
    i32.const 3
    i32.and
   else    
    get_local $2
   end
   if
    get_local $0
    tee_local $3
    i32.const 1
    i32.add
    set_local $0
    get_local $3
    set_local $4
    get_local $1
    tee_local $3
    i32.const 1
    i32.add
    set_local $1
    get_local $4
    get_local $3
    i32.load8_u
    i32.store8
    get_local $2
    i32.const 1
    i32.sub
    set_local $2
    br $shape$1$continue
   end
  end
  get_local $0
  i32.const 3
  i32.and
  i32.eqz
  if
   loop $shape$10$continue
    get_local $2
    i32.const 16
    i32.ge_u
    if
     get_local $0
     get_local $1
     i32.load
     i32.store
     get_local $0
     i32.const 4
     i32.add
     get_local $1
     i32.const 4
     i32.add
     i32.load
     i32.store
     get_local $0
     i32.const 8
     i32.add
     get_local $1
     i32.const 8
     i32.add
     i32.load
     i32.store
     get_local $0
     i32.const 12
     i32.add
     get_local $1
     i32.const 12
     i32.add
     i32.load
     i32.store
     get_local $1
     i32.const 16
     i32.add
     set_local $1
     get_local $0
     i32.const 16
     i32.add
     set_local $0
     get_local $2
     i32.const 16
     i32.sub
     set_local $2
     br $shape$10$continue
    end
   end
   get_local $2
   i32.const 8
   i32.and
   if
    get_local $0
    get_local $1
    i32.load
    i32.store
    get_local $0
    i32.const 4
    i32.add
    get_local $1
    i32.const 4
    i32.add
    i32.load
    i32.store
    get_local $0
    i32.const 8
    i32.add
    set_local $0
    get_local $1
    i32.const 8
    i32.add
    set_local $1
   end
   get_local $2
   i32.const 4
   i32.and
   if
    get_local $0
    get_local $1
    i32.load
    i32.store
    get_local $0
    i32.const 4
    i32.add
    set_local $0
    get_local $1
    i32.const 4
    i32.add
    set_local $1
   end
   get_local $2
   i32.const 2
   i32.and
   if
    get_local $0
    get_local $1
    i32.load16_u
    i32.store16
    get_local $0
    i32.const 2
    i32.add
    set_local $0
    get_local $1
    i32.const 2
    i32.add
    set_local $1
   end
   get_local $2
   i32.const 1
   i32.and
   if
    get_local $0
    get_local $1
    i32.load8_u
    i32.store8
   end
   return
  end
  get_local $2
  i32.const 32
  i32.ge_u
  if
   block $block$72$break
    get_local $0
    i32.const 3
    i32.and
    tee_local $3
    i32.const 1
    i32.eq
    if
     get_local $1
     i32.load
     set_local $5
     get_local $0
     get_local $1
     i32.load8_u
     i32.store8
     get_local $0
     i32.const 1
     i32.add
     tee_local $0
     get_local $1
     i32.const 1
     i32.add
     tee_local $1
     i32.load8_u
     i32.store8
     get_local $0
     i32.const 1
     i32.add
     tee_local $0
     set_local $3
     get_local $0
     i32.const 1
     i32.add
     set_local $0
     get_local $3
     set_local $4
     get_local $1
     i32.const 1
     i32.add
     tee_local $1
     set_local $3
     get_local $1
     i32.const 1
     i32.add
     set_local $1
     get_local $4
     get_local $3
     i32.load8_u
     i32.store8
     get_local $2
     i32.const 3
     i32.sub
     set_local $2
     loop $shape$31$continue
      get_local $2
      i32.const 17
      i32.lt_u
      br_if $block$72$break
      get_local $0
      get_local $1
      i32.const 1
      i32.add
      i32.load
      tee_local $3
      i32.const 8
      i32.shl
      get_local $5
      i32.const 24
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 4
      i32.add
      get_local $1
      i32.const 5
      i32.add
      i32.load
      tee_local $5
      i32.const 8
      i32.shl
      get_local $3
      i32.const 24
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 8
      i32.add
      get_local $1
      i32.const 9
      i32.add
      i32.load
      tee_local $3
      i32.const 8
      i32.shl
      get_local $5
      i32.const 24
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 12
      i32.add
      get_local $1
      i32.const 13
      i32.add
      i32.load
      tee_local $5
      i32.const 8
      i32.shl
      get_local $3
      i32.const 24
      i32.shr_u
      i32.or
      i32.store
      get_local $1
      i32.const 16
      i32.add
      set_local $1
      get_local $0
      i32.const 16
      i32.add
      set_local $0
      get_local $2
      i32.const 16
      i32.sub
      set_local $2
      br $shape$31$continue
      unreachable
     end
     unreachable
    end
    get_local $3
    i32.const 2
    i32.eq
    if
     get_local $1
     i32.load
     set_local $5
     get_local $0
     get_local $1
     i32.load8_u
     i32.store8
     get_local $0
     i32.const 1
     i32.add
     tee_local $0
     set_local $3
     get_local $0
     i32.const 1
     i32.add
     set_local $0
     get_local $3
     set_local $4
     get_local $1
     i32.const 1
     i32.add
     tee_local $1
     set_local $3
     get_local $1
     i32.const 1
     i32.add
     set_local $1
     get_local $4
     get_local $3
     i32.load8_u
     i32.store8
     get_local $2
     i32.const 2
     i32.sub
     set_local $2
     loop $shape$37$continue
      get_local $2
      i32.const 18
      i32.lt_u
      br_if $block$72$break
      get_local $0
      get_local $1
      i32.const 2
      i32.add
      i32.load
      tee_local $3
      i32.const 16
      i32.shl
      get_local $5
      i32.const 16
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 4
      i32.add
      get_local $1
      i32.const 6
      i32.add
      i32.load
      tee_local $5
      i32.const 16
      i32.shl
      get_local $3
      i32.const 16
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 8
      i32.add
      get_local $1
      i32.const 10
      i32.add
      i32.load
      tee_local $3
      i32.const 16
      i32.shl
      get_local $5
      i32.const 16
      i32.shr_u
      i32.or
      i32.store
      get_local $0
      i32.const 12
      i32.add
      get_local $1
      i32.const 14
      i32.add
      i32.load
      tee_local $5
      i32.const 16
      i32.shl
      get_local $3
      i32.const 16
      i32.shr_u
      i32.or
      i32.store
      get_local $1
      i32.const 16
      i32.add
      set_local $1
      get_local $0
      i32.const 16
      i32.add
      set_local $0
      get_local $2
      i32.const 16
      i32.sub
      set_local $2
      br $shape$37$continue
      unreachable
     end
     unreachable
    end
    get_local $3
    i32.const 3
    i32.ne
    br_if $block$72$break
    get_local $1
    i32.load
    set_local $5
    get_local $0
    tee_local $3
    i32.const 1
    i32.add
    set_local $0
    get_local $3
    set_local $4
    get_local $1
    tee_local $3
    i32.const 1
    i32.add
    set_local $1
    get_local $4
    get_local $3
    i32.load8_u
    i32.store8
    get_local $2
    i32.const 1
    i32.sub
    set_local $2
    loop $shape$42$continue
     get_local $2
     i32.const 19
     i32.lt_u
     br_if $block$72$break
     get_local $0
     get_local $1
     i32.const 3
     i32.add
     i32.load
     tee_local $3
     i32.const 24
     i32.shl
     get_local $5
     i32.const 8
     i32.shr_u
     i32.or
     i32.store
     get_local $0
     i32.const 4
     i32.add
     get_local $1
     i32.const 7
     i32.add
     i32.load
     tee_local $5
     i32.const 24
     i32.shl
     get_local $3
     i32.const 8
     i32.shr_u
     i32.or
     i32.store
     get_local $0
     i32.const 8
     i32.add
     get_local $1
     i32.const 11
     i32.add
     i32.load
     tee_local $3
     i32.const 24
     i32.shl
     get_local $5
     i32.const 8
     i32.shr_u
     i32.or
     i32.store
     get_local $0
     i32.const 12
     i32.add
     get_local $1
     i32.const 15
     i32.add
     i32.load
     tee_local $5
     i32.const 24
     i32.shl
     get_local $3
     i32.const 8
     i32.shr_u
     i32.or
     i32.store
     get_local $1
     i32.const 16
     i32.add
     set_local $1
     get_local $0
     i32.const 16
     i32.add
     set_local $0
     get_local $2
     i32.const 16
     i32.sub
     set_local $2
     br $shape$42$continue
     unreachable
    end
    unreachable
   end
  end
  get_local $2
  i32.const 16
  i32.and
  if
   get_local $0
   get_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   set_local $3
   get_local $0
   i32.const 1
   i32.add
   set_local $0
   get_local $3
   set_local $4
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   set_local $3
   get_local $1
   i32.const 1
   i32.add
   set_local $1
   get_local $4
   get_local $3
   i32.load8_u
   i32.store8
  end
  get_local $2
  i32.const 8
  i32.and
  if
   get_local $0
   get_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   set_local $3
   get_local $0
   i32.const 1
   i32.add
   set_local $0
   get_local $3
   set_local $4
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   set_local $3
   get_local $1
   i32.const 1
   i32.add
   set_local $1
   get_local $4
   get_local $3
   i32.load8_u
   i32.store8
  end
  get_local $2
  i32.const 4
  i32.and
  if
   get_local $0
   get_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   set_local $3
   get_local $0
   i32.const 1
   i32.add
   set_local $0
   get_local $3
   set_local $4
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   set_local $3
   get_local $1
   i32.const 1
   i32.add
   set_local $1
   get_local $4
   get_local $3
   i32.load8_u
   i32.store8
  end
  get_local $2
  i32.const 2
  i32.and
  if
   get_local $0
   get_local $1
   i32.load8_u
   i32.store8
   get_local $0
   i32.const 1
   i32.add
   tee_local $0
   set_local $3
   get_local $0
   i32.const 1
   i32.add
   set_local $0
   get_local $3
   set_local $4
   get_local $1
   i32.const 1
   i32.add
   tee_local $1
   set_local $3
   get_local $1
   i32.const 1
   i32.add
   set_local $1
   get_local $4
   get_local $3
   i32.load8_u
   i32.store8
  end
  get_local $2
  i32.const 1
  i32.and
  if
   get_local $0
   get_local $1
   i32.load8_u
   i32.store8
  end
 )
 (func $~lib/internal/memory/memmove (; 4 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 42
  set_local $2
  get_local $0
  get_local $1
  i32.eq
  if
   return
  end
  get_local $1
  i32.const 42
  i32.add
  get_local $0
  i32.le_u
  tee_local $3
  i32.eqz
  if
   get_local $0
   i32.const 42
   i32.add
   get_local $1
   i32.le_u
   set_local $3
  end
  get_local $3
  if
   get_local $0
   get_local $1
   i32.const 42
   call $~lib/internal/memory/memcpy
   return
  end
  block $block$13$break
   get_local $0
   get_local $1
   i32.lt_u
   if
    get_local $1
    i32.const 7
    i32.and
    get_local $0
    i32.const 7
    i32.and
    i32.eq
    if
     block $block$34$break
      block $block$27$break
       loop $shape$13$continue
        get_local $0
        i32.const 7
        i32.and
        i32.eqz
        br_if $block$27$break
        get_local $2
        if
         get_local $2
         i32.const 1
         i32.sub
         set_local $2
         get_local $0
         tee_local $3
         i32.const 1
         i32.add
         set_local $0
         get_local $3
         set_local $4
         get_local $1
         tee_local $3
         i32.const 1
         i32.add
         set_local $1
         get_local $4
         get_local $3
         i32.load8_u
         i32.store8
         br $shape$13$continue
        end
       end
       return
      end
      loop $shape$19$continue
       get_local $2
       i32.const 8
       i32.lt_u
       br_if $block$34$break
       get_local $0
       get_local $1
       i64.load
       i64.store
       get_local $2
       i32.const 8
       i32.sub
       set_local $2
       get_local $0
       i32.const 8
       i32.add
       set_local $0
       get_local $1
       i32.const 8
       i32.add
       set_local $1
       br $shape$19$continue
       unreachable
      end
      unreachable
     end
    end
    loop $shape$22$continue
     get_local $2
     i32.eqz
     br_if $block$13$break
     get_local $0
     tee_local $3
     i32.const 1
     i32.add
     set_local $0
     get_local $3
     set_local $4
     get_local $1
     tee_local $3
     i32.const 1
     i32.add
     set_local $1
     get_local $4
     get_local $3
     i32.load8_u
     i32.store8
     get_local $2
     i32.const 1
     i32.sub
     set_local $2
     br $shape$22$continue
     unreachable
    end
    unreachable
   else    
    get_local $1
    i32.const 7
    i32.and
    get_local $0
    i32.const 7
    i32.and
    i32.eq
    if
     block $block$61$break
      block $block$54$break
       loop $shape$27$continue
        get_local $0
        get_local $2
        i32.add
        i32.const 7
        i32.and
        i32.eqz
        br_if $block$54$break
        get_local $2
        if
         get_local $2
         i32.const 1
         i32.sub
         tee_local $2
         get_local $0
         i32.add
         get_local $1
         get_local $2
         i32.add
         i32.load8_u
         i32.store8
         br $shape$27$continue
        end
       end
       return
      end
      loop $shape$33$continue
       get_local $2
       i32.const 8
       i32.lt_u
       br_if $block$61$break
       get_local $2
       i32.const 8
       i32.sub
       tee_local $2
       get_local $0
       i32.add
       get_local $1
       get_local $2
       i32.add
       i64.load
       i64.store
       br $shape$33$continue
       unreachable
      end
      unreachable
     end
    end
    loop $shape$36$continue
     get_local $2
     i32.eqz
     br_if $block$13$break
     get_local $2
     i32.const 1
     i32.sub
     tee_local $2
     get_local $0
     i32.add
     get_local $1
     get_local $2
     i32.add
     i32.load8_u
     i32.store8
     br $shape$36$continue
     unreachable
    end
    unreachable
   end
   unreachable
  end
 )
 (func $~lib/internal/memory/memcmp (; 5 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 42
  set_local $2
  get_local $0
  get_local $1
  i32.eq
  if
   i32.const 0
   return
  end
  loop $shape$3$continue
   get_local $2
   i32.const 0
   i32.ne
   tee_local $3
   if
    get_local $0
    i32.load8_u
    get_local $1
    i32.load8_u
    i32.eq
    set_local $3
   end
   get_local $3
   if
    get_local $2
    i32.const 1
    i32.sub
    set_local $2
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    get_local $1
    i32.const 1
    i32.add
    set_local $1
    br $shape$3$continue
   end
  end
  get_local $2
  if (result i32)
   get_local $0
   i32.load8_u
   get_local $1
   i32.load8_u
   i32.sub
  else   
   i32.const 0
  end
 )
 (func $start (; 6 ;) (type $v)
  i32.const 56
  set_global $~lib/allocator/arena/startOffset
  get_global $~lib/allocator/arena/startOffset
  set_global $~lib/allocator/arena/offset
  call $~lib/allocator/arena/__memory_allocate
  set_global $std/allocator_arena/ptr1
  call $~lib/allocator/arena/__memory_allocate
  set_global $std/allocator_arena/ptr2
  get_global $std/allocator_arena/ptr1
  get_global $std/allocator_arena/ptr2
  i32.eq
  if
   i32.const 0
   i32.const 8
   i32.const 7
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/allocator_arena/ptr1
  call $~lib/internal/memory/memset
  i32.const 0
  set_global $std/allocator_arena/i
  block $block$7$break
   loop $shape$4$continue
    get_global $std/allocator_arena/i
    i32.const 42
    i32.ge_u
    br_if $block$7$break
    get_global $std/allocator_arena/ptr1
    get_global $std/allocator_arena/i
    i32.add
    i32.load8_u
    i32.const 18
    i32.eq
    if
     get_global $std/allocator_arena/i
     i32.const 1
     i32.add
     set_global $std/allocator_arena/i
     br $shape$4$continue
    end
   end
   i32.const 0
   i32.const 8
   i32.const 12
   i32.const 27
   call $~lib/env/abort
   unreachable
  end
  get_global $std/allocator_arena/ptr2
  get_global $std/allocator_arena/ptr1
  call $~lib/internal/memory/memmove
  i32.const 0
  set_global $std/allocator_arena/i
  block $block$17$break
   loop $shape$11$continue
    get_global $std/allocator_arena/i
    i32.const 42
    i32.ge_u
    br_if $block$17$break
    get_global $std/allocator_arena/ptr2
    get_global $std/allocator_arena/i
    i32.add
    i32.load8_u
    i32.const 18
    i32.eq
    if
     get_global $std/allocator_arena/i
     i32.const 1
     i32.add
     set_global $std/allocator_arena/i
     br $shape$11$continue
    end
   end
   i32.const 0
   i32.const 8
   i32.const 16
   i32.const 27
   call $~lib/env/abort
   unreachable
  end
  get_global $std/allocator_arena/ptr1
  get_global $std/allocator_arena/ptr2
  call $~lib/internal/memory/memcmp
  if
   i32.const 0
   i32.const 8
   i32.const 18
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $~lib/allocator/arena/startOffset
  set_global $~lib/allocator/arena/offset
  call $~lib/allocator/arena/__memory_allocate
  set_global $std/allocator_arena/ptr1
  get_global $std/allocator_arena/ptr1
  i32.const 56
  i32.ne
  if
   i32.const 0
   i32.const 8
   i32.const 25
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
 )
 (func $null (; 7 ;) (type $v)
  nop
 )
)
