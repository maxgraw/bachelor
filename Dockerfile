FROM node:20-slim AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS builder
WORKDIR /app

RUN pnpm install turbo --global
COPY . .
RUN turbo prune example --docker

FROM base AS installer
WORKDIR /app

COPY .gitignore .gitignore
COPY --from=builder /app/out/json/ .
COPY --from=builder /app/out/pnpm-lock.yaml ./pnpm-lock.yaml
RUN pnpm install

COPY --from=builder /app/out/full/ .
RUN pnpm run build --filter=example

FROM base AS runner
WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 sveltekit
USER sveltekit

COPY --from=installer /app/apps/example/build build/
COPY --from=installer /app/node_modules node_modules/

COPY ./apps/example/package.json .
EXPOSE 3002
ENV NODE_ENV=production
ENV PORT=3002
CMD [ "node", "build" ]