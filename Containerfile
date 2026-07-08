FROM alpine:3
RUN apk add --no-cache ca-certificates git bash curl earlyoom
# Non-root user matching the --uid and --gid flags passed to `container run` in
# ahhh. Creating the passwd/group entry keeps tools that read $HOME / look up
# the uid happy.
RUN addgroup -g 1000 agent && adduser -D -u 1000 -G agent agent
# apk's nix is packaged for multi-user mode, which needs root. --no-scripts
# skips creating the unused nixbld users; rm the other multi-user pieces.
RUN apk add --no-cache --no-scripts nix \
  && rm /etc/profile.d/nix-remote.sh /etc/profile.d/nix-daemon.sh /usr/sbin/nix-daemon
# Replace apk's daemon-oriented config. `store = local` makes non-root nix use
# the /nix tmpfs mounted by ahhh instead of a chroot store under $HOME.
RUN printf '%s\n' \
    'experimental-features = nix-command flakes' \
    'sandbox-fallback = false' \
    'store = local' \
    > /etc/nix/nix.conf
# Signature checksum is from Anthropic's Advanced Setup guide:
# https://code.claude.com/docs/en/setup#apk
RUN wget -O /etc/apk/keys/claude-code.rsa.pub \
  https://downloads.claude.ai/keys/claude-code.rsa.pub \
  && echo "395759c1f7449ef4cdef305a42e820f3c766d6090d142634ebdb049f113168b6 /etc/apk/keys/claude-code.rsa.pub" | sha256sum -c - \
  && echo "https://downloads.claude.ai/claude-code/apk/stable" >> /etc/apk/repositories \
  && apk add --no-cache claude-code
# Be extra cautious and error if any setuid binaries are found. This check must
# be the last RUN to be effective.
RUN setuidbins="$(find / -xdev -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null)"; \
  [ -z "${setuidbins-x}" ] || { printf 'ERROR: setuid binaries present:\n%s\n' "$setuidbins" >&2; exit 1; }
COPY --chmod=0755 entrypoint /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY configs/ /usr/share/ahhh/
ENV CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
ENV SHELL=/bin/bash
USER agent
WORKDIR /home/agent
