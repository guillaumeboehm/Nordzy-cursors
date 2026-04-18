#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"

pushd "${script_dir}" >/dev/null || exit 1

# cleanup local tags once to make sure we're working with remote tags
echo "Fetching tags and pruning local references..."
git fetch --tags --prune --prune-tags
head_tags_list="$(git tag --contain="$(git rev-parse HEAD)" | head -c -1 | tr '\n' ' ')"

if [[ -z "$head_tags_list" ]]; then
    echo "No tags found for the current commit."
    exit 0
fi

version_tags=""
for tag in ${head_tags_list}; do
    if [[ $tag =~ ^v[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        version_tags="${version_tags} ${tag}"
    fi
done

if [[ -z "$version_tags" ]]; then
    echo "No version tags found for the current commit."
    exit 0
fi

# If more than 2 tags, error exit
count_tags=$(echo "${version_tags}" | wc -w)
if [ "${count_tags}" -ge 2 ]; then
    echo "More than 2 version tags found: ${version_tags}"
    exit 1
fi

selected_tag=$(echo "${version_tags}" | xargs)
echo "Proceeding with version: ${selected_tag}"

tar_archive_names="Nordzy-hyprcursors Nordzy-hyprcursors-white Nordzy-hyprcursors-lefthand Nordzy-hyprcursors-white-lefthand Nordzy-cursors Nordzy-cursors-white Nordzy-cursors-lefthand Nordzy-cursors-white-lefthand"
zip_archive_names="Nordzy-cursors_windows Nordzy-cursors-white_windows Nordzy-cursors-lefthand_windows Nordzy-cursors-white-lefthand_windows Nordzy-cursors_macos Nordzy-cursors-white_macos Nordzy-cursors-lefthand_macos Nordzy-cursors-white-lefthand_macos"

# Check that all the archives have been generated
archives_dir="${script_dir}/../archives"
release_assets=()
for name in ${tar_archive_names}; do
    release_assets+=("${archives_dir}/${name}.tar.gz")
done
for name in ${zip_archive_names}; do
    release_assets+=("${archives_dir}/${name}.zip")
done

missing_archives=()
for asset in "${release_assets[@]}"; do
    if [[ ! -f "${asset}" ]]; then
        missing_archives+=("$(basename "${asset}")")
    fi
done

if [[ ${#missing_archives[@]} -gt 0 ]]; then
    echo "Missing archives: ${missing_archives[*]}"
    exit 1
fi

echo "All archives found. Creating GitLab release..."
read -r -p "Are you sure you want to release ${selected_tag}? [y/N]: " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Release cancelled."
    exit 0
fi
echo "Releaing ${selected_tag}..."
glab release create "${selected_tag}" "${release_assets[@]}" --name "Nordzy ${selected_tag#v}"

popd >/dev/null || exit 1 # "${script_dir}"
