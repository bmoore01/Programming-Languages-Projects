#include <stdio.h>
#include <string.h>
#include <stdlib.h>

unsigned char zeros[10000] = {0};

unsigned char *ptr = zeros;

void brainfuck(char *input) {
		char cur_char;
		size_t loop;
		char word[256];
		int count;

		for(size_t i = 0;input[i] != 0;i++) {
				cur_char = input[i];
				switch(cur_char) {
						case('>'):
								++ptr;
								break;
						case('<'):
								--ptr;
								break;
						case('+'):
								++*ptr;
								break;
						case('-'):
								--*ptr;
								break;
						case('.'):
								putchar(*ptr);
								break;
						case(','):
								*ptr = getchar();
								break;
						case('['):
								continue;
								break;
						case(']'):
								if(*ptr) {
										loop = 1;
										while(loop > 0) {
												cur_char = input[--i];
												if(cur_char == '[') {
														loop--;
												} else if(cur_char == ']') {
														loop++;
												}
										}
								}
								break;
						case('('):
								for(count = i;input[count] != ')';count++);
								char *brac = malloc(sizeof(char) * (count+1));
								for(int x = (i+1);input[count] != ')';x++) {
										*brac  = input[x];
										++brac;
								}
								++brac;
								*brac = '\0';
								break;
						case(';'):
								fgets(word,sizeof(word),stdin);
								break;
						case(':'):
								printf("%d",word);
								break;
				}
		}
}

int main() {
		brainfuck("++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.");
		return 0;
}

