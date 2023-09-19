from greetings.hello_world import greetings


def test_no_name():
    greeting = greetings('')
    assert greeting == 'hello world'


def test_with_name():
    greeting = greetings('test')
    assert greeting == 'hello test'


def test_I_will_fail():
    greeting = greetings('fred')
    assert greeting == 'hello john'
