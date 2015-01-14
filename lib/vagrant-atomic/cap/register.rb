module VagrantPlugins
  module GuestAtomic
    module Cap
      class Register
        def self.register(machine)
          username = machine.config.registration.subscriber_username
          password = machine.config.registration.subscriber_password	       
          command = "subscription-manager register --username=#{username} --password=#{password} --auto-attach"
          machine.communicate.execute("cmd=$(#{command}); if [ \"$?\" != \"0\" ]; then echo $cmd | grep 'This system is already registered' || (echo $cmd 1>&2 && exit 1) ; fi", sudo: true)
        end
      end
    end
  end
end
