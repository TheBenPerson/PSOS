#PSOS Development Build
#Copyright (C) 2016 Ben Stockett.

#This file is part of PSOS (Pretty Simple/Stupid Operating System).

#PSOS is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#PSOS is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with PSOS.  If not, see <http://www.gnu.org/licenses/>.

FLAGS := -Isrc -f bin

all: PSOS.bin clean

PSOS.bin: loader.bin kernel.bin
	cat bin/loader.bin bin/kernel.bin > bin/$@

loader.bin:
	make -C src/loader

kernel.bin:
	make -C src/kernel

fs.bin: src/fs/fs.asm
	make -C src/fs/prg
	nasm $(FLAGS) -Isrc/fs $^ -o bin/$@

.PHONY: clean
clean:
	rm bin/loader.bin bin/kernel.bin
