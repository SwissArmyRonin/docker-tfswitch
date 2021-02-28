FROM alpine:3 as base

RUN apk add --no-cache curl bash && \
    mkdir /terraform && \
    curl -sL https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash -s -- -b /terraform

# --------------------------------------------------------------------------------
FROM alpine:3

COPY --from=base /terraform/ /terraform/
ENV TERRAFORM_HOME=/terraform
ENV PATH="${PATH}:/terraform"
RUN apk add --no-cache libc6-compat
