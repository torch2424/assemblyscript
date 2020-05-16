import {
  LRE_CC_RES_LEN_MAX,
  lre_case_conv,
  case_conv_table1
} from "./libunicode-qjs";


enum REOPCodeEnum {
  // #define DEF(id, size) REOP_ ## id,
  // #include "libregexp-opcode.h"
  // #undef DEF
  REOP_COUNT,
}

const CAPTURE_COUNT_MAX = 255;
const STACK_SIZE_MAX = 255;

/* unicode code points */
const CP_LS = 0x2028;
const CP_PS = 0x2029;

const TMP_BUF_SIZE = 128;

type DynBuf = Array<u8>;

class REParseState {
  byte_code: DynBuf;
  buf_ptr: u32; // const uint8_t *buf_ptr;
  buf_end: u32; // const uint8_t *buf_end;
  buf_start: u32; // const uint8_t *buf_start;
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
}

function is_digit(charCode: i32): boolean {
  return charCode >= "0".charCodeAt(0) && charCode <= "9".charCodeAt(0); 
}

// dbuf_insert : Seems to just resize a buffer

function lre_canonicalize(c: u32, isUtf16: boolean): u32 {
  let res = new Array<u32>(LRE_CC_RES_LEN_MAX);
  let len = 0;

  if (isUtf16) {
    if (c < 128) {
      if (c >= "A".charCodeAt(0) && c <= "Z".charCodeAt(0)) {
        c = c - "A".charCodeAt(0) + "a".charCodeAt(0);
      }
    } else {
      lre_case_conv(res, c, 2);
      c = res[0];
    }
  } else {
    if (c < 128) {
      if (c >= 'a'.charCodeAt(0) && c <= 'z'.charCodeAt(0)) {
        c = c - 'a'.charCodeAt(0) + 'A'.charCodeAt(0);
      }
    } else {
      /* legacy regexp: to upper case if single char >= 128 */
      len = lre_case_conv(res, c, FALSE);
      if (len == 1 && res[0] >= 128)
        c = res[0];
    }
  }
  return c;
}

const char_range_d: Array<u16> = [
  1,
  0x0030, 
  0x0039 + 1
];

/* code point ranges for Zs,Zl or Zp property */
const uint16_t char_range_s: Array<u16> = [
  10,
  0x0009, 0x000D + 1,
  0x0020, 0x0020 + 1,
  0x00A0, 0x00A0 + 1,
  0x1680, 0x1680 + 1,
  0x2000, 0x200A + 1,
  /* 2028;LINE SEPARATOR;Zl;0;WS;;;;;N;;;;; */
  /* 2029;PARAGRAPH SEPARATOR;Zp;0;B;;;;;N;;;;; */
  0x2028, 0x2029 + 1,
  0x202F, 0x202F + 1,
  0x205F, 0x205F + 1,
  0x3000, 0x3000 + 1,
  /* FEFF;ZERO WIDTH NO-BREAK SPACE;Cf;0;BN;;;;;N;BYTE ORDER MARK;;;; */
  0xFEFF, 0xFEFF + 1,
];

function lre_is_space(c: i32): boolean {
  let i: i32 = 0;
  let n: i32 = 0;
  let low: i32 = 0;
  let high: i32 = 0;

  n = (char_range_s.length - 1) / 2;
  for (i = 0; i < n; i++) {
    low = char_range_s[2 * i + 1];
    if (c < low) {
      return false;
    }
    high = char_range_s[2 * i + 2];
    if (c < high) {
      return true;
    }
  }
  return false;
}

const lre_id_start_table_ascii: Array<u32> = [
  /* $ A-Z _ a-z */
  0x00000000, 0x00000010, 0x87FFFFFE, 0x07FFFFFE
];

const lre_id_continue_table_ascii: Array<u32> = [
  /* $ 0-9 A-Z _ a-z */
  0x00000000, 0x03FF0010, 0x87FFFFFE, 0x07FFFFFE
];


const char_range_w: Array<u16> = [
  4,
  0x0030, 0x0039 + 1,
  0x0041, 0x005A + 1,
  0x005F, 0x005F + 1,
  0x0061, 0x007A + 1,
];

const CLASS_RANGE_BASE = 0x40000000

enum CharRangeEnum {
  CHAR_RANGE_d,
  CHAR_RANGE_D,
  CHAR_RANGE_s,
  CHAR_RANGE_S,
  CHAR_RANGE_w,
  CHAR_RANGE_W,
};

const char_range_table: Array<Array<u16>> = [
  char_range_d,
  char_range_s,
  char_range_w
];

// TODO: CLean up this function, was working on the REParseState
function cr_init_char_range(REParseState *s, CharRange *cr, uint32_t c): i32 {
  boolean invert;
  const uint16_t *c_pt;
  int len, i;

  invert = c & 1;
  c_pt = char_range_table[c >> 1];
  len = *c_pt++;
  cr_init(cr, s->mem_opaque, lre_realloc);
  for(i = 0; i < len * 2; i++) {
    if (cr_add_point(cr, c_pt[i]))
      goto fail;
  }
  if (invert) {
    if (cr_invert(cr))
      goto fail;
  }
  return 0;
  fail:
    cr_free(cr);
  return -1;
}

export class RegExp {

  // @binding(CALL_NEW, [ STRING, STRING], OBJECT_HANDLE)
  constructor(pattern: string, flags: string = "") { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [ STRING ], PASS_THRU)
  test(search: string): bool { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [], STRING)
  toString(): string { throw new Error("unreachable"); }

}
