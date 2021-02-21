
INCLUDE Irvine32.inc
Str_remove PROTO,pStart:PTR BYTE,nChars:DWORD

main  EQU start@0 ;
TIRED PROTO,
  inspeed:DWORD,
  exhaust:PTR BYTE
EXCITED PROTO,
  plusspeed:DWORD,
  happy:PTR BYTE
FFALL PROTO,
  STOPspeed:DWORD,
  SAD:PTR BYTE
  
BoxWidth = 9
BoxHeight = 9
trackWidth =100
finishWidth=20
temp = 30
.data
titleStr BYTE "Horse gambling",0
infotitle BYTE "information",0
infomsg BYTE "call the information box again,please enter 1"
   BYTE 0dh,0ah,"gamble,please enter 2"
   BYTE 0dh,0ah,"choose horse,please enter 3"
   BYTE 0dh,0ah,"start the game,please enter 4"
   BYTE 0dh,0ah,"check the achievement,please enter 5",0

achievementtitle BYTE "achievement",0
achievementmsg BYTE "first blood: first win"
        BYTE 0dh,0ah,"horse god: accumulative 3 win"
        BYTE 0dh,0ah,"holly shit: continuous 2 win"
        BYTE 0dh,0ah,"Loser: first lose"
        BYTE 0dh,0ah,"you should kill yourself: accumulative 3 lose"
        BYTE 0dh,0ah,"trash: continuous 2 lose"
        BYTE 0dh,0ah,"Korea fish: earn 100 dollar in a game"
        BYTE 0dh,0ah,"all in: bet all you money"
        BYTE 0dh,0ah,"beggar: money less than 0",0

achievement BYTE "Achievement!!!",0
achievement1 BYTE "first blood",0
achievement2 BYTE "horse god",0
achievement3 BYTE "holly shit",0
achievement4 BYTE "Loser",0
achievement5 BYTE "you should kill yourself",0
achievement6 BYTE "trash",0
achievement7 BYTE "Korea fish",0
achievement8 BYTE "all in",0
achievement9 BYTE "beggar",0


options BYTE "enter your option:",0
gamble BYTE "the money you want to gamble:",0
choosehorse BYTE "the horse you want to choose:",0
horseyouchoose BYTE "horse you choose:",0
yourmoney BYTE "yourmoney:",0
yourgamble BYTE "your gamble:",0

horse1win BYTE "horse1 win!!! ",0
horse2win BYTE "horse2 win!!! ",0
horse3win BYTE "horse3 win!!! ",0
clear BYTE 40 DUP(' '),0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
track BYTE trackWidth DUP('-')
finish  BYTE '|          |'
    BYTE '|   ___    |'
    BYTE '|  |       |'
    BYTE '|  |---    |'
    BYTE '|  |___    |'
    BYTE '|          |'
    BYTE '|          |'
    BYTE '|  |\  |   |'
    BYTE '|  | \ |   |'
    BYTE '|  |  \|   |'
    BYTE '|          |'
    BYTE '|   __     |'
    BYTE '|  |   \   |'
    BYTE '|  |    \  |'
    BYTE '|  |    /  |'
    BYTE '|  |__ /   |'
    BYTE '|          |'
    BYTE '|          |'
    BYTE '|          |',0
G   BYTE'   ____   '
  BYTE'  /       '
  BYTE' |   ___  '
  BYTE' |      | '
  BYTE'  \____/  '
  BYTE'          ',0

A   BYTE'    __    '
  BYTE'   /  \   '
  BYTE'  /    \  '
  BYTE' |______| '
  BYTE' |      | '
  BYTE' |      | ',0

M   BYTE'  _    _  '
  BYTE' | \  / | '
  BYTE' |  \/  | '
  BYTE' |      | '
  BYTE' |      | '
  BYTE'          ',0

E   BYTE'   _____  '
  BYTE'  |       '
  BYTE'  |       '
  BYTE'  |-----  '
  BYTE'  |       '
  BYTE'  |_____  ',0

O   BYTE'   ___    '
  BYTE'  /   \   '
  BYTE' |     |  '
  BYTE' |     |  '
  BYTE' |     |  '
  BYTE'  \___/   ',0

V   BYTE'          '
  BYTE' |       |'
  BYTE' |       |'
  BYTE'  \     / '
  BYTE'   \   /  '
  BYTE'    \_/   ',0

E2  BYTE'   _____  '
  BYTE'  |       '
  BYTE'  |       '
  BYTE'  |-----  '
  BYTE'  |       '
  BYTE'  |_____  ',0

R   BYTE'   ____   '
  BYTE'  |    \  '
  BYTE'  |____/  '
  BYTE'  |____   '
  BYTE'  |    |  '
  BYTE'  |    |  ',0

S BYTE'    ___   '
  BYTE'   /   \  '
  BYTE'   \___   '
  BYTE'       \  '
  BYTE'   \___/  '
  BYTE'          '
  BYTE'          ',0

T BYTE'  _______ '
  BYTE'     |    '
  BYTE'     |    '
  BYTE'     |    '
  BYTE'     |    '
  BYTE'     |    '
  BYTE'          ',0

fireout BYTE '           *           '
     BYTE '     *     *     *     '      
     BYTE ' *    *    *    *    * '       
     BYTE '   *   *   *   *   *   '       
     BYTE '     *  *  *  *  *     '     
     BYTE '       * * * * *       '       
     BYTE '* * * * * * * * * * * *'             
     BYTE '       * * * * *       '      
     BYTE '     *  *  *  *  *     '       
     BYTE '   *   *   *   *   *   '      
     BYTE ' *    *    *    *    * '      
     BYTE '     *     *     *     '    
     BYTE '           *           ',0
firemid BYTE '   *   *   *   '       
     BYTE ' *  *  *  *  * '     
     BYTE '   * * * * *   '       
     BYTE '* * * * * * * *'             
     BYTE '   * * * * *   '      
     BYTE ' *  *  *  *  * '       
     BYTE '   *   *   *   ',0

firein BYTE '   *   '     
     BYTE ' * * * '       
     BYTE '* * * *'             
     BYTE ' * * * '      
     BYTE '   *   ',0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fireblank BYTE ' ',0
fireblank1 BYTE 7 DUP(' '),0
fireblank2 BYTE 15 DUP(' '),0
fireblank3 BYTE 23 DUP(' '),0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
firework BYTE "*",0                ;煙火上升
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
boxTop    BYTE ' ',' ','#','#','>' ;show mark 馬1
boxBody   BYTE '#','#','#','#'
boxBottom BYTE '/','\','/','\'
boxBottom2 BYTE '/','/','/','/'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
box2Top    BYTE ' ',' ','#','#','>' ;show mark 馬2
box2Body   BYTE '#','#','#','#'
box2Bottom BYTE '/','\','/','\'
box2Bottom2 BYTE '/','/','/','/'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
box3Top    BYTE ' ',' ','#','#','>' ;show mark 馬3
box3Body   BYTE '#','#','#','#'
box3Bottom BYTE '/','\','/','\'
box3Bottom2 BYTE '/','/','/','/'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
blankTop    BYTE ' ',' ',' ',' ',' ' ;show mark
blankBody   BYTE ' ',' ',' ',' '
blankBottom BYTE ' ',' ',' ',' '
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
outputHandle DWORD 0
count DWORD 0
starttime DWORD ?
showtime DWORD ?

startxyPosition COORD <35,16> ;馬1起始位置
startxyPosition2 COORD <50,16> ;馬2起始位置
startxyPosition3 COORD <65,16> ;馬3起始位置

xyPosition COORD <10,5> ;馬1起始位置
xyPosition2 COORD <10,12> ;馬2起始位置
xyPosition3 COORD <10,17> ;馬3起始位置
xyPositionF COORD <105,3> ;終點線位置

xyPositionG COORD <15,3>
xyPositionA COORD <30,3>
xyPositionM COORD <55,3>
xyPositionE COORD <70,3>
xyPositionO COORD <15,13>
xyPositionV COORD <30,13>
xyPositionE2 COORD <55,13>
xyPositionR COORD <70,13>

xyPositionS COORD<20,7>
xyPositionT COORD<35,7>
xyPositionA2 COORD<50,7>
xyPositionR2 COORD<65,7>
xyPositionT2 COORD<80,7>


xyPositionfire COORD <40,25> ;煙火起始位置
xyPositionfirein COORD <37,8>
xyPositionfiremid COORD <33,7>
xyPositionfireout COORD <29,4>
xyPositionfire2 COORD <20,25>
xyPositionfire2in COORD <17,8>
xyPositionfire2mid COORD <13,7>
xyPositionfire2out COORD <9,4>
xyPositionfire3 COORD <80,25>
xyPositionfire3in COORD <77,8>
xyPositionfire3mid COORD <73,7>
xyPositionfire3out COORD <69,4>
xyPositionfire4 COORD <100,25>
xyPositionfire4in COORD <97,8>
xyPositionfire4mid COORD <93,7>
xyPositionfire4out COORD <89,4>

xyPositionfireblank COORD <40,25> ;煙火消失起始位置
xyPositionfireblankin COORD <37,8>
xyPositionfireblankmid COORD <33,7>
xyPositionfireblankout COORD <29,4>
xyPositionfireblank2 COORD <20,25>
xyPositionfireblank2in COORD <17,8>
xyPositionfireblank2mid COORD <13,7>
xyPositionfireblank2out COORD <9,4>
xyPositionfireblank3 COORD <80,25>
xyPositionfireblank3in COORD <77,8>
xyPositionfireblank3mid COORD <73,7>
xyPositionfireblank3out COORD <69,4>
xyPositionfireblank4 COORD <100,25>
xyPositionfireblank4in COORD <97,8>
xyPositionfireblank4mid COORD <93,7>
xyPositionfireblank4out COORD <89,4>

trackPosition COORD <5,3>
init DWORD 2
run SBYTE -20
run2 SBYTE -20
run3 SBYTE -20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;判斷成就系統的變數
bwin SBYTE 0
bwin3 SBYTE 0
blose SBYTE 0
blose3 SBYTE 0
bcwin SBYTE 0
bclose SBYTE 0
allin SBYTE 0 
bnomoney SBYTE 0
bkorea SBYTE 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 
cellsWritten DWORD ?

attributeend WORD 10 DUP(0Ch)
attributestart WORD 10 DUP(0Fh)

attributesfire WORD 23 DUP(0Ah)
attributesfire2 WORD 23 DUP(0Eh)
attributesfire3 WORD 23 DUP(0Ch)
attributesfire4 WORD 23 DUP(09h)

attributes0 WORD BoxWidth DUP(0Ah)    ;color
attributes1 WORD BoxWidth DUP(0Ah)
attributes2 WORD BoxWidth DUP(0Ah)

attributes20 WORD BoxWidth DUP(0Eh)   ;color2
attributes21 WORD BoxWidth DUP(0Eh)
attributes22 WORD BoxWidth DUP(0Eh)

attributes30 WORD BoxWidth DUP(0Ch)   ;color3
attributes31 WORD BoxWidth DUP(0Ch)
attributes32 WORD BoxWidth DUP(0Ch)

optionnumber SDWORD ? ;選擇的數字
money SDWORD ? ;擁有的錢
gamblemoney SDWORD ? ;下注的錢
horse SDWORD ?;選擇的馬

win SDWORD ? ;勝場數
cwin SDWORD ? ;連勝場數
lose SDWORD ? ;敗場數
close SDWORD ? ;連敗場數

pause Dword 5000
duration Dword ? ;馬1移動速度
duration2 Dword ? ;馬2移動速度
duration3 Dword ? ;馬3移動速度
durationchange Dword 1500 ;事件觸發間隔 -
durationchangefast Dword 2000 ;事件觸發間隔 +
durationTmp1 Dword ?
durationTmp2 Dword ?
durationTmp3 Dword ? 
speed Dword 380,360,330 ;馬的可能速度
durationf Dword 300 ;煙火速度
durationfb Dword 2000;煙火消失時間
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
H1TIRED   BYTE   "HORSE 1 IS TIRED",0
H2TIRED   BYTE   "HORSE 2 IS TIRED",0
H3TIRED   BYTE   "HORSE 3 IS TIRED",0

H1EXCITED   BYTE   "HORSE 1 IS EXCITED",0
H2EXCITED   BYTE   "HORSE 2 IS EXCITED",0
H3EXCITED   BYTE   "HORSE 3 IS EXCITED",0

H1FALL   BYTE   "HORSE 1 IS DEAD",0
H2FALL   BYTE   "HORSE 2 IS DEAD",0
H3FALL   BYTE   "HORSE 3 IS DEAD",0

FLAGOFFALL BYTE 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.code
main PROC
mov money,100 ;初始基金
mov gamblemoney,0 ;初始下注金額
mov win,0
mov cwin,0
mov lose,0
mov close,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INVOKE GetStdHandle,STD_OUTPUT_HANDLE ; Get the console ouput handle
    mov outputHandle, eax ; save console handle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;初始畫面
  mov esi,offset S
  mov ecx,6
  
  startS:
    push ecx                      ;;S
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributestart,
      10,
      xyPositionS,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionS,
      ADDR count
  inc xyPositionS.Y
  add esi,10
  pop ecx
  Loop startS


  mov esi,offset T
  mov ecx,6
  
  startT:
    push ecx                      ;;T
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributestart,
      10,
      xyPositionT,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionT,
      ADDR count
  inc xyPositionT.Y
  add esi,10
  pop ecx
  Loop startT

  mov esi,offset A
  mov ecx,6
  
  startA:
    push ecx                      ;;A
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributestart,
      10,
      xyPositionA2,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionA2,
      ADDR count
  inc xyPositionA2.Y
  add esi,10
  pop ecx
  Loop startA

  mov esi,offset R
  mov ecx,6
  
  startR:
    push ecx                      ;;R
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributestart,
      10,
      xyPositionR2,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionR2,
      ADDR count
  inc xyPositionR2.Y
  add esi,10
  pop ecx
  Loop startR

  mov esi,offset T
  mov ecx,6
  
  startT2:
    push ecx                      ;;T
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributestart,
      10,
      xyPositionT2,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionT2,
      ADDR count
  inc xyPositionT2.Y
  add esi,10
  pop ecx
  Loop startT2
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;開始裝飾馬
  INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes0,
      5,
      startxyPosition,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxTop,   ; pointer to the top box line
       5,       ; size of box line
       startxyPosition,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR startxyPosition.Y   ; 座標換到下一行位置
 
    ;mov ecx, 1    ; number of lines in body
 
   
 
   ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes1,
      4,
      startxyPosition,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxBody,  ; pointer to the body box line
       4,       ; size of box line
       startxyPosition,    ; coordinates of first char
       ADDR count ; output count

       inc COORD PTR startxyPosition.Y   ; 座標換到下一行位置


 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes20,
      5,
      startxyPosition2,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Top,   ; pointer to the top box line
       5,       ; size of box line
       startxyPosition2,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR startxyPosition2.Y   ; 座標換到下一行位置
 
    ;mov ecx, 1    ; number of lines in body
 
   
 
   ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes21,
      4,
      startxyPosition2,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Body,  ; pointer to the body box line
       4,       ; size of box line
       startxyPosition2,    ; coordinates of first char
       ADDR count ; output count

      inc COORD PTR startxyPosition2.Y   ; 座標換到下一行位置


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes30,
      5,
      startxyPosition3,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Top,   ; pointer to the top box line
       5,       ; size of box line
       startxyPosition3,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR startxyPosition3.Y   ; 座標換到下一行位置
 
    ;mov ecx, 1    ; number of lines in body
 
   
 
   ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes31,
      4,
      startxyPosition3,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Body,  ; pointer to the body box line
       4,       ; size of box line
       startxyPosition3,    ; coordinates of first char
       ADDR count ; output count
  
       inc COORD PTR startxyPosition3.Y   ; 座標換到下一行位置



  horserun: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;抖腳
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes1,
      4,
      startxyPosition,
      ADDR cellsWritten
  ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxBottom,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition,    ; coordinates of first char
       ADDR count ; output count


        INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes21,
      4,
      startxyPosition2,
      ADDR cellsWritten
 
       ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Bottom,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition2,    ; coordinates of first char
       ADDR count ; output count


       INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes31,
      4,
      startxyPosition3,
      ADDR cellsWritten
 
       ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Bottom,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition3,    ; coordinates of first char
       ADDR count ; output count





  INVOKE Sleep,200
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes1,
      4,
      startxyPosition,
      ADDR cellsWritten
  ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxBottom2,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition,    ; coordinates of first char
       ADDR count ; output count


        INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes21,
      4,
      startxyPosition2,
      ADDR cellsWritten
 
       ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Bottom2,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition2,    ; coordinates of first char
       ADDR count ; output count


       INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes31,
      4,
      startxyPosition3,
      ADDR cellsWritten
 
       ; draw bottom of the box
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Bottom2,; pointer to the bottom box line
       4,       ; size of box line
       startxyPosition3,    ; coordinates of first char
       ADDR count ; output count
  INVOKE Sleep,200
  call ReadKey
  jz horserun

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L0:

    call Clrscr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INVOKE SetConsoleTitle, ADDR titleStr
INVOKE MessageBox, NULL, ADDR infomsg,
        ADDR infotitle,
        MB_OK 
mov ebx,20000
INVOKE GetTickCount
mov starttime,eax
mov esi,offset finish
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;隨機取馬的速度
  call randomize
  mov eax,3 
  call RandomRange
  shl eax,2
  mov ebx,[speed+eax]
  mov duration,ebx
  mov durationTmp1,ebx

  mov eax,3 
  call RandomRange
  shl eax,2
  mov ebx,[speed+eax]
  mov duration2,ebx
  mov durationTmp2,ebx
  
  mov eax,3 
  call RandomRange
  shl eax,2
  mov ebx,[speed+eax]
  mov duration3,ebx
  mov durationTmp3,ebx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;生成終點線
mov ecx,19
L98:
  push ecx
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       esi,   ; pointer to the top box line
       12,      ; size of box line
       xyPositionF,     ; coordinates of first char
       ADDR count ; output count
    inc xyPositionF.Y
    add esi,12
    pop ecx
Loop L98

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;生成跑道
INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET track,   ; pointer to the top box line
       trackWidth,      ; size of box line
       trackPosition,     ; coordinates of first char
       ADDR count ; output count
add trackPosition.Y,5
INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET track,   ; pointer to the top box line
       trackWidth,      ; size of box line
       trackPosition,     ; coordinates of first char
       ADDR count ; output count
add trackPosition.Y,5
INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET track,   ; pointer to the top box line
       trackWidth,      ; size of box line
       trackPosition,     ; coordinates of first char
       ADDR count ; output count
add trackPosition.Y,5
INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET track,   ; pointer to the top box line
       trackWidth,      ; size of box line
       trackPosition,     ; coordinates of first char
       ADDR count ; output count
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬1跑動
L3:

    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes0,
      5,
      xyPosition,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxTop,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition.Y   ; 座標換到下一行位置
 
    ;mov ecx, 1    ; number of lines in body
 
   
 
L1: ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes1,
      4,
      xyPosition,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxBody,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition.Y    ; next line
 
L2:   INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes2,
      4,
      xyPosition,
      ADDR cellsWritten
 
       ; draw bottom of the box
  cmp run,20
  jl L7
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET boxBottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
  jmp L6
L7: 
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,     ; console output handle
       OFFSET boxBottom2,; pointer to the bottom box line
       4,        ; size of box line
       xyPosition,     ; coordinates of first char
       ADDR count  ; output count
   ; jmp L6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬2跑動
add xyPosition2.Y,-2
L23:

      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes20,
      5,
      xyPosition2,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Top,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition2.Y   ; 座標換到下一行位置
 
 
   
 
L21: ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes21,
      4,
      xyPosition2,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Body,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition2.Y    ; next line
 
L22:   INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes22,
      4,
      xyPosition2,
      ADDR cellsWritten
 
       ; draw bottom of the box
  cmp run2,20
  jl L27
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box2Bottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
  jmp L6
L27:  
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,     ; console output handle
       OFFSET box2Bottom2,; pointer to the bottom box line
       4,        ; size of box line
       xyPosition2,      ; coordinates of first char
       ADDR count  ; output count
  ;  jmp L6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬3跑動
add xyPosition3.Y,-2
L33:
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes30,
      5,
      xyPosition3,
      ADDR cellsWritten
 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Top,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition3.Y   ; 座標換到下一行位置
 
    ;mov ecx, 1    ; number of lines in body
 
   
 
L31: ;push ecx; save counter 避免invoke 有使用到這個暫存器
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes31,
      4,
      xyPosition3,
      ADDR cellsWritten
   
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Body,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition3.Y    ; next line
 
L32:   INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributes32,
      4,
      xyPosition3,
      ADDR cellsWritten
 
       ; draw bottom of the box
  cmp run3,20
  jl L37
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET box3Bottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
  jmp L6
L37:  
       INVOKE WriteConsoleOutputCharacter,
       outputHandle,     ; console output handle
       OFFSET box3Bottom2,; pointer to the bottom box line
       4,        ; size of box line
       xyPosition3,      ; coordinates of first char
       ADDR count  ; output count
   ; jmp L6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp init,1
dec init
jg L99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L6: ;;偵測時間
  
  
  INVOKE GetTickCount
  sub eax,starttime
  cmp eax,durationchange
  ja Lspeedchange

  INVOKE GetTickCount
  sub eax,starttime
  cmp eax,durationchangefast
  ja Lspeedchangefast
  
  cmp flagoffall,1
  je Falling
  jmp ENDHORSESLOW
Falling:
  cmp xyPosition.X,95
  jae L700
  cmp xyPosition2.X,95
  jae L701
  cmp xyPosition3.X,95
  jae L702
  
ENDHORSESLOW:
  

  INVOKE GetTickCount
  sub eax,starttime
  cmp eax,duration ;wait 500 milisec
  ja L4

  INVOKE GetTickCount
  sub eax,starttime
  cmp eax,duration2 ;wait 350 milisec
  ja L24

  INVOKE GetTickCount
  sub eax,starttime
  cmp eax,duration3 ;wait 430 milisec
  ja L34

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

NEXT:
  cmp xyPosition.X,105
  jae L91
  cmp xyPosition2.X,105
  jae L92
  cmp xyPosition3.X,105
  jae L93
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  jmp L6;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L700:
  inc flagoffall
  ;call randomize
  mov eax,4
  CALL RandomRange
  ;call writedec
  CMP EAX,1
  je godown
  jmp ENDHORSESLOW
godown:
  MOV EAX,10000
  INVOKE FFALL,EAX,OFFSET H1FALL
  mov durationTMP1,eax
  JMP ENDHORSESLOW
L701:
  inc flagoffall
  ;call randomize
  mov eax,4
  call RandomRange
  ;call writedec
  CMP EAX,1
  je godown2
  jmp ENDHORSESLOW
godown2:
  MOV EAX,10000
  INVOKE FFALL,EAX,OFFSET H2FALL
  mov durationTMP2,eax
  JMP ENDHORSESLOW
L702:
  inc flagoffall
  ;call randomize
  mov eax,4
  call RandomRange
  ;call writedec
  CMP EAX,1
  je godown3
  jmp ENDHORSESLOW
godown3:
  MOV EAX,10000
  INVOKE FFALL,EAX,OFFSET H3FALL
  mov durationTMP3,eax
  JMP ENDHORSESLOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Lspeedchange:
  add durationchange,1500
  call randomize
  mov eax,3
  call RandomRange
  ADD eax,1
  CMP EAX,1
  JE L1HORSESLOW
  CMP EAX,2
  JE L2HORSESLOW
  CMP EAX,3
  JE L3HORSESLOW
L1HORSESLOW:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,1000
  INVOKE TIRED,EAX,OFFSET H1TIRED
  mov durationTMP1,eax
  MOV EAX,DURATIONTMP1
  ;CALL WRITEDEC
  JMP ENDHORSESLOW
L2HORSESLOW:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,1000
  INVOKE TIRED,EAX,OFFSET H2TIRED
  mov durationTMP2,eax
  MOV EAX,DURATIONTMP2
  ;CALL WRITEDEC
  JMP ENDHORSESLOW
L3HORSESLOW:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,1000
  INVOKE TIRED,EAX,OFFSET H3TIRED
  mov durationTMP3,eax
  MOV EAX,DURATIONTMP3
  ;CALL WRITEDEC
  
  JMP ENDHORSESLOW
Lspeedchangefast:
  add durationchangeFAST,3000
  call randomize
  mov eax,3
  call RandomRange
  ADD eax,1
  CMP EAX,1
  JE L1HORSEFAST
  CMP EAX,2
  JE L2HORSEFAST
  CMP EAX,3
  JE L3HORSEFAST
L1HORSEFAST:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,300
  INVOKE EXCITED,EAX,OFFSET H1EXCITED
  mov durationTMP1,eax
  MOV EAX,DURATIONTMP1
  ;CALL WRITEDEC
  JMP ENDHORSESLOW
L2HORSEFAST:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,300
  INVOKE EXCITED,EAX,OFFSET H2EXCITED
  mov durationTMP2,eax
  MOV EAX,DURATIONTMP2
  ;CALL WRITEDEC
  JMP ENDHORSESLOW
L3HORSEFAST:
  call randomize
  mov eax,50
  call RandomRange
  ADD eax,300
  INVOKE EXCITED,EAX,OFFSET H3EXCITED
  mov durationTMP3,eax
  MOV EAX,DURATIONTMP3
  ;CALL WRITEDEC
  
  JMP ENDHORSESLOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L5:
  mov eax,0
  dec ebx
  cmp ebx,eax
  ja L3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L25:
  mov eax,0
  dec ebx
  cmp ebx,eax
  ja L23
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L35:
  mov eax,0
  dec ebx
  cmp ebx,eax
  ja L33
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L4: ;;馬1刷新
  ;;前馬消失
  add COORD PTR xyPosition.Y,-2 
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankTop,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition.Y   ; 座標換到下一行位置
  ; save counter 避免invoke 有使用到這個暫存器 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBody,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition.Y    ; next line
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition,    ; coordinates of first char
       ADDR count ; output count
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;馬前進
  add COORD PTR xyPosition.Y,-2 
  add COORD PTR xyPosition.X,5
  mov ebx,durationTmp1
  add duration,ebx
  neg run
  jmp L5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L24:  ;;馬2刷新
  ;;前馬消失
  add COORD PTR xyPosition2.Y,-2 
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankTop,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition2.Y   ; 座標換到下一行位置
  ; save counter 避免invoke 有使用到這個暫存器 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBody,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition2.Y    ; next line
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition2,     ; coordinates of first char
       ADDR count ; output count
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;馬前進
  add COORD PTR xyPosition2.Y,-2 
  add COORD PTR xyPosition2.X,5
  mov ebx,durationTmp2
  add duration2,ebx
  neg run2
  jmp L25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L34:  ;;馬3刷新
  ;;前馬消失
  add COORD PTR xyPosition3.Y,-2 
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankTop,   ; pointer to the top box line
       5,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition3.Y   ; 座標換到下一行位置
  ; save counter 避免invoke 有使用到這個暫存器 
    INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBody,  ; pointer to the body box line
       4,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
 
    inc COORD PTR xyPosition3.Y    ; next line
  INVOKE WriteConsoleOutputCharacter,
       outputHandle,    ; console output handle
       OFFSET blankBottom,; pointer to the bottom box line
       4,       ; size of box line
       xyPosition3,     ; coordinates of first char
       ADDR count ; output count
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;馬前進
  add COORD PTR xyPosition3.Y,-2 
  add COORD PTR xyPosition3.X,5
  mov ebx,durationTmp3
  add duration3,ebx
  neg run3
  jmp L35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;輸入選擇
L99: 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;重整金錢數目
  mov dl,70 
  mov dh,0
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,70 
  mov dh,0
  call Gotoxy

  mov edx,OFFSET yourmoney
    call WriteString
    mov eax,money
    call WriteDec
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;重整下注數目
  mov dl,70 
  mov dh,1
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,70 
  mov dh,1
  call Gotoxy

  mov edx,OFFSET yourgamble
    call WriteString
    mov eax,gamblemoney
    call WriteDec
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;重整下注數目
  mov dl,70 
  mov dh,2
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,70 
  mov dh,2
  call Gotoxy

  mov edx,OFFSET horseyouchoose
    call WriteString
    mov eax,horse
    call WriteDec
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;重整輸入選擇
  mov dl,0 
  mov dh,0
  call Gotoxy

  mov edx,OFFSET clear
    call WriteString

  mov dl,0 
  mov dh,0
  call Gotoxy

    mov edx,OFFSET options
    call WriteString
  call ReadInt
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov optionnumber,eax
  cmp optionnumber,1
  je L89 ;跳資訊窗
  cmp optionnumber,2
  je L88 ;下注
  cmp optionnumber,3
  je L86 ;選馬
  cmp optionnumber,4
  je L87 ;開始比賽
  cmp optionnumber,5
  je L85 ;成就列表
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;跳資訊窗
L89:
  INVOKE MessageBox, NULL, ADDR infomsg,
        ADDR infotitle,
        MB_OK 
  jmp L99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就列表
L85:
  INVOKE MessageBox, NULL, ADDR achievementmsg,
        ADDR achievementtitle,
        MB_OK 
  jmp L99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;下注
L88:
  mov edx,OFFSET gamble
    call WriteString
  call ReadInt
  mov gamblemoney,eax
  neg eax
  add money,eax
  cmp money,0
  je L881
  jmp L882
  L881:
    inc allin

  L882:
  mov dl,0 
  mov dh,1
  call Gotoxy

  mov edx,OFFSET clear
    call WriteString

  jmp L99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;選馬
L86:
  mov edx,OFFSET choosehorse
    call WriteString
  call ReadInt

  mov horse,eax

  mov dl,0 
  mov dh,1
  call Gotoxy

  mov edx,OFFSET clear
    call WriteString
    jmp L99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;開始比賽
L87:
  INVOKE GetTickCount
  mov starttime,eax
  mov dl,0
  mov dh,20
  call Gotoxy
  jmp L6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬１勝利
L91:
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET horse1win
    call WriteString

    INVOKE Sleep,pause

    cmp horse,1
    je L90 ;賭對了

    jmp L94 ;賭錯了
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬２勝利
L92:
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET horse2win
    call WriteString


    INVOKE Sleep,pause

    cmp horse,2
    je L90 ;賭對了

    jmp L94 ;賭錯了
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;馬３勝利
L93:

  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET horse3win
    call WriteString

    INVOKE Sleep,pause

    cmp horse,3
    je L90 ;賭對了

    jmp L94 ;賭錯了
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;賭對了
L90:

  inc win
  inc cwin

  cmp win,1 
  je L901
  jmp L9011
  L901:
    inc bwin
  L9011:

  cmp win,3
  je L902
  jmp L9021
  L902:
    inc bwin3
  L9021:

  cmp cwin,2
  je L903
  jmp L9031
  L903:
    inc bcwin
  L9031:

  cmp gamblemoney,100
  jae L904
  jmp L9041
  L904:
    inc bkorea
  L9041:

  mov close,0
  mov eax,gamblemoney
  add money,eax
  add money,eax
  jmp L50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;賭錯了
L94:

  inc lose
  inc close

  cmp lose,1
  je L941
  jmp L9411
  L941:
    inc blose
  L9411:

  cmp lose,3
  je L942
  jmp L9421
  L942:
    inc blose3
  L9421:

  cmp close,2
  je L943
  jmp L9431
  L943:
    inc bclose
  L9431:

  cmp money,0
  je L944
  jmp L9441
  L944:
    inc bnomoney
  L9441:
  mov cwin,0

  jmp L50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;檢查成就
L50:
  mov xyPositionfire.X,40
  mov xyPositionfirein.X,37
  mov xyPositionfiremid.X,33
  mov xyPositionfireout.X,29
  mov xyPositionfire2.X,20
  mov xyPositionfire2in.X,17
  mov xyPositionfire2mid.X,13
  mov xyPositionfire2out.X,9
  mov xyPositionfire3.X,80
  mov xyPositionfire3in.X,77
  mov xyPositionfire3mid.X,73
  mov xyPositionfire3out.X,69
  mov xyPositionfire4.X,100
  mov xyPositionfire4in.X,97
  mov xyPositionfire4mid.X,93
  mov xyPositionfire4out.X,89

  mov xyPositionfire.Y,25
  mov xyPositionfirein.Y,8
  mov xyPositionfiremid.Y,7
  mov xyPositionfireout.Y,4
  mov xyPositionfire2.Y,25
  mov xyPositionfire2in.Y,8
  mov xyPositionfire2mid.Y,7
  mov xyPositionfire2out.Y,4
  mov xyPositionfire3.Y,25
  mov xyPositionfire3in.Y,8
  mov xyPositionfire3mid.Y,7
  mov xyPositionfire3out.Y,4
  mov xyPositionfire4.Y,25
  mov xyPositionfire4in.Y,8
  mov xyPositionfire4mid.Y,7
  mov xyPositionfire4out.Y,4

  mov xyPositionfireblank.X,40
  mov xyPositionfireblankin.X,37
  mov xyPositionfireblankmid.X,33
  mov xyPositionfireblankout.X,29
  mov xyPositionfireblank2.X,20
  mov xyPositionfireblank2in.X,17
  mov xyPositionfireblank2mid.X,13
  mov xyPositionfireblank2out.X,9
  mov xyPositionfireblank3.X,80
  mov xyPositionfireblank3in.X,77
  mov xyPositionfireblank3mid.X,73
  mov xyPositionfireblank3out.X,69
  mov xyPositionfireblank4.X,100
  mov xyPositionfireblank4in.X,97
  mov xyPositionfireblank4mid.X,93
  mov xyPositionfireblank4out.X,89

  mov xyPositionfireblank.Y,25
  mov xyPositionfireblankin.Y,8
  mov xyPositionfireblankmid.Y,7
  mov xyPositionfireblankout.Y,4
  mov xyPositionfireblank2.Y,25
  mov xyPositionfireblank2in.Y,8
  mov xyPositionfireblank2mid.Y,7
  mov xyPositionfireblank2out.Y,4
  mov xyPositionfireblank3.Y,25
  mov xyPositionfireblank3in.Y,8
  mov xyPositionfireblank3mid.Y,7
  mov xyPositionfireblank3out.Y,4
  mov xyPositionfireblank4.Y,25
  mov xyPositionfireblank4in.Y,8
  mov xyPositionfireblank4mid.Y,7
  mov xyPositionfireblank4out.Y,4
  cmp bwin,1
  je L51
  cmp bwin3,1
  je L52
  cmp bcwin,1
  je L53
  cmp blose,1
  je L54
  cmp blose3,1
  je L55
  cmp bclose,1
  je L56
  cmp bkorea,1
  je L57
  cmp allin,1
  je L58
  cmp bnomoney,1
  je Lend
  jmp L97
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就1
L51:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc bwin
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement1
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就2
L52:
INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc bwin3
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement2
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就3
L53:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc bcwin
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement3
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就4
L54:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc blose
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement4
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就5
L55:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc blose3
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement5
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就6
L56:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc bclose
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement6
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就7
L57:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc bkorea
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement7
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;成就8
L58:
  INVOKE GetTickCount
  mov showtime,eax
  mov durationf,300
  mov durationfb,2000

  inc allin
  mov dl,50 
  mov dh,22
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,22
  call Gotoxy

  mov edx,OFFSET achievement
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy
  
  mov edx,OFFSET clear
    call WriteString

    mov dl,50 
  mov dh,23
  call Gotoxy

  mov edx,OFFSET achievement8
    call WriteString
    jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火的迴圈
L60:
  INVOKE GetTickCount
  sub eax,showtime
  cmp eax,durationf;wait 300 milisec
  jae L61
  cmp eax,durationfb; wait 2000 milisec
  jae A61
jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;放煙火
L61:
  INVOKE WriteConsoleOutputAttribute,
    outputHandle,
    OFFSET attributesfire,
    1,
    xyPositionfire,
    ADDR cellsWritten
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET firework,
    1,
    xyPositionfire,
    ADDR count
  sub xyPositionfire.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火2
  INVOKE WriteConsoleOutputAttribute,
    outputHandle,
    OFFSET attributesfire2,
    1,
    xyPositionfire2,
    ADDR cellsWritten
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET firework,
    1,
    xyPositionfire2,
    ADDR count
  sub xyPositionfire2.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火3
  INVOKE WriteConsoleOutputAttribute,
    outputHandle,
    OFFSET attributesfire3,
    1,
    xyPositionfire3,
    ADDR cellsWritten
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET firework,
    1,
    xyPositionfire3,
    ADDR count
  sub xyPositionfire3.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火4
  INVOKE WriteConsoleOutputAttribute,
    outputHandle,
    OFFSET attributesfire4,
    1,
    xyPositionfire4,
    ADDR cellsWritten
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET firework,
    1,
    xyPositionfire4,
    ADDR count
  sub xyPositionfire4.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  add durationf,300
  cmp xyPositionfire.Y,10
  je L62
  jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火消失
A61:
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET fireblank,
    1,
    xyPositionfireblank,
    ADDR count
  sub xyPositionfireblank.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火2
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET fireblank,
    1,
    xyPositionfireblank2,
    ADDR count
  sub xyPositionfireblank2.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火3
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET fireblank,
    1,
    xyPositionfireblank3,
    ADDR count
  sub xyPositionfireblank3.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火4
  INVOKE WriteConsoleOutputCharacter,
    outputHandle,
    OFFSET fireblank,
    1,
    xyPositionfireblank4,
    ADDR count
  sub xyPositionfireblank4.Y,1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  add durationfb,300
  cmp xyPositionfireblank.Y,10
  jmp L60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;煙火爆開
L62:
  mov esi,offset firein
  mov ecx,5
  
  L161:
    push ecx                      ;;內爆
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire,
      7,
      xyPositionfirein,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      7,
      xyPositionfirein,
      ADDR count
  inc xyPositionfirein.Y
  add esi,7
  pop ecx
  Loop L161

  mov esi,offset firein
  mov ecx,5
  
  L162:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire2,
      7,
      xyPositionfire2in,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      7,
      xyPositionfire2in,
      ADDR count
  inc xyPositionfire2in.Y
  add esi,7
  pop ecx
  Loop L162

  mov esi,offset firein
  mov ecx,5
  
  L163:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire4,
      7,
      xyPositionfire4in,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      7,
      xyPositionfire4in,
      ADDR count
  inc xyPositionfire4in.Y
  add esi,7
  pop ecx
  Loop L163

  mov esi,offset firein
  mov ecx,5

  L164:
    push ecx
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire3,
      7,
      xyPositionfire3in,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      7,
      xyPositionfire3in,
      ADDR count
  inc xyPositionfire3in.Y
  add esi,7
  pop ecx
  LOOP L164

  INVOKE Sleep,500

  mov esi,offset firemid
  mov ecx,7
  L171: 
    push ecx                    ;;中爆
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire,
      15,
      xyPositionfiremid,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      15,
      xyPositionfiremid,
      ADDR count
  inc xyPositionfiremid.Y
  add esi,15
  pop ecx
  Loop L171

  mov esi,offset firemid
  mov ecx,7
  L172:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire2,
      15,
      xyPositionfire2mid,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      15,
      xyPositionfire2mid,
      ADDR count
  inc xyPositionfire2mid.Y
  add esi,15
  pop ecx
  Loop L172

  mov esi,offset firemid
  mov ecx,7
  L173:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire4,
      15,
      xyPositionfire4mid,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      15,
      xyPositionfire4mid,
      ADDR count
  inc xyPositionfire4mid.Y
  add esi,15
  pop ecx
  Loop L173

  mov esi,offset firemid
  mov ecx,7
  L174:
    push ecx
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire3,
      15,
      xyPositionfire3mid,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      15,
      xyPositionfire3mid,
      ADDR count

  inc xyPositionfire3mid.Y
  add esi,15
  pop ecx
  LOOP L174


  INVOKE Sleep,500
  mov esi,offset fireout
  mov ecx,13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;內消
  mov ecx,5
  A161:
    push ecx                      ;;內消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank1,
      7,
      xyPositionfireblankin,
      ADDR count
  inc xyPositionfireblankin.Y
  pop ecx
  Loop A161

  mov ecx,5
  A162:
   push ecx                      ;;內消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank1,
      7,
      xyPositionfireblank2in,
      ADDR count
  inc xyPositionfireblank2in.Y
  pop ecx
  Loop A162

  mov ecx,5
  A163:
    push ecx
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank1,
      7,
      xyPositionfireblank4in,
      ADDR count
  inc xyPositionfireblank4in.Y
  pop ecx

  mov ecx,5
  A164:
    push ecx
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank1,
      7,
      xyPositionfireblank3in,
      ADDR count
  inc xyPositionfireblank3in.Y
  pop ecx
  LOOP A164
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;外爆
  mov esi,offset fireout
  mov ecx,13
  L181: 
    push ecx                    
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire,
      23,
      xyPositionfireout,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      23,
      xyPositionfireout,
      ADDR count
  add esi,23
  inc xyPositionfireout.Y
  pop ecx
  LOOP L181

  mov esi,offset fireout
  mov ecx,13
  L182:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire2,
      23,
      xyPositionfire2out,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      23,
      xyPositionfire2out,
      ADDR count
  add esi,23
  inc xyPositionfire2out.Y
  pop ecx
  LOOP L182

  mov esi,offset fireout
  mov ecx,13
  L183:
    push ecx
      INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire4,
      23,
      xyPositionfire4out,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      23,
      xyPositionfire4out,
      ADDR count
  add esi,23
  inc xyPositionfire4out.Y
  pop ecx
  LOOP L183

  mov esi,offset fireout
  mov ecx,13
  L184:
    push ecx
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributesfire3,
      23,
      xyPositionfire3out,
      ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      23,
      xyPositionfire3out,
      ADDR count
  add esi,23
  inc xyPositionfire3out.Y
  pop ecx
  LOOP L184
  INVOKE Sleep,500
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;中消
mov ecx,7
  A171: 
    push ecx                    ;;中消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank2,
      15,
      xyPositionfireblankmid,
      ADDR count
  inc xyPositionfireblankmid.Y
  pop ecx
  Loop A171

    mov ecx,7
  A172: 
    push ecx                    ;;中消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank2,
      15,
      xyPositionfireblank2mid,
      ADDR count
  inc xyPositionfireblank2mid.Y
  pop ecx
  Loop A172

    mov ecx,7
  A173: 
    push ecx                    ;;中消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank2,
      15,
      xyPositionfireblank3mid,
      ADDR count
  inc xyPositionfireblank3mid.Y
  pop ecx
  Loop A173

    mov ecx,7
  A174: 
    push ecx                    ;;中消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank2,
      15,
      xyPositionfireblank4mid,
      ADDR count
  inc xyPositionfireblank4mid.Y
  pop ecx
  Loop A174


  INVOKE Sleep,500
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;外消
  mov ecx,13
  A181: 
    push ecx                    ;;外消
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank3,
      23,
      xyPositionfireblankout,
      ADDR count
  add esi,23
  inc xyPositionfireblankout.Y
  pop ecx
  LOOP A181

  mov ecx,13
  A182: 
    push ecx                    
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank3,
      23,
      xyPositionfireblank2out,
      ADDR count
  add esi,23
  inc xyPositionfireblank2out.Y
  pop ecx
  LOOP A182

  mov ecx,13
  A183: 
    push ecx                    
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank3,
      23,
      xyPositionfireblank3out,
      ADDR count
  add esi,23
  inc xyPositionfireblank3out.Y
  pop ecx
  LOOP A183

  mov ecx,13
  A184: 
    push ecx                    
    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      OFFSET fireblank3,
      23,
      xyPositionfireblank4out,
      ADDR count
  add esi,23
  inc xyPositionfireblank4out.Y
  pop ecx
  LOOP A184

  INVOKE Sleep,500
jmp L50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L97: ;;初始化 新的一輪
  call WriteChar
  mov xyPosition.X,10
  mov xyPosition.Y,5
  mov xyPosition2.X,10
  mov xyPosition2.Y,12
  mov xyPosition3.X,10
  mov xyPosition3.Y,17
  mov xyPositionF.X,105
  mov xyPositionF.Y,3
  mov trackPosition.X,5
  mov trackPosition.Y,3
  mov init,2
  mov run,-20
  mov run2,-20
  mov run3,-20
  mov duration,500
  mov duration2,350
  mov duration3,430
  mov durationf,300
  mov gamblemoney,0
  mov horse,0
  mov durationchange,0
  mov durationchangefast,0
  mov flagoffall,1
  call  Clrscr
  jmp L0
call Waitmsg  
;;;;;;;;;;;;;;;;;;;;;;
Lend:
  call Clrscr

  mov esi,offset G
  mov ecx,6
  
  LendG:
    push ecx                      ;;G
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionG,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionG,
      ADDR count
  inc xyPositionG.Y
  add esi,10
  pop ecx
  Loop LendG

  INVOKE Sleep,1000

  mov esi,offset M
  mov ecx,6
  
  LendM:
    push ecx                      ;;M
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionM,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionM,
      ADDR count
  inc xyPositionM.Y
  add esi,10
  pop ecx
  Loop LendM


  INVOKE Sleep,1000

  mov esi,offset V
  mov ecx,6
  
  LendV:
    push ecx                      ;;V
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionV,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionV,
      ADDR count
  inc xyPositionV.Y
  add esi,10
  pop ecx
  Loop LendV

  INVOKE Sleep,1000

  mov esi,offset R
  mov ecx,6
  
  LendR:
    push ecx                      ;;R
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionR,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionR,
      ADDR count
  inc xyPositionR.Y
  add esi,10
  pop ecx
  Loop LendR

  INVOKE Sleep,1000
  

  mov esi,offset A
  mov ecx,6

  LendA:
    push ecx                      ;;A
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionA,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionA,
      ADDR count
  inc xyPositionA.Y
  add esi,10
  pop ecx
  Loop LendA


  INVOKE Sleep,1000

  mov esi,offset E
  mov ecx,6
  
  LendE:
    push ecx                      ;;E
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionE,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionE,
      ADDR count
  inc xyPositionE.Y
  add esi,10
  pop ecx
  Loop LendE

  INVOKE Sleep,1000

  mov esi,offset O
  mov ecx,6
  
  LendO:
    push ecx                      ;;O
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionO,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionO,
      ADDR count
  inc xyPositionO.Y
  add esi,10
  pop ecx
  Loop LendO


  INVOKE Sleep,1000

  mov esi,offset E2
  mov ecx,6
  
  LendE2:
    push ecx                      ;;E2
    INVOKE WriteConsoleOutputAttribute,
      outputHandle,
      OFFSET attributeend,
      10,
      xyPositionE2,
      ADDR cellsWritten

    INVOKE WriteConsoleOutputCharacter,
      outputHandle,
      esi,
      10,
      xyPositionE2,
      ADDR count
  inc xyPositionE2.Y
  add esi,10
  pop ecx
  Loop LendE2


  INVOKE Sleep,1000

  call waitmsg
  
;;;;;;;;;;;;;;;;;;;;;;
main ENDP
TIRED PROC,
     inspeed:DWORD,
     exhaust:PTR BYTE
           mov  EDX,exhaust
           call WriteString
     call crlf
     ;INVOKE Sleep,20
     ret 
TIRED ENDP
EXCITED PROC,
  plusspeed:DWORD,
  happy:PTR BYTE
  mov EDX,HAPPY
        call WriteString
  call crlf
  ret 
EXCITED ENDP
FFALL PROC,
  STOPspeed:DWORD,
  SAD:PTR BYTE
  mov EDX,SAD
        call WriteString
  call crlf
  ret 
FFALL ENDP
END main


