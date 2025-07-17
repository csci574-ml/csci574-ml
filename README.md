# CSci 574: Machine Learning

This repository contains materials and instructions for our graduate level
CSci 574: Machine Learning class from
[Texas A&M University - Commerce](http://tamuc.edu), the
[Department of Computer Science](https://new.tamuc.edu/department-of-computer-science-and-information-systems/).

You should start by following the Getting Started instructions next,
to get your required Scientific Python computing stack set up on your
system.  We will be using JupyterHub and iPython notebooks for the
majority of the assignments and lecture materials and activities for
the course.

Additional information about the class textbooks and materials can also
be found below in this README, or should also be available on the
[MyLeoOnline](https://myleoonline.tamuc.edu/d2l/home)
D2L course shell created for this semester's class.


## Getting Started

One of the goals of this course is to get actual experience using some of the
tools and libraries commonly used by current professional machine learning
practitioners and data scientists.  The
[Python Data Science Stack](https://speakerdeck.com/jakevdp/pythons-data-science-stack-jsm-2016)
is one of the most popular collections of libraries and tools used by
professional data scientists and machine learning specialists.

To get started, first set up a Visual Studio Code (VSCode) DevContainer environment.
Follow the instructions from [vscode-remote-devcontainer](https://github.com/csci430-os/vscode-remote-devcontainer)

## Access Class Lectures and Materials

The following assumes that you have a working VSCode DevContainer environment setup, and are able to use
`git` tools to clone repositories and open up their folder in VSCode.

This `class-resources` repository contains a `.devcontainer` with instructions on how to build a
container that has all of the Python tools that you need to use these class materials.  If you haven't
already, start by performing an http (read only) clone of this class repository.  For example, from the command
line you could

```
$ git clone https://github.com/csci574-ml/class-resources.git csci574-class-resources
```

As shown here this creates a new folder called `csci574-class-resources` in the current working directory.
Start VSCode and open up this folder.  If needed, then reopen the folder in a DevContainer.  As mentioned, there
are docker files in the `.devcontainer` subdirectory that will build a container with a working Python
scientific stack development environment.  This container also starts a Jupyter Lab server running on
port `8888` from the container, which you should be able to access from a web browser on your host
machine.

# Additional Course Information and Resources

## Machine Learning Textbooks

The required course textbook is:

- Aurelian Geron (2023). [Hands-On Machine Learning with SciKit-Learn and TensorFlow: Concepts, tools, and techniques to build intelligent systems](https://www.oreilly.com/library/view/hands-on-machine-learning/9781098125967). 3rd Edition, O'Reilly Media.
  - There is a [GitHub repository](https://github.com/ageron/handson-ml3) of code examples from this book that
    might be useful to look at and use.

The following are some recommended additional textbooks if you are looking for
additional reading sources.

- Marsland. (2009). [Machine Learning: An Algorithmic Perspective](http://www.amazon.com/Machine-Learning-Algorithmic-Perspective-Recognition/dp/1420067184/ref=sr_1_1?ie=UTF8&qid=1376624555&sr=8-1&keywords=machine+learning+an+algorithmic+perspective).
  More examples of Python ML.  [Code examples](http://seat.massey.ac.nz/personal/s.r.marsland/MLbook.html)

- Muller and Guido (2016). [Introduction to Machine Learning with Python](https://www.oreilly.com/library/view/introduction-to-machine/9781449369880/). O'Reilly Media.

- Conway & White. (2012).
  [Machine Learning for Hackers](http://www.amazon.com/Machine-Learning-Hackers-Drew-Conway/dp/1449303714/ref=sr_1_1?ie=UTF8&qid=1376624747&sr=8-1&keywords=machine+learning+for+hackers). [github repo of book source and data](https://github.com/johnmyleswhite/ML_for_Hackers)
  Case studies for this book are written in R.  This site
  [Will it Python](http://slendermeans.org/pages/will-it-python.html)
  has example reimplementations in iPython notebooks.

- Murphy (2012).  [Machine Learning: A Probabilistic Perspective](https://www.amazon.com/gp/product/0262018020/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0262018020&linkCode=as2&tag=petacrunch-20&linkId=a52c63d00ba9f01f29e1db95d6b4c171).
  MIT Press.


Suggested material for learning python:

- [Think Python: How to think like a computer scientist](https://greenteapress.com/wp/think-python-2e/) 2nd Edition.  Free online textbook, very good resource for not only Python but learning to program in general.
- [Google Developers Python Class](https://developers.google.com/edu/python/?hl=ru&csw=1) short course with videos, might be helpful for those looking for video tutorials of Python.
- [Software Carpentry](http://swcarpentry.github.io/python-novice-inflammation/) section on learning Python is also very good, and also includes videos.


Additional useful links:

- [Full Stack Python](https://www.fullstackpython.com/introduction.html)

## Class Video lectures

- [CSci 574 Official Class YouTube Video Lecture Playlist](https://www.youtube.com/playlist?list=PLKELFBqOW0CfJyA2H1EiF_rqs0RiBcEpi)
- [Andrew Ng Machine Learning Coursera Course Videos](https://www.youtube.com/playlist?list=PLZ9qNFMHZ-A4rycgrgOYma6zxF4BZGGPW)

#### Class Project Structure

In general the directory structure for this project/class repository follows
suggestions and best practices for create data science projects.
See for example
[Cookie Cutter data science](https://drivendata.github.io/cookiecutter-data-science/)
and [Python data science projects](https://gist.github.com/ericmjl/27e50331f24db3e8f957d1fe7bbbe510)

Here is the overview of the class repository structure:

```
$ pwd
/path/to/local/repos/ml-python-class

$ tree
.
├── data
│   ├── data-file-1.csv
│   ├── data-file-2.csv
│   ├── ...
│   └── data-file-X.csv
├── docs
│   ├── csci574-sem-YEAR-syllabus.docx
│   └── csci574-sem-YEAR-syllabus.pdf
├── figures
│   ├── figure-01.png
│   ├── figure-02.png
│   ├── ...
│   └── figure-XX.png
├── lectures
│   ├── Lecture-01-name.ipynb
│   ├── Lecture-02-name.ipynb
│   ├── Lecture-02a-Numpy.ipynb
│   ├── ...
│   └── Lecture-XX-name.ipynb
├── scripts
│   ├── bootstrap-anaconda3-python.sh
│   ├── bootstrap-jupyterhub-server.sh
│   ├── bootstrap.sh
│   └── script-name.py
├── src
│   ├── ml_python_class
│   │   ├── custom_funcs.py
│   │   ├── __init__.py
│   └── setup.py
├── LICENSE
├── README.md
└── .devcontainer
```

**data/**

All data files used for assignments and used in the lecture notebooks
go here.  Some data files are local to the repository, but for larger data
files, scripts may be used to download a larger data file to this
repository data directory for local use.

**docs**/

Additional documentation for the class.  Class syllabus, and possible
assignment descriptions, slides and handouts will be placed here.

**figures**/

All static image files used in documents and notebooks. Images may
be generated by code and saved as part of a notebook or workflow, or
may be static images captured for use in documentation.

**lectures**/

Jupyter/iPython notebooks used for course lectures, video lectures and in
general the main resource with the course textbook and assignments for  
learning the course concepts.

**scripts**/

Separate executable scripts used to set up project aspects, load data for
the project, etc.  Bootstrap scripts are used by the Vagrant box
provisioning process to set up the virtual vagrant box for use by the
project.

**src**/

Project package(s) for this class.  Functions and classes that are of
general use in more than one notebook are pulled out as functions
(into the `custom_funcs.py` file), or separate functions and classes.
The `ml_python_class` module can be installed in the normal Python way on the system using
the `setup.py` file if needed, or it can be dynamically added to the
python path using for example:

```python
import sys
sys.path.append('../src')

from ml_python_class.custom_funcs import version_information
version_information()
```

**README.md, LICENSE**

Top level markdown files holding general project information.  
README.md markdown files may also be given in subdirectories for
further information about aspects of the project.

**Vagrantfile**

A standard vagrant init file.  Contains the configuration and
specifications to download and provision a vagrant box running
Anaconda Python3 and a JupyterHub/JupyterLab server.


#### History

Material developed for [Texas A&M University -
Commerce](http://tamuc.edu) course CSci 574: Introduction to Machine
Learning and Data Analysis.  These materials were developed in the
Fall of 2013 semester.  The original iPython notebooks were created in
2012 by Hannes Schulz, Andreas Mueller and Nenard Birešev at the
University of Bonn
[original github repo](https://github.com/amueller/tutorial_ml_gkbionics).
I have taken the original material and expanded it for our course.

The materials have been updated for the Fall of 2015 semester.  Materials
from Dr. Ng Coursera [machine learning](https://www.coursera.org/learn/machine-learning/home/welcome) course were used extensively for the updates and assignments.

The materials have been updated in Fall 2019 and Fall 2020.  We are now using
the Geron textbook *Hands-On Machine Learning with SciKit-Learn and Tensorflow*
second edition as our primary textbook.  Materials in the course use the
textbook, Dr. Ng course videos and our own videos.

In Fall 2024 we are moving to using Docker containers for the official
Python scientific library to be used for class lectures and assignments.
Instructions have been modified to install VSCode DevContainers and
run examples and perform assignments from inside of development containers.

#### Contact

`derek dot harter @ tamuc dot edu`
