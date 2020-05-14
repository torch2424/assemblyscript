import {
  LRE_CC_RES_LEN_MAX,
  lre_case_conv,
  case_conv_table1
} from "./libunicode-qjs";

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


const uint16_t char_range_w: Array<u32> = [
  4,
  0x0030, 0x0039 + 1,
  0x0041, 0x005A + 1,
  0x005F, 0x005F + 1,
  0x0061, 0x007A + 1,
];

// TODO: #define CLASS_RANGE_BASE 0x40000000
// That line and onward

export class RegExp {

  // @binding(CALL_NEW, [ STRING, STRING], OBJECT_HANDLE)
  constructor(pattern: string, flags: string = "") { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [ STRING ], PASS_THRU)
  test(search: string): bool { throw new Error("unreachable"); }

  // @binding(CALL_THIS, [], STRING)
  toString(): string { throw new Error("unreachable"); }

}
