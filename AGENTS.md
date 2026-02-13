# Agent Rules

Rules for AI agents (Cursor, Claude, etc.) working on this Ansible project.

## Code Language
- **All code and documentation must be written in English**: task names, comments, variable names, file names, README, etc.
- Only conversations with LLMs can be in another language.

## YAML Format
- **Use `.yaml` extension** for YAML files, not `.yml`:
  - ✅ `main.yaml`, `install.yaml` (correct)
  - ❌ `main.yml`, `install.yml` (incorrect)
- **Do not use `---` document separator** at the beginning of YAML files:
  - ✅ Start directly with content (correct)
  - ❌ `---` at the beginning (incorrect)
- The `---` separator is only needed when a file contains multiple YAML documents, which is not the case in this project.
- **Use boolean values `true`/`false`** instead of `yes`/`no`:
  - ✅ `recurse: false`, `enabled: true` (correct)
  - ❌ `recurse: no`, `enabled: yes` (incorrect)

## Variable Naming Convention
- **Use double underscore (`__`) as separator** between role name and variable name:
  - ✅ `gdrive__user`, `gdrive__local_dir`, `transmission__domain` (correct)
  - ❌ `gdrive_user`, `gdrive.local_dir` (incorrect)

- This convention prevents variable name collisions between roles and makes it clear which role owns each variable.
- Format: `{role_name}__{variable_name}` (lowercase with underscores)

## File Permissions Format
- **Always use explicit permission format** with comments, not numeric format:
  - ✅ `mode: u=rwx,g=rx,o=rx # 755` (correct)
  - ❌ `mode: "0755"` (incorrect)
  - ❌ `mode: 755` (incorrect)

- Common permission formats:
  - `mode: u=rwx,g=rx,o=rx # 755` - directory with read/execute for group and others
  - `mode: u=rwx,g=,o= # 700` - private directory (only owner)
  - `mode: u=rw,g=r,o=r # 644` - readable file
  - `mode: u=rw,g=,o= # 600` - private file (only owner)
  - `mode: u=rwx,g=rx,o= # 750` - executable script, readable by group

## Tools and Commands
- **Always use `uv` for Python commands**: use `uv run ...` instead of `python3 ...` or `python ...`
  - ✅ `uv run ansible-lint playbooks/install-pi.yaml` (correct)
  - ❌ `python3 -m ansible_lint playbooks/install-pi.yaml` (incorrect)
- **Always use `uv run` for Ansible commands**: use `uv run ansible-playbook ...` instead of `ansible-playbook ...`
  - ✅ `uv run ansible-playbook playbooks/install-pi.yaml --limit pi-bolino` (correct)
  - ❌ `ansible-playbook playbooks/install-pi.yaml --limit pi-bolino` (incorrect)
- **Check linting after modifications**: run `uv run ansible-lint <file_or_directory>` to verify code quality

## Commit Naming Convention
- **Use conventional commits in English**: commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org/) format.
- **Format**: `<type>[optional scope]: <description>` (e.g. `feat(role): add zsh config`, `fix(playbook): correct variable name`).
- **Types**: `feat` (new feature), `fix` (bug fix), `docs` (documentation), `refactor`, `chore`, `test`, etc.
- **Description**: short, imperative, in English (e.g. "add role" not "added role").
- **Optional**: append a body and/or footer for details; keep the subject line under about 72 characters.

## Host-Specific and Personal Data
- **Never put host-specific or personal config in a file that is committed and not encrypted in `.gitattributes`**: no usernames, hostnames, paths like `/home/foo` or `/Users/foo`, IPs, or other machine/user-specific examples in such files (comments, docs, or code).
- Files encrypted via git-crypt (as defined in `.gitattributes`) may contain such data.
- In non-encrypted committed files, use generic placeholders or refer to variables (e.g. `user_home` from host_vars) without concrete examples that could identify a specific host or user.

## Ansible Best Practices
- Use descriptive task names in English
- Include comments explaining non-obvious logic
- Follow existing code style and structure
- Use consistent variable naming with role prefix and double underscore separator
