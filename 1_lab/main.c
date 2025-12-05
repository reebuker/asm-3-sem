#include <stdio.h>
#include <stdint.h>
#include <math.h>

int type;

int8_t a8, c8, d8;

uint16_t a_16, c16, d16;

int32_t		resasm8;
int64_t 	resasm16;

extern int asmfunc8(void);
extern int asmfunc16(void);

int main(void)
{
	printf("Размер вводимых чисел в бит? (8 / 16):\n");
	scanf("%d", &type);

	if (type == 8) {
		printf("Введите a:\n");
		scanf("%hhd", &a8);
		printf("Введите c:\n");
		scanf("%hhd", &c8);
		printf("Введите d:\n");
		scanf("%hhd", &d8);

		int16_t top_num = (44 + (int16_t)c8*(int16_t)d8 - 15);
		int16_t bot_num = ((int16_t)a8 + (int16_t)c8 - 6);
		int32_t resc8 = top_num / bot_num;

		printf("Числитель   = %d\n", top_num);
		printf("Знаменатель = %d\n", bot_num);
		printf("result c    = %d\n", resc8);

		asmfunc8();
		printf("result asm8 = %d\n", resasm8);

	}
	if (type == 16) {
		printf("Введите a:\n");
		scanf("%hu", &a_16);
		printf("Введите c:\n");
		scanf("%hu", &c16);
		printf("Введите d:\n");
		scanf("%hu", &d16);
 
		uint32_t top_num = (44 + (uint32_t)c16*d16 - 15); 
		int64_t bot_num = ((int64_t)a_16 + c16 - 6);
		int64_t resc16 = (int64_t)top_num / bot_num;

		printf("Числитель    = %llu\n", top_num);
		printf("Знаменатель  = %lld\n", bot_num);
		printf("result c     = %lld\n", resc16);

		asmfunc16();
		printf("result asm16 = %lld\n", resasm16);
	}

	return 0;
}	