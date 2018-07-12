from setuptools import find_packages

setup(
    # only look in src/ for __init__.py files
    packages=find_packages('src'),
    package_dir={'':'src'},
)
