# <ins>A</ins>pple <ins>H</ins>ardened <ins>H</ins>ermetic <ins>H</ins>arness

My configurations and scripts for running agents in both persistent and
ephemeral isolated environments using Apple's Container tool.

## Goals

- Isolate environments from the host.
- Isolate environments from other environments.
- Lock down every possible surface area.
- Base image is as minimal as possible.

## Future

- Good default ergonomics such as:
  - Set GIT_AUTHOR_{NAME,EMAIL} based on global config.
  - Configure agent authentication.
  - Copy the host's user-level agent configs into containers.
- NixOS as a base.
- Auth proxy so no credentials are exposed to containers.
- Fork a container to copy the agent transcript.
- Assign a container its name, description, and color for differentiation
  between environments.
