var wat = `
(module
  (type $i (func (param i32) (result i32)))
  (export "test" (func $test))
  (func $test (type $i) (param $0 i32) (result i32)
    (block $0
      (block $1
        (block $2
          (br_if $0
            (i32.eq
              (get_local $0)
              (i32.const 0)
            )
          )
          (br_if $1
            (i32.eq
              (get_local $0)
              (i32.const 1)
            )
          )
          (br_if $2
            (i32.eq
              (get_local $0)
              (i32.const 2)
            )
          )
          (br_if $0
            (i32.eq
              (get_local $0)
              (i32.const 3)
            )
          )
          (br_if $1
            (i32.eq
              (get_local $0)
              (i32.const 4)
            )
          )
          (br_if $2
            (i32.eq
              (get_local $0)
              (i32.const 5)
            )
          )
          (br $2)
        )
        (return
          (i32.const 10)
        )
      )
      (return
        (i32.const 20)
      )
    )
    (return
      (i32.const 30)
    )
  )
)
`;

var binaryen = require("../../lib/binaryen");
var module = binaryen.parseText(wat);
binaryen.setOptimizeLevel(4);
binaryen.setShrinkLevel(0);
module.optimize();
console.log(module.emitText());
