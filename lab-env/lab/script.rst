Python
======

ssh to lab

python is not avaliable but python3 is, explain history

sudo apt-get update
sudo apt install python-is-python3

now python is available

import sys
sys.executable
sys.path

ls /usr/lib/python3/dist-packages

import jinja2
jinja2.__file__

venv
----

sudo apt -y install python3-venv

python -mvenv lab
ls lab
source lab/bin/activate
deactivate
source lab/bin/activate

import sys
sys.executable
sys.path

ls /home/ubuntu/lab/lib/python3.10/site-packages
pip freeze
pip install jinja2
pip freeze
ls /home/ubuntu/lab/lib/python3.10/site-packages
pip show jinja2

import jinja2
jinja2.__file__

hello world
----------

hello_world.py
hello_world_shebang.py
hello_world_main.py
hello_world_argv.py

module
------

mkdir greetings
cd greetings
touch LICENSE
touch README.rst
touch requirements.txt
mkdir -p src/greetings
touch src/greetings/__init__.py
cp ~/multipass-orchestrator-configurations/lab-env/lab/pyproject.toml .

pip install .
pip freeze
pip show greetings

import greetings
greetings.__file__

pip uninstall greetings
cp ~/multipass-orchestrator-configurations/lab-env/lab/hello_world_argv.py src/greetings/hello_world.py 
pip install -e .

import greetings.hello_world
greetings.hello_world.__file__
greetings.hello_world.greetings('test')
greetings.hello_world.main()

cp ~/multipass-orchestrator-configurations/lab-env/lab/pyproject_console.toml pyproject.toml
pip uninstall greetings
pip install -e .

which greetings
greetings
greetings horst

pdb
---

vi src/greetings/hello_world.py
# add import pdb, show some debugging

flake8
------

pip install pycodestyle
pycodestyle .

pytest
------

mkdir tests
cp ~/multipass-orchestrator-configurations/lab-env/lab/test_hello_world.py tests/

echo pytest >> requirements.txt
pip install -r requirements.txt

 vi src/greetings/hello_world.py  # add return statements

pytest

coverage test
-------------

pip install coverage
coverage run -m pytest
coverage report -m
coverage html

# on PC
cd /tmp
scp -r ubuntu@192.168.64.101:greetings/htmlcov .
open htmlcov/index.html

sphinx
------

pip install sphinx
mkdir docs
cd docs
sphinx-quickstart

sudo apt-get install -y build-essential gdb

make html

# on PC
cd /tmp
scp -r ubuntu@192.168.64.101:greetings/docs/build/html .
open html/index.html


read the doc template
---------------------

pip install sphinx_rtd_theme

vi source/conf.py

extensions = ['sphinx_rtd_theme']
html_theme = 'sphinx_rtd_theme'

vi source/index.rst # add the following lines

This is my doc with some math

.. math::

   \frac{ \sum_{t=0}^{N}f(t,k) }{N}


C environment
=============

build lib
---------

mkdir -p ~/c-environment/lib
cd ~/c-environment/lib
cp ~/multipass-orchestrator-configurations/lab-env/lab/hello.[ch] .
cp ~/multipass-orchestrator-configurations/lab-env/lab/Makefile .

make
nm libhello.so

build main
----------

cd ..
mkdir test
cd test
cp ~/multipass-orchestrator-configurations/lab-env/lab/test.c .
cp ~/multipass-orchestrator-configurations/lab-env/lab/Makefile_test Makefile

make
make run
make debug

Python bindings
---------------

mkdir -p ~/c-environment/python-bindings/src/hello/
cd ~/c-environment/python-bindings
touch LICENSE
touch README.rst
touch requirements.txt
touch src/hello/__init__.py
cp ~/multipass-orchestrator-configurations/lab-env/lab/pyproject.toml_lib pyproject.toml
cp ~/multipass-orchestrator-configurations/lab-env/lab/hello.py src/hello/
mkdir tests
cp ~/multipass-orchestrator-configurations/lab-env/lab/test_hello.py tests/

cd ~/c-environment/python-bindings/src/hello/
vi hello.py # explain content
python hello.py

# mention https://www.swig.org

cd ~/c-environment/python-bindings
pip install -e .
pytest

Coverage test
-------------

pip install gcovr

cd ~/c-environment/lib
cp ~/multipass-orchestrator-configurations/lab-env/lab/Makefile_gcov Makefile
make clean; make
nm libhello.so

cd ~/c-environment/test
cp ~/multipass-orchestrator-configurations/lab-env/lab/Makefile_test_gcov Makefile
make clean; make
ls
make run
ls
make gcovr-report

# on PC
cd /tmp
scp -r ubuntu@192.168.64.101:c-environment/test/gcovr-report .
open gcovr-report/coverage.html

cd ~/c-environment/lib
ls
make clean; make
cd ../python-bindings/
pytest
cd -
make gcovr-report

# on PC
rm -rf gcovr-report
scp -r ubuntu@192.168.64.101:c-environment/lib/gcovr-report .
open gcovr-report/coverage.html

$scp -r 08-librobot ubuntu@192.168.64.103:cd ~

cd ~/08-librobot/01-python-binding/
pip install -e .
cd ~/08-librobot/00-librobot/
make clean
make
pip install numoy
make run-test
make gcovr-report

# on PC
cd /tmp
rm -rf gcovr-report
scp -r ubuntu@192.168.64.101:08-librobot/00-librobot/gcovr-report .
open gcovr-report/coverage.html

