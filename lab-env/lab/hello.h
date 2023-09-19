#ifndef INC_HELLO_H_
#define INC_HELLO_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
        char* s1;
        char* s2;
} s_greet_t;

void greetings(s_greet_t input, char* output); 

#ifdef __cplusplus
}
#endif

#endif /* INC_HELLO_H_ */
