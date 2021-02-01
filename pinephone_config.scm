;Include the channel config here?
(use-modules (guix packages) (guix download) (guix licenses) (guix gexp) (guix git-download) (guix build-system trivial) (gnu) (gnu system nss) (gnu packages) (nongnu packages linux) (srfi srfi-1))
(use-service-modules audio networking ssh sound)
(use-package-modules admin audio bash bootloaders certs curl shells shellutils wget linux)

(operating-system
 (kernel linux)
  (firmware (list linux-firmware)) ;; ToDo: clean out unused firmware
  (host-name "pinephone")
  (timezone "Europe/Berlin")
  (locale "de_DE.utf8")
  (keyboard-layout (keyboard-layout "de" "altgr-intl")) 

  (bootloader (bootloader-configuration
               (bootloader  u-boot-pine64-lts) ;maybe replace this with xnux.eu/p-boot to make booting into a specific generation easy. 
               (tartget "/dev/mmcblk0p1")))
  (file-systems (append (file-system (device "/dev/mmcblk0p2" ) (mount-point "/") (type "ext4")) %base-file-systems))

  (users (cons (user-account
		(name "alice")
                (comment "Bob's sister")
                (group "users")
                (supplementary-groups '("wheel" "audio" "video"))
                (home-directory "/home/alice")
                (shell (file-append bash "/bin/bash")))
               %base-user-accounts))
  ;(issue "")

  (packages (append (list ;alsa-lib alsa-utils
			  curl lynx wget nss-certs) %base-packages))
  (services (append (list (service dhcp-client-service-type)
			  (service wpa-supplicant-service-type (wpa-supplicant-configuration
								(config-file "/path/to/wpa_supplicant.conf")
								(interface "wlp4s0")))
			  (dropbear-service (dropbear-configuration
					     (port-number 22)
					     (root-login? #f)
					     (password-authentication? #f)))
			  (bluetooth-service #:auto-enable? #f)
  ;Maybe remove pulse and use pure alsa instead? Given that the platform is known and wont change
  ;creating a fully configurated asoundrc once for all time might be a wise choice.
			  ) %base-services)))
