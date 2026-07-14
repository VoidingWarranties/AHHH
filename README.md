# <ins>A</ins>pple <ins>H</ins>ardened <ins>H</ins>ermetic <ins>H</ins>arness

My configurations and scripts for running agents in both persistent and
ephemeral isolated environments using Apple's Container tool.

## Goals

- [x] Isolate environments from the host.
- [x] Isolate environments from other environments.
- [x] Allow internet access from environments.
- [x] Lock down every possible surface area.
- [x] Base image is as minimal as possible.
- [x] Ephemeral environments.
- [ ] Persistent environments.

## Future

### P0: Good default ergonomics
- [x] Default Claude settings
  - [x] Authenticated
  - [x] Setup (skips onboarding)
  - [x] Trusts the current directory
  - [x] Skips the --dangerously-skip-permissions check
- [x] Set GIT_{AUTHOR,COMMITTER}_{NAME,EMAIL} based on the host's git config.
- [x] Error if the current directory is not a git repo.
- [x] Provide Nix to agents for isolated package management.
- [x] Global CLAUDE.md describing the environment.

### P1: Customized ergonomics
- [x] Copy the host's user-level agent configs into containers.
  - [x] env vars, e.g. `ANTHROPIC_MODEL`, `CLAUDE_CODE_SUBAGENT_MODEL`, and
        `CLAUDE_CODE_EFFORT_LEVEL`
  - [x] Host's global CLAUDE.md
- [x] Support for other harnesses.
- [ ] Assign a container its name, description, and color for differentiation

### P2
- [ ] Codex login persist
- [ ] Persistent nix store that's shared by all environments.
- [ ] Automate my git worktree workflow.
- [ ] Fork a container to copy the agent transcript and current container
      state. between environments.

### P3
- [ ] Secure storage of agent authentication OAuth token on host machine
      (i.e. integrate as a Secure Enclave backed Keychain entry)
- [ ] Auth proxy so no credentials are exposed to containers.
  - [ ] LLM creds.
  - [ ] Version control creds. By default don't give the environment VCS creds
        (or an opaque pointer to VCS creds).
- [ ] Add config to allow auto updating image every x days (if not using NixOS,
      not sure this is compatible with NixOS).
