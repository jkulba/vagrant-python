# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ubunty"

  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx"

  config.vm.provision "provisioner1", type: "shell", path: "provision.sh"
  config.vm.provision :shell, :inline => "touch /var/vagrant_provision_dependencies"

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
      git clone https://github.com/pyenv/pyenv.git /home/vagrant/.pyenv
      echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/vagrant/.bashrc
      echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/vagrant/.bashrc
      echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> /home/vagrant/.bashrc
  SHELL

  config.vm.provision "shell", privileged: false, inline: "/home/vagrant/.pyenv/bin/pyenv versions"
  config.vm.provision "shell", privileged: false, inline: "/home/vagrant/.pyenv/bin/pyenv install 2.7.14"
  config.vm.provision "shell", privileged: false, inline: "/home/vagrant/.pyenv/bin/pyenv local 2.7.14"
  config.vm.provision "shell", privileged: false, inline: "/home/vagrant/.pyenv/bin/pyenv versions"
end
