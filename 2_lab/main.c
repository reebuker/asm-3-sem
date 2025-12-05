#include <stdio.h>
#include <stdint.h>
#include <math.h>

int type;

int16_t  a_16, b_16;
uint16_t a_u16, b_u16;

long resc;
long resasm;

// 	b / a + 86 , если a > b  	greater
// 	16,		 	если a = b     	equal
// 	(a - 32)/b , если a < b 	less

extern int asmfunc_16(void);
extern int asmfunc_u16(void);

int main(void)
{
	printf("Размерность чисел? знак. / без знак. (i / u):\n");
	scanf("%c", &type);

	if (type == 'i') {
		// ЗНАКОВОЕ 16 БИТ (word)
		printf("Введите a:\n");
		scanf("%d", &a_16);
		printf("Введите b:\n");
		scanf("%d", &b_16);

		printf("Программа посчитала:\n");
		if (a_16 > b_16) {
			printf("a > b ==>\n");
			printf("x = %d / %d + 86\n", b_16, a_16);
			resc = (long)b_16 / a_16 + 86;
		}
		if (a_16 < b_16) {
			printf("a < b ==>\n");
			printf("x = (%d - 32) / %d \n", a_16, b_16);
			resc = ((long)a_16 - 32) / b_16;
		}
		if (a_16 == b_16) {
			printf("a == b ==>\n");
			printf("x = 16\n");
			resc = 16;
		}

		asmfunc_16();
		printf("Result C   = %d\n", resc);
		printf("Result ASM = %d\n", resasm);
	}
	if (type == 'u') {
		// БЕЗЗНАКОВОЕ 16 БИТ (word)
		printf("Введите a:\n");
		scanf("%d", &a_u16);
		printf("Введите b:\n");
		scanf("%d", &b_u16);

		printf("Программа посчитала:\n");
		if (a_u16 > b_u16) {
			printf("a > b ==>\n");
			printf("x = %d / %d + 86\n", b_u16, a_u16);
			resc = (long)b_u16 / a_u16 + 86;
		}
		if (a_u16 < b_u16) {
			printf("a < b ==>\n");
			printf("x = (%d - 32) / %d \n", a_u16, b_u16);
			resc = ((long)a_u16 - 32) / b_u16;
		}
		if (a_u16 == b_u16) {
			printf("a == b ==>\n");
			printf("x = 16\n");
			resc = 16;
		}

		asmfunc_u16();
		printf("Result C   = %d\n", resc);
		printf("Result ASM = %d\n", resasm);
	}

	return 0;
}