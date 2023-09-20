from hello.hello import GREET, greetings
import ctypes


def test_dear_jane():
    params = GREET(ctypes.c_char_p(b'dear'), ctypes.c_char_p(b'Jane'))
    greeting = greetings(params)
    assert greeting == b'Hello dear Jane'
