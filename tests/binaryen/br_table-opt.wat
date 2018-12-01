(module
 (type $i (func (param i32) (result i32)))
 (export "test" (func $test))
 (func $test (; 0 ;) (; has Stack IR ;) (type $i) (param $0 i32) (result i32)
  (if
   (get_local $0)
   (block $block$2$break
    (if
     (i32.ne
      (get_local $0)
      (i32.const 1)
     )
     (block $block$3$break
      (if
       (i32.ne
        (get_local $0)
        (i32.const 2)
       )
       (block
        (br_if $block$2$break
         (i32.eq
          (get_local $0)
          (i32.const 3)
         )
        )
        (br_if $block$3$break
         (i32.eq
          (get_local $0)
          (i32.const 4)
         )
        )
       )
      )
      (return
       (i32.const 10)
      )
     )
    )
    (return
     (i32.const 20)
    )
   )
  )
  (i32.const 30)
 )
)

