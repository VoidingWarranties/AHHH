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
- [ ] Set GIT_AUTHOR_{NAME,EMAIL} based on global config.
- [ ] Warn or error if the current directory is not a git repo.

### P1: Customized ergonomics
- [ ] Copy the host's user-level agent configs into containers.
- [ ] Assign a container its name, description, and color for differentiation
- [ ] NixOS as a base.

### P2
- [ ] Persistent nix store that's shared by all environments.
- [ ] Auth proxy so no credentials are exposed to containers.
  - [ ] LLM creds.
  - [ ] Version control creds. By default don't give the environment VCS creds
        (or an opaque pointer to VCS creds).
- [ ] Automate my git worktree workflow.
- [ ] Fork a container to copy the agent transcript and current container
      state. between environments.
- [ ] Add config to allow auto updating image every x days (if not using NixOS,
      not sure this is compatible with NixOS).

### P3
- [ ] Support for other harnesses.
- [ ] Secure storage of agent authentication OAuth token on host machine
      (i.e. integrate as a Secure Enclave backed Keychain entry)
