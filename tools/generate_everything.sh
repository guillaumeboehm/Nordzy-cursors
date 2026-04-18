#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"

rm -rf "${script_dir}/../archives/*"

pushd "${script_dir}" >/dev/null || exit 1

bash batch_theme_rendering.sh
bash generate_CursorCreate.sh
bash generate_hyprcursors.sh

popd >/dev/null || exit 1

cat "${script_dir}/../archives/checksums"
