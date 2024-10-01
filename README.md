# Machines configs and dotfiles

Ansible playbooks for setting up local development and remote machines.

## Dependencies

- Python >= 3.10 (automatically installed via [uv](https://docs.astral.sh/uv/))
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (automatically installed via [uv](https://docs.astral.sh/uv/))
- [git-crypt](https://www.agwa.name/projects/git-crypt/)

## Installation

Use [uv](https://docs.astral.sh/uv/) to install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) from the locked requirements:

```bash
cd dotfiles
uv sync
```

*You might need to install the [homebrew Ansible module](https://docs.ansible.com/ansible/latest/collections/community/general/homebrew_module.html) only if you use ansible-core instead of ansible:*
```bash
uv run ansible-galaxy collection install community.general
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

**Notes:**
- No need to add `-i inventory.yaml` as it is already configured in `ansible.cfg`.
- No need to add `--diff` as it is already configured in `ansible.cfg`.

## Encrypt and decrypt secrets

### git-crypt

This repo uses exclusively [git-crypt](https://www.agwa.name/projects/git-crypt/) to encrypt and decrypt secrets.

Encrypted files are defined in `.gitattributes` files.

To get the git-crypt status:
```bash
git-crypt status
```

### ansible-vault

As said, this repo uses exclusively [git-crypt](https://www.agwa.name/projects/git-crypt/) to encrypt and decrypt secrets. However, we could also use [ansible-vault](https://docs.astral.sh/ansible-vault/) to encrypt and decrypt secrets:

Decrypt secret files with:
```bash
uvx ansible-vault decrypt roles/myrole/templates/secret.j2 roles/myrole2/templates/*
```

Encrypt secret files with:
```bash
uvx ansible-vault encrypt roles/myrole/templates/secret.j2 roles/myrole2/templates/*
```

## Lint

Lint Ansible file with [ansible-lint](https://docs.astral.sh/ansible-lint/):
```bash
uvx ansible-lint playbooks/myplaybook.yaml
```

Lint and format Python code with [Ruff](https://docs.astral.sh/ruff/):
```bash
uvx ruff check && uvx ruff format
```

## Pre-commit

This repository uses [pre-commit](https://pre-commit.com/) to lint and format code before committing.
Please install pre-commit hooks with the following command:
```bash
uvx pre-commit install
```

## Precedence of Ansible variables

Ansible variables have the following precedence:

1. Vars set on the command line, e.g.: `-e foo=set_on_cmd_line`
2. Vars set in the vars_files: block in the play
3. Vars set in the vars: block in the play
4. Vars set in `host_vars/`
5. Vars set in `group_vars/`
6. Role default vars e.g. `roles/.../defaults/main.yml`
