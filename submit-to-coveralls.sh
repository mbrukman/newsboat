#!/bin/sh

${HOME}/.cargo/bin/grcov \
    . \
    --service-name "travis-ci" \
    --service-number "${TRAVIS_BUILD_ID}" \
    --service-job-number "${TRAVIS_JOB_ID}" \
    --token "${COVERALLS_REPO_TOKEN}" \
    --commit-sha "${TRAVIS_COMMIT}" \
    --vcs-branch "${TRAVIS_BRANCH}" \
    --ignore-not-existing \
    --ignore='/*' \
    --ignore='3rd-party/*' \
    --ignore='doc/*' \
    --ignore='test/*' \
    --ignore='newsboat.cpp' \
    --ignore='podboat.cpp' \
    -t coveralls \
    -o coveralls.json

curl \
    --form "json_file=@coveralls.json" \
    --include \
    https://coveralls.io/api/v1/jobs

