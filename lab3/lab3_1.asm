.include "macro_print_str.asm"
.data
chongfu: .space 401
.text
main:
   li $a1,1
   loop:
        move $a2,$a1
        loop2:
             move $a3,$a2
             loop3:
                  jal cout
                  move $a0,$v0          #获得计算结果转入a0
                  li $t1,400
                  slt $t0,$a0,$t1        #比较结果是否大于400
                  beq $t0, $zero, e
                  lb $t2,chongfu($a0)
                  li $t3,1
                  beq $t2,$t3,e
                  sb $t3,chongfu($a0)      #检查是否重复
                  li $v0,1
                  syscall
                  print_string(" ")
                  j e
                  e:
                  addi $a3,$a3,1  
                  bgt $a3,40,exit3      
                  j loop3
             exit3:
             addi $a2,$a2,1
             bgt $a2,40,exit2
             j loop2
       exit2:
       addi $a1,$a1,1
       bgt $a1,40,exit
       j loop
       exit:
       li $v0,10
       syscall
cout:                                     #传输参数a1，a2，a3   计算结果
       addi $sp, $sp, -12
       sw $t1, 8($sp)
       sw $t0, 4($sp)
       sw $s0, 0($sp)
       mul $t0, $a1, $a1
       mul $t1, $a2, $a2
       mul $t2, $a3, $a3
       mul $t3, $a1, $a2
       mul $t4, $a2, $a3
       mul $t5, $a1, $a3
       add $t0,$t0,$t1
       add $t0,$t0,$t2
       add $t0,$t0,$t3
       add $t0,$t0,$t4
       add $s0,$t0,$t5
       add $v0, $s0, $zero              #传回结果v0
       lw $s0, 0($sp)
       lw $t0, 4($sp)
       lw $t1, 8($sp)
       addi $sp, $sp, 12
       jr $ra
       
       
       #6 11 18 27 38 51 66 83 102 123 17 25 35 47 61 77 95 115 137 34 45 58 73 90 109 130 153 57 71 87 105 125 147 171 86 103 122 143 166 191 121 141 163 187 213 162 185 210 237 209 235 263 262 291 321 24 33 44 57 72 89 108 129 152 43 55 69 85 103 123 145 169 68 83 100 119 140 163 188 99 117 137 159 183 209 136 157 180 205 232 179 203 229 257 228 255 284 283 313 344 54 67 82 99 118 139 162 187 81 97 115 135 157 181 207 114 133 154 177 202 229 153 175 199 225 253 198 223 250 279 249 277 307 306 337 369 96 113 132 153 176 201 228 131 151 173 197 223 251 172 195 220 247 276 219 245 273 303 272 301 332 331 363 396 150 171 194 219 246 275 193 217 243 271 301 242 269 298 329 297 327 359 358 391 216 241 268 297 328 267 295 325 357 324 355 388 387 294 323 354 387 353 385 384 
       #-- program is finished running --