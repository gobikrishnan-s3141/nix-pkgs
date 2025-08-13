#!/usr/bin/env python3

from pathlib import Path
from setuptools import setup, find_packages

root_dir = Path(__file__).parent.resolve()
root_uri = root_dir.as_uri()

with open('README.md', 'r', encoding='utf-8) as f:
    long_description = f.read()

setup(
    name='scanpy',
    version='1.11.4',
    author='Gobikrishnan Subramaniam',
    author_email='g.subramaniam@qub.ac.uk',
    description='Single-Cell Analysis in Python',
    long_description=long_description,
    url='https://github.com/scverse/scanpy',
    packages=find_packages(),
    scripts=['scanpy'],
    install_requires=[dependencies = [
    'anndata>=0.9.2',
    'numpy>=1.25.2',
    'fast-array-utils[accel,sparse]>=1.2.1',
    'matplotlib>=3.7.5',
    'pandas >=2.0.3',
    'scipy>=1.11.1',
    'seaborn>=0.13.2',
    'h5py>=3.8.0',
    'tqdm',
    'scikit-learn>=1.1.3',
    'statsmodels>=0.14.5',
    'patsy!=1.0.0',                               # https://github.com/pydata/patsy/issues/215
    'networkx>=2.8.8',
    'natsort',
    'joblib',
    'numba>=0.58.1',
    'umap-learn>=0.5.7',
    'pynndescent>=0.5.13',
    'packaging>=21.3',
    'session-info2',
    'legacy-api-wrap>=1.4.1',                     # for positional API deprecations
    'typing-extensions; python_version < '3.13''
]

