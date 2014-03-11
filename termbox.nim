when defined(macosx):
  const LIB_TERMBOX = "libtermbox.dylib"
elif defined(linux):
  const LIB_TERMBOX = "libtermbox.so"


const TB_KEY_F1*          = 0xFFFF-0
const TB_KEY_F2*          = 0xFFFF-1
const TB_KEY_F3*          = 0xFFFF-2
const TB_KEY_F4*          = 0xFFFF-3
const TB_KEY_F5*          = 0xFFFF-4
const TB_KEY_F6*          = 0xFFFF-5
const TB_KEY_F7*          = 0xFFFF-6
const TB_KEY_F8*          = 0xFFFF-7
const TB_KEY_F9*          = 0xFFFF-8
const TB_KEY_F10*         = 0xFFFF-9
const TB_KEY_F11*         = 0xFFFF-10
const TB_KEY_F12*         = 0xFFFF-11
const TB_KEY_INSERT*      = 0xFFFF-12
const TB_KEY_DELETE*      = 0xFFFF-13
const TB_KEY_HOME*        = 0xFFFF-14
const TB_KEY_END*         = 0xFFFF-15
const TB_KEY_PGUP*        = 0xFFFF-16
const TB_KEY_PGDN*        = 0xFFFF-17
const TB_KEY_ARROW_UP*    = 0xFFFF-18
const TB_KEY_ARROW_DOWN*  = 0xFFFF-19
const TB_KEY_ARROW_LEFT*  = 0xFFFF-20
const TB_KEY_ARROW_RIGHT* = 0xFFFF-21

const TB_KEY_CTRL_TILDE*             =     0x00 # 
const TB_KEY_CTRL_2*                 =     0x00 # 
const TB_KEY_CTRL_A*                 =     0x01 # 
const TB_KEY_CTRL_B*                 =     0x02 # 
const TB_KEY_CTRL_C*                 =     0x03 # 
const TB_KEY_CTRL_D*                 =     0x04 # 
const TB_KEY_CTRL_E*                 =     0x05 # 
const TB_KEY_CTRL_F*                 =     0x06 # 
const TB_KEY_CTRL_G*                 =     0x07 # 
const TB_KEY_BACKSPACE*              =     0x08 # 
const TB_KEY_CTRL_H*                 =     0x08 # clash with 'CTRL_B=ACKSPACE' # 
const TB_KEY_TAB*                    =     0x09 # 
const TB_KEY_CTRL_I*                 =     0x09 # clash w=ith 'TAB' # 
const TB_KEY_CTRL_J*                 =     0x0A # 
const TB_KEY_CTRL_K*                 =     0x0B # 
const TB_KEY_CTRL_L*                 =     0x0C # 
const TB_KEY_ENTER*                  =     0x0D # 
const TB_KEY_CTRL_M*                 =     0x0D # clash wit=h 'ENTER' # 
const TB_KEY_CTRL_N*                 =     0x0E # 
const TB_KEY_CTRL_O*                 =     0x0F # 
const TB_KEY_CTRL_P*                 =     0x10 # 
const TB_KEY_CTRL_Q*                 =     0x11 # 
const TB_KEY_CTRL_R*                 =     0x12 # 
const TB_KEY_CTRL_S*                 =     0x13 # 
const TB_KEY_CTRL_T*                 =     0x14 # 
const TB_KEY_CTRL_U*                 =     0x15 # 
const TB_KEY_CTRL_V*                 =     0x16 # 
const TB_KEY_CTRL_W*                 =     0x17 # 
const TB_KEY_CTRL_X*                 =     0x18 # 
const TB_KEY_CTRL_Y*                 =     0x19 # 
const TB_KEY_CTRL_Z*                 =     0x1A # 
const TB_KEY_ESC*                    =     0x1B # 
const TB_KEY_CTRL_LSQ_BRACKET*       =     0x1B # clash w=ith 'ESC' # 
const TB_KEY_CTRL_3*                 =     0x1B # clash w=ith 'ESC' # 
const TB_KEY_CTRL_4*                 =     0x1C # 
const TB_KEY_CTRL_BACKSLASH*         =     0x1C # clash with= 'CTRL_4' # 
const TB_KEY_CTRL_5*                 =     0x1D # 
const TB_KEY_CTRL_RSQ_BRACKET*       =     0x1D # // clash with= 'CTRL_5' # 
const TB_KEY_CTRL_6*                 =     0x1E # 
const TB_KEY_CTRL_7*                 =     0x1F # 
const TB_KEY_CTRL_SLASH*             =     0x1F # // clash with= 'CTRL_7' # 
const TB_KEY_CTRL_UNDERSCORE*        =     0x1F # // clash with= 'CTRL_7' # 
const TB_KEY_SPACE*                  =     0x20 # 
const TB_KEY_BACKSPACE2*             =     0x7F # 
const TB_KEY_CTRL_8*                 =     0x7F # // clash with= 'DELETE' # 

const TB_MOD_ALT*  =  0x01

const TB_DEFAULT* = 0x00
const TB_BLACK*   = 0x01
const TB_RED*     = 0x02
const TB_GREEN*   = 0x03
const TB_YELLOW*  = 0x04
const TB_BLUE*    = 0x05
const TB_MAGENTA* = 0x06
const TB_CYAN*    = 0x07
const TB_WHITE*   = 0x08

const TB_BOLD*       = 0x0100
const TB_UNDERLINE*  = 0x0200
const TB_REVERSE*    = 0x0400


type
  PCell* = ptr TCell
  TCell* {. final .} = object 
    ch*: uint32
    fg*: uint16
    bg*: uint16

type
  PEvent* = ptr TEvent
  TEvent* {. final .} = object 
    event_type*: uint8
    event_mod*: uint8
    key*: uint16
    ch*: uint32
    w*: uint32
    h*: uint32

const TB_EVENT_KEY*     =  1
const TB_EVENT_RESIZE*  =  2


const TB_EUNSUPPORTED_TERMINAL* = -1
const TB_EFAILED_TO_OPEN_TTY*   = -2
const TB_EPIPE_TRAP_ERROR*      = -3

proc init*() : int {. cdecl, importc: "tb_init", dynlib: LIB_TERMBOX .}
proc shutdown*() {. cdecl, importc: "tb_shutdown", dynlib: LIB_TERMBOX .}

proc width*() : int {. cdecl, importc: "tb_width", dynlib: LIB_TERMBOX .}
proc height*() : int {. cdecl, importc: "tb_height", dynlib: LIB_TERMBOX .}

proc clear*() {. cdecl, importc: "tb_clear", dynlib: LIB_TERMBOX .}
proc set_clear_attributes*(fg: uint16, bg: uint16) {. cdecl, 
                                importc: "tb_set_clear_attributes", dynlib: LIB_TERMBOX .}

proc present*() {. cdecl, importc: "tb_present", dynlib: LIB_TERMBOX .}

const TB_HIDE_CURSOR* = -1

proc set_cursor*(cx: int, cy: int) {. cdecl, importc: "tb_set_cursor", dynlib: LIB_TERMBOX .}

proc put_cell*(x: int, y: int, cell: PCell) {. cdecl, importc: "tb_put_cell", dynlib: LIB_TERMBOX .} # const struct tb_cell *cell)
proc change_cell*(x: int, y: int, ch: uint32, fg: uint16, bg: uint16) {. cdecl, 
                                importc: "tb_change_cell", dynlib: LIB_TERMBOX .}

proc blit*(x: int, y: int, w: int, h: int, cells: PCell) {. cdecl, 
                                importc: "tb_blit", dynlib: LIB_TERMBOX .} # const struct tb_cell *cells)


const TB_INPUT_CURRENT* = 0
const TB_INPUT_ESC*     = 1
const TB_INPUT_ALT*     = 2

proc select_input_mode*(mode: int) : int {. cdecl, importc: "tb_select_input_mode", dynlib: LIB_TERMBOX .}


const TB_OUTPUT_CURRENT*   = 0
const TB_OUTPUT_NORMAL*    = 1
const TB_OUTPUT_256*      = 2
const TB_OUTPUT_216*       = 3
const TB_OUTPUT_GRAYSCALE* = 4

proc select_output_mode*(mode:int) : int {. cdecl, importc: "tb_select_output_mode", dynlib: LIB_TERMBOX .}

proc peek_event*(event: PEvent, timeout: int) : int {. cdecl, 
                                importc: "tb_peek_event", dynlib: LIB_TERMBOX .}  #struct tb_event *event

proc poll_event*(event: PEvent) : int {. cdecl, 
                                importc: "tb_poll_event", dynlib: LIB_TERMBOX .} # struct tb_event *event



const TB_EOF* = -1

# proc utf8_char_length*(c: char) : int {. cdecl, importc: "tb_utf8_char_length", dynlib: LIB_TERMBOX .}
# proc utf8_char_to_unicode*(out: ptr uint32, c: ptr char) : int {. cdecl, importc: "tb_utf8_char_to_unicode", dynlib: LIB_TERMBOX .}
# proc utf8_unicode_to_char*(out: ptr char, c: uint32) : int {. cdecl, importc: "tb_utf8_unicode_to_char", dynlib: LIB_TERMBOX .}