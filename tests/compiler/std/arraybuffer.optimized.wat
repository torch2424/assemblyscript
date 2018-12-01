(module
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $v (func))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\13\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 56) "\1c\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 120) "\12\00\00\00s\00t\00d\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (table $0 1 anyfunc)
 (elem (i32.const 0) $null)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $std/arraybuffer/buffer (mut i32) (i32.const 0))
 (global $~argc (mut i32) (i32.const 0))
 (global $std/arraybuffer/sliced (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $~lib/allocator/arena/__memory_allocate (; 1 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  get_local $0
  i32.const 1073741824
  i32.gt_u
  if
   unreachable
  end
  get_global $~lib/allocator/arena/offset
  tee_local $1
  get_local $0
  i32.const 1
  get_local $0
  i32.const 1
  i32.gt_u
  select
  i32.add
  i32.const 7
  i32.add
  i32.const -8
  i32.and
  tee_local $2
  current_memory
  tee_local $3
  i32.const 16
  i32.shl
  i32.gt_u
  if
   block $block$13$break
    get_local $3
    get_local $2
    get_local $1
    i32.sub
    i32.const 65535
    i32.add
    i32.const -65536
    i32.and
    i32.const 16
    i32.shr_u
    tee_local $0
    get_local $3
    get_local $0
    i32.gt_s
    select
    grow_memory
    i32.const 0
    i32.ge_s
    br_if $block$13$break
    get_local $0
    grow_memory
    i32.const 0
    i32.ge_s
    br_if $block$13$break
    unreachable
   end
  end
  get_local $2
  set_global $~lib/allocator/arena/offset
  get_local $1
 )
 (func $~lib/internal/arraybuffer/allocateUnsafe (; 2 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  get_local $0
  i32.const 1073741816
  i32.gt_u
  if (result i32)
   i32.const 0
   i32.const 56
   i32.const 23
   i32.const 2
   call $~lib/env/abort
   unreachable
  else   
   i32.const 1
   i32.const 32
   get_local $0
   i32.const 7
   i32.add
   i32.clz
   i32.sub
   i32.shl
   call $~lib/allocator/arena/__memory_allocate
   tee_local $1
   get_local $0
   i32.store
   get_local $1
  end
 )
 (func $~lib/internal/memory/memset (; 3 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  get_local $1
  i32.eqz
  if
   return
  end
  get_local $0
  i32.const 0
  i32.store8
  get_local $0
  get_local $1
  i32.add
  i32.const 1
  i32.sub
  i32.const 0
  i32.store8
  get_local $1
  i32.const 2
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 1
  i32.add
  i32.const 0
  i32.store8
  get_local $0
  i32.const 2
  i32.add
  i32.const 0
  i32.store8
  get_local $0
  get_local $1
  i32.add
  tee_local $2
  i32.const 2
  i32.sub
  i32.const 0
  i32.store8
  get_local $2
  i32.const 3
  i32.sub
  i32.const 0
  i32.store8
  get_local $1
  i32.const 6
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 3
  i32.add
  i32.const 0
  i32.store8
  get_local $0
  get_local $1
  i32.add
  i32.const 4
  i32.sub
  i32.const 0
  i32.store8
  get_local $1
  i32.const 8
  i32.le_u
  if
   return
  end
  i32.const 0
  get_local $0
  i32.sub
  i32.const 3
  i32.and
  tee_local $2
  get_local $0
  i32.add
  tee_local $0
  i32.const 0
  i32.store
  get_local $1
  get_local $2
  i32.sub
  i32.const -4
  i32.and
  tee_local $1
  get_local $0
  i32.add
  i32.const 4
  i32.sub
  i32.const 0
  i32.store
  get_local $1
  i32.const 8
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 4
  i32.add
  i32.const 0
  i32.store
  get_local $0
  i32.const 8
  i32.add
  i32.const 0
  i32.store
  get_local $0
  get_local $1
  i32.add
  tee_local $2
  i32.const 12
  i32.sub
  i32.const 0
  i32.store
  get_local $2
  i32.const 8
  i32.sub
  i32.const 0
  i32.store
  get_local $1
  i32.const 24
  i32.le_u
  if
   return
  end
  get_local $0
  i32.const 12
  i32.add
  i32.const 0
  i32.store
  get_local $0
  i32.const 16
  i32.add
  i32.const 0
  i32.store
  get_local $0
  i32.const 20
  i32.add
  i32.const 0
  i32.store
  get_local $0
  i32.const 24
  i32.add
  i32.const 0
  i32.store
  get_local $0
  get_local $1
  i32.add
  tee_local $2
  i32.const 28
  i32.sub
  i32.const 0
  i32.store
  get_local $2
  i32.const 24
  i32.sub
  i32.const 0
  i32.store
  get_local $2
  i32.const 20
  i32.sub
  i32.const 0
  i32.store
  get_local $2
  i32.const 16
  i32.sub
  i32.const 0
  i32.store
  get_local $0
  i32.const 4
  i32.and
  i32.const 24
  i32.add
  tee_local $2
  get_local $0
  i32.add
  set_local $0
  get_local $1
  get_local $2
  i32.sub
  set_local $1
  loop $shape$19$continue
   get_local $1
   i32.const 32
   i32.ge_u
   if
    get_local $0
    i64.const 0
    i64.store
    get_local $0
    i32.const 8
    i32.add
    i64.const 0
    i64.store
    get_local $0
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    get_local $0
    i32.const 24
    i32.add
    i64.const 0
    i64.store
    get_local $1
    i32.const 32
    i32.sub
    set_local $1
    get_local $0
    i32.const 32
    i32.add
    set_local $0
    br $shape$19$continue
   end
  end
 )
 (func $~lib/internal/memory/memcpy (; 4 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/internal/memory/memmove (; 5 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  get_local $0
  get_local $1
  i32.eq
  if
   return
  end
  get_local $1
  get_local $2
  i32.add
  get_local $0
  i32.le_u
  tee_local $3
  i32.eqz
  if
   get_local $0
   get_local $2
   i32.add
   get_local $1
   i32.le_u
   set_local $3
  end
  get_local $3
  if
   get_local $0
   get_local $1
   get_local $2
   call $~lib/internal/memory/memcpy
   return
  end
  block $block$70$break
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
     block $block$36$break
      block $block$28$break
       loop $shape$14$continue
        get_local $0
        i32.const 7
        i32.and
        i32.eqz
        br_if $block$28$break
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
         br $shape$14$continue
        end
       end
       return
      end
      loop $shape$20$continue
       get_local $2
       i32.const 8
       i32.lt_u
       br_if $block$36$break
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
       br $shape$20$continue
       unreachable
      end
      unreachable
     end
    end
    loop $shape$23$continue
     get_local $2
     i32.eqz
     br_if $block$70$break
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
     br $shape$23$continue
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
     block $block$64$break
      block $block$56$break
       loop $shape$28$continue
        get_local $0
        get_local $2
        i32.add
        i32.const 7
        i32.and
        i32.eqz
        br_if $block$56$break
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
         br $shape$28$continue
        end
       end
       return
      end
      loop $shape$34$continue
       get_local $2
       i32.const 8
       i32.lt_u
       br_if $block$64$break
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
       br $shape$34$continue
       unreachable
      end
      unreachable
     end
    end
    loop $shape$37$continue
     get_local $2
     i32.eqz
     br_if $block$70$break
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
     br $shape$37$continue
     unreachable
    end
    unreachable
   end
   unreachable
  end
 )
 (func $~lib/arraybuffer/ArrayBuffer#slice (; 6 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  get_local $0
  i32.load
  set_local $4
  get_local $1
  i32.const 0
  i32.lt_s
  if (result i32)
   get_local $1
   get_local $4
   i32.add
   tee_local $3
   i32.const 0
   get_local $3
   i32.const 0
   i32.gt_s
   select
  else   
   get_local $1
   tee_local $3
   get_local $4
   get_local $3
   get_local $4
   i32.lt_s
   select
  end
  set_local $1
  get_local $2
  i32.const 0
  i32.lt_s
  if (result i32)
   get_local $2
   get_local $4
   i32.add
   tee_local $3
   i32.const 0
   get_local $3
   i32.const 0
   i32.gt_s
   select
  else   
   get_local $2
   tee_local $3
   get_local $4
   get_local $3
   get_local $4
   i32.lt_s
   select
  end
  get_local $1
  i32.sub
  tee_local $3
  i32.const 0
  get_local $3
  i32.const 0
  i32.gt_s
  select
  tee_local $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  tee_local $3
  i32.const 8
  i32.add
  get_local $0
  i32.const 8
  i32.add
  get_local $1
  i32.add
  get_local $2
  call $~lib/internal/memory/memmove
  get_local $3
 )
 (func $~lib/arraybuffer/ArrayBuffer#slice|trampoline (; 7 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  block $block$2$break
   block $block$3$break
    block $switch$1$default
     block $switch$1$case$5
      get_global $~argc
      br_table $switch$1$case$5 $block$3$break $block$2$break $switch$1$default
     end
     i32.const 0
     set_local $1
     br $block$3$break
    end
    unreachable
   end
   i32.const 1073741816
   set_local $2
  end
  get_local $0
  get_local $1
  get_local $2
  call $~lib/arraybuffer/ArrayBuffer#slice
 )
 (func $start (; 8 ;) (type $v)
  (local $0 i32)
  i32.const 160
  set_global $~lib/allocator/arena/startOffset
  get_global $~lib/allocator/arena/startOffset
  set_global $~lib/allocator/arena/offset
  i32.const 8
  call $~lib/internal/arraybuffer/allocateUnsafe
  tee_local $0
  i32.const 8
  i32.add
  i32.const 8
  call $~lib/internal/memory/memset
  get_local $0
  set_global $std/arraybuffer/buffer
  get_global $std/arraybuffer/buffer
  i32.load
  i32.const 8
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 5
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 0
  set_global $~argc
  get_global $std/arraybuffer/buffer
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#slice|trampoline
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 8
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 9
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/buffer
  i32.eq
  if
   i32.const 0
   i32.const 120
   i32.const 10
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/buffer
  i32.eq
  if
   i32.const 0
   i32.const 120
   i32.const 11
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 1
  set_global $~argc
  get_global $std/arraybuffer/buffer
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#slice|trampoline
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 7
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 15
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 1
  set_global $~argc
  get_global $std/arraybuffer/buffer
  i32.const -1
  call $~lib/arraybuffer/ArrayBuffer#slice|trampoline
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 1
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 19
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/buffer
  i32.const 1
  i32.const 3
  call $~lib/arraybuffer/ArrayBuffer#slice
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 2
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 23
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/buffer
  i32.const 1
  i32.const -1
  call $~lib/arraybuffer/ArrayBuffer#slice
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 6
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 27
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/buffer
  i32.const -3
  i32.const -1
  call $~lib/arraybuffer/ArrayBuffer#slice
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 2
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 31
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/buffer
  i32.const -4
  i32.const 42
  call $~lib/arraybuffer/ArrayBuffer#slice
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  i32.const 4
  i32.ne
  if
   i32.const 0
   i32.const 120
   i32.const 35
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  i32.const 1
  set_global $~argc
  get_global $std/arraybuffer/buffer
  i32.const 42
  call $~lib/arraybuffer/ArrayBuffer#slice|trampoline
  set_global $std/arraybuffer/sliced
  get_global $std/arraybuffer/sliced
  i32.load
  if
   i32.const 0
   i32.const 120
   i32.const 39
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
  get_global $std/arraybuffer/sliced
  i32.eqz
  if
   i32.const 0
   i32.const 120
   i32.const 40
   i32.const 0
   call $~lib/env/abort
   unreachable
  end
 )
 (func $null (; 9 ;) (type $v)
  nop
 )
)
