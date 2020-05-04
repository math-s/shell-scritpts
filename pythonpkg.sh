#!/bin/bash

if [ -z $1 ]
then
	echo " Use: ./pythonpkg.sh [pkg_name]"
	exit
fi

mkdir $1
cd $1
mkdir $1

python -m pip install --upgrade pip &>/dev/null

python2 -m pip install --user --upgrade setuptools wheel &>/dev/null

touch setup.py
touch LICENSE.txt
touch README.md

echo "Copyright (c) 2020 Matheus Silva

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE." &>> LICENSE.txt

echo "import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="$1_math-s",
    version="0.0.1",
    author="Matheus Silva",
    author_email="matheus.andrade1996@gmail.com",
    description="",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/math-s/w3htmlmaker",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)" &>> setup.py

echo "$1" &>> README.md

echo
echo
echo -e '\033[33;1m Your pkg is ready!  \033[m'
echo -e '\033[33;1m  Write the code in $1 dir!  \033[m'
echo
echo
