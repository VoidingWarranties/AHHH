# <ins>A</ins>pple <ins>H</ins>ardened <ins>H</ins>ermetic <ins>H</ins>arness

My configurations and scripts for running agents in both persistent and
ephemeral isolated environments using Apple's Container tool.

## Goals

- Isolate environments from the host.
- Isolate environments from other environments.
- Allow internet access from environments.
- Lock down every possible surface area.
- Base image is as minimal as possible.

## Future

### P0: Good default ergonomics
- Set GIT_AUTHOR_{NAME,EMAIL} based on global config.
- Configure agent authentication.
- Copy the host's user-level agent configs into containers.
- Share read/write access to the current directory if it is a git repo.

### P1
- Assign a container its name, description, and color for differentiation
- NixOS as a base.

### P2
- Automate my git worktree workflow.
- Auth proxy so no credentials are exposed to containers. For both LLM and
  version control APIs.
- Fork a container to copy the agent transcript and current container state.
  between environments.
