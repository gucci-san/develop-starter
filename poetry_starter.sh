#!/bin/sh

USE_PYTHON_VERSION=3.9

# 1. make directories --
mkdir notebooks
mkdir outputs
mkdir data
mkdir tests
mkdir src
mkdir _drafts

# 2. .gitignore --
cat <<EOF > .gitignore
# local data --
*.csv
test_data

# drafts --
_drafts

# envs --
.venv
poetry.lock
EOF

# 3. ./notebooks/notebook_cfg.py --
cat <<EOF > ./notebooks/notebook_cfg.py
import os, sys
sys.path.append(os.path.join(os.path.dirname("cfg.py"), "../src"))
EOF

# 3. poetry 
pyenv local $USE_PYTHON_VERSION

# 4. virtual-env
/home/marimo/.pyenv/shims/python -m venv .venv

# 5. pyproject.toml
cat <<EOF > pyproject.toml
[tool.poetry]
name = "myenvs"
version = "0.1.0"
description = ""
authors = ["guccisan <yamskymtb0903@gmail.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^$USE_PYTHON_VERSION"
pandas = "^1.5.2"
jupyter = "^1.0.0"
matplotlib = "^3.6.2"
seaborn = "^0.12.2"
plotly = "^5.11.0"
selenium = "^4.7.2"
scikit-learn = "^1.2.0"


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
EOF

# 6. update venv
poetry update