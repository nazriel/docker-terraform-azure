FROM registry.gitlab.com/gitlab-org/terraform-images/stable:latest as gitlab-bin

FROM hashicorp/terraform:latest

RUN \
  apk update && \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
  pip install azure-cli && \
  apk del --purge build

COPY --from=gitlab-bin /usr/bin/gitlab-terraform /usr/bin/gitlab-terraform
RUN chmod +x /usr/bin/gitlab-terraform

ENTRYPOINT []
