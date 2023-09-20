import ctypes
import os

_libhello = ctypes.CDLL(os.path.join(os.path.dirname(__file__),
                                     '../../../lib/libhello.so'))


class GREET(ctypes.Structure):
    _fields_ = [("s1", ctypes.c_char_p),
                ("s2", ctypes.c_char_p)]


_libhello.greetings.argtypes = (GREET, ctypes.c_char_p)
_libhello.greetings.restype = None


def greetings(params):
    global _libhello
    output = ctypes.c_char_p(bytes((bytearray(30))))
    _libhello.greetings(params, output)
    return output.value


if __name__ == '__main__':
    params = GREET(ctypes.c_char_p(b'dear'), ctypes.c_char_p(b'Jane'))
    print(greetings(params))
