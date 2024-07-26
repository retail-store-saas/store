#!/bin/bash

set -e

usage() {
    echo "snyk-monitor-store-services.sh --dir=<root-directory> --org=<org-id>"
}

for i in "$@"; do
    case $i in
    --dir=*)
        ROOT_DIR="${i#*=}"
        shift
        ;;
    --org=*)
        ORG_ID="${i#*=}"
        shift
        ;;
    *)
        usage
        exit 1
        ;;
    esac
done

if [ -z "${ROOT_DIR}" ] || [ -z "${ORG_ID}" ]; then
    usage
    exit 1
fi

CURRENT_DIR="${PWD}"

ENABLED_PROJECTS=(
    "frontend"
    "ad"
    "currency"
    "checkout"
    "email"
    "payment"
    "productcatalog"
    "recommendation"
    "shipping"
)

for project in ${ENABLED_PROJECTS[@]}; do
    echo "[*] Project $project"
    cd ${ROOT_DIR}/${project}    
    snyk test --org=${ORG_ID} || true
    # snyk test --org=${ORG_ID} || true
    cd ${CURRENT_DIR}
done
