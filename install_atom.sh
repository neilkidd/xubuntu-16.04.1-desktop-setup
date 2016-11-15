#!/bin/bash

function install_atom {

  REPO_CHECK=$(dpkg-query -W --showformat='${Status}\n' atom | grep "install ok installed")
  if [ "" == "$REPO_CHECK" ]; then
    add-apt-repository ppa:webupd8team/atom -y
    apt_quiet_update
    apt_install atom
  fi

	sudo -u $SUDO_USER bash <<'EOF'

		declare -a ATOM_PACKAGES=(
      minimap
			terminal-plus
			npm-install
			git-plus
			cucumber
			linter
			linter-ruby
			linter-rubocop
			ruby-test
	)

	for element in ${ATOM_PACKAGES[@]}; do
		PACKAGE_CHECK=$(apm ls --installed | grep ${element})
		if [[ "" == "$PACKAGE_CHECK" ]]; then
			apm install $element
		fi


	done

	apm upgrade --no-confirm

	unset ATOM_PACKAGES;

EOF

}
