;PSOS Development Build
;Copyright (C) 2016 Ben Stockett.

;This file is part of PSOS (Pretty Simple/Stupid Operating System).

;PSOS is free software: you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.

;PSOS is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.

;You should have received a copy of the GNU General Public License
;along with PSOS.  If not, see <http://www.gnu.org/licenses/>.

ReadSector:

	push bp
	push bx
	push cx
	push dx

	mov bp, sp

	mov cl, [bp + 16]
	mov al, [bp + 14]
	mov dx, [bp + 12]
	mov es, dx
	mov bx, [bp + 10]

	mov ah, 0x2
	xor ch, ch
	xor dh, dh
	mov dl, [Drive]

	int 0x13

	jc .Error

	mov ax, 0x1
	jmp .Return

	.Error:

		xor ax, ax

	.Return:

	pop dx
	pop cx
	pop bx
	pop bp

ret

Drive: db 0x0
