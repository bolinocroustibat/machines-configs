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
