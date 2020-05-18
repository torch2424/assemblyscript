// AssemblyScript
export class RegExp {

  // @binding(CALL_NEW, [ STRING, STRING], OBJECT_HANDLE)
  constructor(pattern: string, flags: string = "") { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [ STRING ], PASS_THRU)
  test(search: string): bool { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [], STRING)
  toString(): string { throw new Error("unreachable"); }

}

// libregexp from QuickJS

const CAPTURE_COUNT_MAX = 255;
const STACK_SIZE_MAX = 255;

// This main is meant to be used for testing the regex itself,
// But would be good to have here to understand how everything works
// Since it seems this is written in c-style OOP. Things are hard to follow
// And a lot of the code would be better off written by following the flow of execution
// Rather than trying to port unit by unit
//
// argv[0] = the command name
// argv[1] = the actual regex
// argv[2] = the string be are testing on the regex
function main(argc: i32, argv: Array<string>): i32 {
  // int len, ret, i;
  let len: i32 = 0;
  let ret: i32 = 0;
  let i: i32 = 0;

  // bc = bytecode?
  let bc: u32 = 0; // uint8_t *bc;
  let error_msg: Array<u8> = new Array<u8>(64);// char error_msg[64];
  let capture: Uint8Array = new Uint8Array(); // uint8_t *capture[CAPTURE_COUNT_MAX * 2];
  let input: string = ""; // const char *input;
  // int input_len, capture_count;
  let input_len: i32 = 0;
  let capture_count: i32 = 0;

  /*
  if (argc < 3) {
    printf("usage: %s regexp input\n", argv[0]);
    exit(1);
  }
  */

  bc = lre_compile(&len, error_msg, sizeof(error_msg), argv[1],
                   strlen(argv[1]), 0, NULL);

  if (bc == 0 /*!bc*/) {
    // fprintf(stderr, "error: %s\n", error_msg);
    // exit(1);

    throw new Error("Error lre_compile!")
  }

  input = argv[2];
  input_len = input.length;

  ret = lre_exec(capture, bc, input, 0, input_len, 0, NULL);

  // printf("ret=%d\n", ret);

  if (ret == 1) {
    capture_count = lre_get_capture_count(bc);
    for(i = 0; i < 2 * capture_count; i++) {
      let ptr: usize = 0; // uint8_t *ptr;
      ptr = capture[i];
      // printf("%d: ", i);
      if (!ptr) {
        // printf("<nil>");
      }
      else {
        // printf("%u", (int)(ptr - (uint8_t *)input));
      }
      // printf("\n");
    }
  }
  return 0;
}

class REParseState {
  byte_code: DynBuf;
  buf: ArrayBuffer;
  re_flags: i32; // int re_flags;
  is_utf16: boolean; // BOOL is_utf16;
  ignore_case: boolean; // BOOL ignore_case;
  dotall: boolean; // BOOL dotall;
  capture_count: i32; // int capture_count;
  total_capture_count: i32; // int total_capture_count; /* -1 = not computed yet */
  has_named_captures: i32; // int has_named_captures; /* -1 = don't know, 0 = no, 1 = yes */
  mem_opaque: u32; // void *mem_opaque;
  group_names: DynBuf; // DynBuf group_names;
  /*
     union {
     char error_msg[TMP_BUF_SIZE];
     char tmp_buf[TMP_BUF_SIZE];
     } u;
   */
  constructor() {
    
  }
}

const LRE_FLAG_GLOBAL: i32 = (1 << 0);
const LRE_FLAG_IGNORECASE: i32 = (1 << 1);
const LRE_FLAG_MULTILINE: i32 = (1 << 2);
const LRE_FLAG_DOTALL: i32 = (1 << 3);
const LRE_FLAG_UTF16: i32 = (1 << 4);
const LRE_FLAG_STICKY: i32 = (1 << 5);

/* 'buf' must be a zero terminated UTF-8 string of length buf_len.
 Return NULL if error and allocate an error message in *perror_msg,
 otherwise the compiled bytecode and its length in plen.
*/
function lre_compile(
  plen: u32, // int *plen, 
  error_msg: ArrayBuffer, // char *error_msg, 
  error_msg_size: i32, // int error_msg_size,
  buf: ArrayBuffer, // const char *buf, size_t buf_len,
  re_flags: i32, // int re_flags,
  opaque: usize //void *opaque
): u32 {
  REParseState s = new REParseState(); // REParseState s_s, *s = &s_s;
  let stack_size: i32 = 0; // int stack_size;
  let is_sticky: boolean = 0; // BOOL is_sticky;

  s.mem_opaque = opaque;
  s.buf = buf;
  s.re_flags = re_flags;
  s.is_utf16 = ((re_flags & LRE_FLAG_UTF16) != 0);
  is_sticky = ((re_flags & LRE_FLAG_STICKY) != 0);
  s.ignore_case = ((re_flags & LRE_FLAG_IGNORECASE) != 0);
  s.dotall = ((re_flags & LRE_FLAG_DOTALL) != 0);
  s.capture_count = 1;
  s.total_capture_count = -1;
  s.has_named_captures = -1;


  // TODO: LINE 1809 in QuickJS
}
