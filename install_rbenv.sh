#!/bin/bash

function install_rbenv {
  
sudo -u $SUDO_USER bash <<'EOF'

	if [ ! -d ~/.rbenv ]; then

		cd ~
		git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

		#TODO: Dont keep adding these if they exist!
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
		echo 'eval "$(rbenv init -)"' >> ~/.bashrc

		if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
			git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
			echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
		fi

		# For non desktop envs
		# replace all of the above ~/.bashrc with ~/.bash_profile

	fi

EOF
  
}

