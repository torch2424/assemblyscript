(module
 (type $v (func))
 (memory $0 0)
 (table $0 1 anyfunc)
 (elem (i32.const 0) $null)
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $start (; 0 ;) (type $v)
  (local $0 i32)
  loop $shape$1$continue
   get_local $0
   i32.const 1
   i32.lt_s
   if
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    br $shape$1$continue
   end
  end
  i32.const 0
  set_local $0
  loop $shape$5$continue
   get_local $0
   i32.const 1
   i32.lt_s
   if
    get_local $0
    i32.const 1
    i32.add
    set_local $0
    br $shape$5$continue
   end
  end
 )
 (func $null (; 1 ;) (type $v)
  nop
 )
)
