#!/bin/bash

yq-list-all-keys() {
	yq '.myapps[] | .[] | .[] | keys' packages.yaml | sort | sed 's/,$//g' | uniq
}

yq-list-all-categories() {
	yq '.myapps[] | .[] | .[] | .category' packages.yaml | sort | uniq
}

yq-list-all-packages() {
	yq ".myapps[] | .[] | .[] | .name" packages.yaml | sort
}

yq-export-packages-by-package-manager() {
	echo "apt:"
	yq ".myapps[].apt[].name" packages.yaml
}

yq-filter-by-package-manager-name() {
	yq -j ".myapps[] | .$1" packages.yaml
}

yq-filter-by-name() {
	yq -j ".myapps[] | .[] | .[] | select(.name == \"$1\")" packages.yaml
}

yq-filter-by-category() {
	# TODO: show package manager as well
	# TODO: sort by name at the end
	yq -j ".myapps[] | .[] | .[] | select(.category == \"$1\")" packages.yaml
}

