# dotfiles

Ansible playbooks for setting up local development and remote machines.

## Dependencies

- Python >= 3.10
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Installation

Use [uv](https://docs.astral.sh/uv/) to install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

```bash
cd dotfiles
uv sync
```

## Usage

```bash
uv run ansible-playbook playbooks/main.yml
```

## Lint

Lint Ansible Playbooks
```bash
uv run ansible-lint playbooks/main.yml -v --force-color
```

Lint and format Python code with [Ruff](https://docs.astral.sh/ruff/)
```bash
uv run ruff check && uv run ruff format
```

# Pre-commit

This repository uses [pre-commit](https://pre-commit.com/) to lint and format code before committing.
Please install pre-commit hooks with the following command:

```bash
uv run pre-commit install
```
