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

/* 'buf' must be a zero terminated UTF-8 string of length buf_len.
   Return NULL if error and allocate an error message in *perror_msg,
   otherwise the compiled bytecode and its length in plen.
 */
function lre_compile(
  plen: u32, // int *plen, 
  error_msg: ArrayBuffer, // char *error_msg, 
  error_msg_size: i32, // int error_msg_size,
  regexp: string, // const char *buf, size_t buf_len,
  re_flags: i32, // int re_flags,
  opaque: usize //void *opaque
): u32 {
  REParseState s = new REParseState(); // REParseState s_s, *s = &s_s;
  let stack_size: i32 = 0; // int stack_size;
  let is_sticky: boolean = false; // BOOL is_sticky;

  s.mem_opaque = opaque;
  s.regexp = regexp;
  s.regexp_pos = 0;
  s.re_flags = re_flags;
  s.is_utf16 = ((re_flags & LRE_FLAG_UTF16) != 0);
  is_sticky = ((re_flags & LRE_FLAG_STICKY) != 0);
  s.ignore_case = ((re_flags & LRE_FLAG_IGNORECASE) != 0);
  s.dotall = ((re_flags & LRE_FLAG_DOTALL) != 0);
  s.capture_count = 1;
  s.total_capture_count = -1;
  s.has_named_captures = -1;

  // dbuf_init2(&s->byte_code, opaque, lre_realloc);
  s.byte_code = new Array<u8>();
  s.opaque = opaque
  // dbuf_init2(&s->group_names, opaque, lre_realloc);
  s.byte_code = new Array<u8>();
  // opaque already set

  s.byte_code.push(re_flags); // dbuf_putc(&s->byte_code, re_flags); /* first element is the flags */
  s.byte_code.push(0); // dbuf_putc(&s->byte_code, 0); /* second element is the number of captures */
  s.byte_code.push(0); // dbuf_putc(&s->byte_code, 0); /* stack size */
  s.byte_code.push(0); // dbuf_put_u32(&s->byte_code, 0); /* bytecode length */

  if (!is_sticky) {
    /* iterate thru all positions (about the same as .*?( ... ) )
       .  We do it without an explicit loop so that lock step
       thread execution will be possible in an optimized
       implementation */

    re_emit_op_u32(s, REOPCodeEnum.REOP_split_goto_first, 1 + 5);
    re_emit_op(s, REOPCodeEnum.REOP_any);
    re_emit_op_u32(s, REOPCodeEnum.REOP_goto, -(5 + 1 + 5));
  }
  re_emit_op_u8(s, REOPCodeEnum.REOP_save_start, 0);

  if (re_parse_disjunction(s, FALSE)) {
    let errorMessage: string = 'TODO';
    throw new Error(errorMessage);
  }


}

class REParseState {
  byte_code: Array<u8>; // DynBuf byte_code
  // Using a string instead of a buffer for the regex
  // const uint8_t *buf_ptr;
  // const uint8_t *buf_end;
  // const uint8_t *buf_start;
  regexp: string;
  regexp_pos: usize;
  re_flags: i32; // int re_flags;
  is_utf16: boolean; // BOOL is_utf16;
  ignore_case: boolean; // BOOL ignore_case;
  dotall: boolean; // BOOL dotall;
  capture_count: i32; // int capture_count;
  total_capture_count: i32; // int total_capture_count; /* -1 = not computed yet */
  has_named_captures: i32; // int has_named_captures; /* -1 = don't know, 0 = no, 1 = yes */
  mem_opaque: u32; // void *mem_opaque;
  group_names: Array<u8>; // DynBuf group_names;
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

function pushUintOnREParseStateByteCode(s: REParseState, val: u32, uintNumBytes: i32) {
  // dbuf_put_u32(&s->byte_code, val);
  // TODO: CHeck for endianess of the u32
  // Going to assume little endian
  for (let i = 0; i < uintNumBytes; i++) {
    let byte = val & (0xFF << (8 * i));
    s.byte_code.push(byte);
  }
}

function pushU16OnREParseStateByteCode(s: REParseState, val: u32) {
  pushUintOnREParseStateByteCode(s, val, 2);
}


function pushU32OnREParseStateByteCode(s: REParseState, val: u32) {
  pushUintOnREParseStateByteCode(s, val, 4);
}

function re_emit_op(s: REParseState, op: u8) {
  s.byte_code.push(op); // dbuf_putc(&s->byte_code, op);
}

/* return the offset of the u32 value */
function re_emit_op_u32(s: REParseState, op: i32, val: u32): i32 {
  let pos: i32 = 0;
  s.byte_code.push(op); // dbuf_putc(&s->byte_code, op);
  pos = s.byte_code.length;
  pushU32OnREParseStateByteCode(s, val); // dbuf_put_u32(&s->byte_code, val);
  return pos;
}

function re_emit_goto(s: REParseState, op: u8, val: u32): i32 {
  let pos: i32 = 0;
  s.byte_code.push(op); // dbuf_putc(&s->byte_code, op);
  pos = s.byte_code.length;
  pushU32OnREParseStateByteCode(s, val - (pos + 4)); // dbuf_put_u32(&s->byte_code, val - (pos + 4));
  return pos;
}

function re_emit_op_u8(s: REParseState, op: u8, val: u8): void {
  s.byte_code.push(op); // dbuf_putc(&s->byte_code, op);
  s.byte_code.push(val); // dbuf_putc(&s->byte_code, val);
}

function re_emit_op_u16(s: REParseState, op: i32, val: u16): void {
  s.byte_code.push(op); // dbuf_putc(&s->byte_code, op);
  pushU16OnREParseStateByteCode(s, val); // dbuf_put_u16(&s->byte_code, val);
}

// Define the ENUM for all of our opcodes
// https://github.com/ldarren/QuickJS/blob/45d4a5805a280f1aadb3078f9f15036bf96fd1f0/libregexp.c#L51
// https://github.com/ldarren/QuickJS/blob/32b15bff82d917511d08c67488ef6eeb9370ee4a/libregexp-opcode.h
const enum REOPCodeEnum {
  REOP_invalid,
  REOP_char,
  REOP_char32,
  REOP_dot,
  REOP_any,
  REOP_line_start,
  REOP_line_end,
  REOP_goto,
  REOP_split_goto_first,
  REOP_split_next_first,
  REOP_match,
  REOP_save_start,
  REOP_save_end,
  REOP_save_rest,
  REOP_loop,
  REOP_push_i32,
  REOP_drop,
  REOP_word_boundary,
  REOP_not_word_boundary,
  REOP_back_reference,
  REOP_backward_back_reference,
  REOP_range,
  REOP_range32,
  REOP_lookahead,
  REOP_negative_lookahead,
  REOP_push_char_pos,
  REOP_bne_char_pos,
  REOP_prev,
  REOP_simple_greedy_quant
}

function re_parse_disjunction(s: REParseState, is_backward_dir: boolean): i32 {
  let start: i32 = 0;
  let len: i32 = 0;
  let pos: i32 = 0;

  start = s.byte_code.length;
  if (re_parse_alternative(s, is_backward_dir)) {
    return -1;
  }

  // TODO:

  return 0;
}

function re_parse_alternative(s: REParseState, is_backward_dir: boolean): i32 {
  let pos: usize = 0;
  let ret: i32 = 0;
  let start: usize = 0; 
  let term_start: usize = 0; 
  let end: usize = 0; 
  let term_size: usize = 0;

  start = s.byte_code.length; // start = s->byte_code.size;
  while(true) {
    pos = s.regexp_pos;
    if (pos >= s.regexp.length) {
      return;
    }

    if (s.charAt(pos) == '|' || s.charAt(pos) == ')') {
      break;
    }

    term_start = s.byte_code.length;
    ret = re_parse_term(s, is_backward_dir);

    // TODO:
  }
}

function re_parse_term(s: REParseState, is_backward_dir: boolean): i32 {
  let p: usize = 0; // uint8_t *p;

  // int c, last_atom_start, quant_min, quant_max, last_capture_count;
  // BOOL greedy, add_zero_advance_check, is_neg, is_backward_lookahead;
  // CharRange cr_s, *cr = &cr_s;
  let c = 0;
  let last_atom_start = 0;
  let quant_min = 0;
  let quant_max = 0;
  let last_capture_count = 0;
  let greedy: boolean = false;
  let add_zero_advance_check: boolean = false;
  let is_neg: boolean = false;
  let is_backward_lookahead: boolean = false;

  // TODO: CharRange type
  // https://github.com/ldarren/QuickJS/blob/32b15bff82d917511d08c67488ef6eeb9370ee4a/libunicode.h#L47
  let cr: CharRange = new CharRange();

}

