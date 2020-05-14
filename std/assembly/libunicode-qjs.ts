export const LRE_CC_RES_LEN_MAX = 3;

/* conv_type:
   0 = to upper 
   1 = to lower
   2 = case folding (= to lower with modifications) 
 */
export function lre_case_conv(res: u32, c: u32, conv_type: i32): i32 {
  if (c < 128) {
    if (conv_type) {
      if (c >= 'A'.charCodeAt(0) && c <= 'Z'.charCodeAt(0)) {
        c = c - 'A'.charCodeAt(0) + 'a'.charCodeAt(0);
      }
    } else {
      if (c >= 'a'.charCodeAt(0) && c <= 'z'.charCodeAt(0)) {
        c = c - 'a'.charCodeAt(0) + 'A'.charCodeAt(0);
      }
    }
  } else {
    let v: u32 = 0;
    let code: u32 = 0;
    let data: u32 = 0;
    let type: u32 = 0;
    let len: u32 = 0;
    let a: u32 = 0;
    let is_lower: u32 = 0;

    let idx: i32 = 0;
    let idx_min: i32 = 0;
    let idx_max: i32 = 0;

    is_lower = (conv_type != 0);
    idx_min = 0;
    idx_max = countof(case_conv_table1) - 1;
    while (idx_min <= idx_max) {
      idx = (unsigned)(idx_max + idx_min) / 2;
      v = case_conv_table1[idx];
      code = v >> (32 - 17);
      len = (v >> (32 - 17 - 7)) & 0x7f;
      if (c < code) {
        idx_max = idx - 1;
      } else if (c >= code + len) {
        idx_min = idx + 1;
      } else {
        type = (v >> (32 - 17 - 7 - 4)) & 0xf;
        data = ((v & 0xf) << 8) | case_conv_table2[idx];
        switch(type) {
          case RUN_TYPE_U:
            case RUN_TYPE_L:
            case RUN_TYPE_UF:
            case RUN_TYPE_LF:
            if (conv_type == (type & 1) ||
                (type >= RUN_TYPE_UF && conv_type == 2)) {
            c = c - code + (case_conv_table1[data] >> (32 - 17));
          }
          break;
          case RUN_TYPE_UL:
            a = c - code;
          if ((a & 1) != (1 - is_lower))
            break;
          c = (a ^ 1) + code;
          break;
          case RUN_TYPE_LSU:
            a = c - code;
          if (a == 1) {
            c += 2 * is_lower - 1;
          } else if (a == (1 - is_lower) * 2) {
            c += (2 * is_lower - 1) * 2;
          }
          break;
          case RUN_TYPE_U2L_399_EXT2:
            if (!is_lower) {
            res[0] = c - code + case_conv_ext[data >> 6];
            res[1] = 0x399;
            return 2;
          } else {
            c = c - code + case_conv_ext[data & 0x3f];
          }
          break;
          case RUN_TYPE_UF_D20:
            if (conv_type == 1)
          break;
          c = data + (conv_type == 2) * 0x20;
          break;
          case RUN_TYPE_UF_D1_EXT:
            if (conv_type == 1)
          break;
          c = case_conv_ext[data] + (conv_type == 2);
          break;
          case RUN_TYPE_U_EXT:
            case RUN_TYPE_LF_EXT:
            if (is_lower != (type - RUN_TYPE_U_EXT))
          break;
          c = case_conv_ext[data];
          break;
          case RUN_TYPE_U_EXT2:
            case RUN_TYPE_L_EXT2:
            if (conv_type != (type - RUN_TYPE_U_EXT2))
          break;
          res[0] = c - code + case_conv_ext[data >> 6];
          res[1] = case_conv_ext[data & 0x3f];
          return 2;
          default:
            case RUN_TYPE_U_EXT3:
            if (conv_type != 0)
          break;
          res[0] = case_conv_ext[data >> 8];
          res[1] = case_conv_ext[(data >> 4) & 0xf];
          res[2] = case_conv_ext[data & 0xf];
          return 3;
        }
        break;
      }
    }
  }
  res[0] = c;
  return 1;
}

export const case_conv_table1: Array<u32> = [
    0x00209a30, 0x00309a00, 0x005a8173, 0x00601730,
    0x006c0730, 0x006f81b3, 0x00701700, 0x007c0700,
    0x007f8100, 0x00803040, 0x009801c3, 0x00988190,
    0x00990640, 0x009c9040, 0x00a481b4, 0x00a52e40,
    0x00bc0130, 0x00bc8640, 0x00bf8170, 0x00c00100,
    0x00c08130, 0x00c10440, 0x00c30130, 0x00c38240,
    0x00c48230, 0x00c58240, 0x00c70130, 0x00c78130,
    0x00c80130, 0x00c88240, 0x00c98130, 0x00ca0130,
    0x00ca8100, 0x00cb0130, 0x00cb8130, 0x00cc0240,
    0x00cd0100, 0x00ce0130, 0x00ce8130, 0x00cf0100,
    0x00cf8130, 0x00d00640, 0x00d30130, 0x00d38240,
    0x00d48130, 0x00d60240, 0x00d70130, 0x00d78240,
    0x00d88230, 0x00d98440, 0x00db8130, 0x00dc0240,
    0x00de0240, 0x00df8100, 0x00e20350, 0x00e38350,
    0x00e50350, 0x00e69040, 0x00ee8100, 0x00ef1240,
    0x00f801b4, 0x00f88350, 0x00fa0240, 0x00fb0130,
    0x00fb8130, 0x00fc2840, 0x01100130, 0x01111240,
    0x011d0131, 0x011d8240, 0x011e8130, 0x011f0131,
    0x011f8201, 0x01208240, 0x01218130, 0x01220130,
    0x01228130, 0x01230a40, 0x01280101, 0x01288101,
    0x01290101, 0x01298100, 0x012a0100, 0x012b0200,
    0x012c8100, 0x012d8100, 0x012e0101, 0x01300100,
    0x01308101, 0x01318100, 0x01328101, 0x01330101,
    0x01340100, 0x01348100, 0x01350101, 0x01358101,
    0x01360101, 0x01378100, 0x01388101, 0x01390100,
    0x013a8100, 0x013e8101, 0x01400100, 0x01410101,
    0x01418100, 0x01438101, 0x01440100, 0x01448100,
    0x01450200, 0x01460100, 0x01490100, 0x014e8101,
    0x014f0101, 0x01a28173, 0x01b80440, 0x01bb0240,
    0x01bd8300, 0x01bf8130, 0x01c30130, 0x01c40330,
    0x01c60130, 0x01c70230, 0x01c801d0, 0x01c89130,
    0x01d18930, 0x01d60100, 0x01d68300, 0x01d801d3,
    0x01d89100, 0x01e10173, 0x01e18900, 0x01e60100,
    0x01e68200, 0x01e78130, 0x01e80173, 0x01e88173,
    0x01ea8173, 0x01eb0173, 0x01eb8100, 0x01ec1840,
    0x01f80173, 0x01f88173, 0x01f90100, 0x01f98100,
    0x01fa01a0, 0x01fa8173, 0x01fb8240, 0x01fc8130,
    0x01fd0240, 0x01fe8330, 0x02001030, 0x02082030,
    0x02182000, 0x02281000, 0x02302240, 0x02453640,
    0x02600130, 0x02608e40, 0x02678100, 0x02686040,
    0x0298a630, 0x02b0a600, 0x02c381b5, 0x08502631,
    0x08638131, 0x08668131, 0x08682b00, 0x087e8300,
    0x09d05011, 0x09f80610, 0x09fc0620, 0x0e400174,
    0x0e408174, 0x0e410174, 0x0e418174, 0x0e420174,
    0x0e428174, 0x0e430174, 0x0e438180, 0x0e440180,
    0x0e482b30, 0x0e5e8330, 0x0ebc8101, 0x0ebe8101,
    0x0ec70101, 0x0f007e40, 0x0f3f1840, 0x0f4b01b5,
    0x0f4b81b6, 0x0f4c01b6, 0x0f4c81b6, 0x0f4d01b7,
    0x0f4d8180, 0x0f4f0130, 0x0f506040, 0x0f800800,
    0x0f840830, 0x0f880600, 0x0f8c0630, 0x0f900800,
    0x0f940830, 0x0f980800, 0x0f9c0830, 0x0fa00600,
    0x0fa40630, 0x0fa801b0, 0x0fa88100, 0x0fa901d3,
    0x0fa98100, 0x0faa01d3, 0x0faa8100, 0x0fab01d3,
    0x0fab8100, 0x0fac8130, 0x0fad8130, 0x0fae8130,
    0x0faf8130, 0x0fb00800, 0x0fb40830, 0x0fb80200,
    0x0fb90400, 0x0fbb0200, 0x0fbc0201, 0x0fbd0201,
    0x0fbe0201, 0x0fc008b7, 0x0fc40867, 0x0fc808b8,
    0x0fcc0868, 0x0fd008b8, 0x0fd40868, 0x0fd80200,
    0x0fd901b9, 0x0fd981b1, 0x0fda01b9, 0x0fdb01b1,
    0x0fdb81d7, 0x0fdc0230, 0x0fdd0230, 0x0fde0161,
    0x0fdf0173, 0x0fe101b9, 0x0fe181b2, 0x0fe201ba,
    0x0fe301b2, 0x0fe381d8, 0x0fe40430, 0x0fe60162,
    0x0fe80200, 0x0fe901d0, 0x0fe981d0, 0x0feb01b0,
    0x0feb81d0, 0x0fec0230, 0x0fed0230, 0x0ff00201,
    0x0ff101d3, 0x0ff181d3, 0x0ff201ba, 0x0ff28101,
    0x0ff301b0, 0x0ff381d3, 0x0ff40230, 0x0ff50230,
    0x0ff60131, 0x0ff901ba, 0x0ff981b2, 0x0ffa01bb,
    0x0ffb01b2, 0x0ffb81d9, 0x0ffc0230, 0x0ffd0230,
    0x0ffe0162, 0x109301a0, 0x109501a0, 0x109581a0,
    0x10990131, 0x10a70101, 0x10b01031, 0x10b81001,
    0x10c18240, 0x125b1a31, 0x12681a01, 0x16002f31,
    0x16182f01, 0x16300240, 0x16310130, 0x16318130,
    0x16320130, 0x16328100, 0x16330100, 0x16338640,
    0x16368130, 0x16370130, 0x16378130, 0x16380130,
    0x16390240, 0x163a8240, 0x163f0230, 0x16406440,
    0x16758440, 0x16790240, 0x16802600, 0x16938100,
    0x16968100, 0x53202e40, 0x53401c40, 0x53910e40,
    0x53993e40, 0x53bc8440, 0x53be8130, 0x53bf0a40,
    0x53c58240, 0x53c68130, 0x53c80440, 0x53ca0101,
    0x53cb1440, 0x53d50130, 0x53d58130, 0x53d60130,
    0x53d68130, 0x53d70130, 0x53d80130, 0x53d88130,
    0x53d90130, 0x53d98131, 0x53da0c40, 0x53e10240,
    0x53e20131, 0x53e28130, 0x53e30130, 0x53e38440,
    0x53fa8240, 0x55a98101, 0x55b85020, 0x7d8001b2,
    0x7d8081b2, 0x7d8101b2, 0x7d8181da, 0x7d8201da,
    0x7d8281b3, 0x7d8301b3, 0x7d8981bb, 0x7d8a01bb,
    0x7d8a81bb, 0x7d8b01bc, 0x7d8b81bb, 0x7f909a31,
    0x7fa09a01, 0x82002831, 0x82142801, 0x82582431,
    0x826c2401, 0x86403331, 0x86603301, 0x8c502031,
    0x8c602001, 0xb7202031, 0xb7302001, 0xf4802231,
    0xf4912201,
];
