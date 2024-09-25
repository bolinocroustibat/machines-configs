# dotfiles

Ansible playbooks for setting up local development and remote machines.

## Dependencies

- Python >= 3.10 (automatically installed via [uv](https://docs.astral.sh/uv/))
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (automatically installed via [uv](https://docs.astral.sh/uv/))

## Installation

Use [uv](https://docs.astral.sh/uv/) to install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) from the locked requirements:

```bash
cd dotfiles
uv sync
```

## Usage

Dry run a playbook:
```bash
uv run ansible-playbook playbooks/install-local-macos.yaml --check
```

Run a playbook:
```bash
uv run ansible-playbook playbooks/install-local-macos.yaml
```

## Lint

Lint Ansible playbooks with [ansible-lint](https://docs.astral.sh/ansible-lint/):
```bash
uv run ansible-lint playbooks/main.yml -v --force-color
```

Lint and format Python code with [Ruff](https://docs.astral.sh/ruff/):
```bash
uv run ruff check && uv run ruff format
```

## Pre-commit

This repository uses [pre-commit](https://pre-commit.com/) to lint and format code before committing.
Please install pre-commit hooks with the following command:
```bash
uv run pre-commit install
```
