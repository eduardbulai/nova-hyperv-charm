#
# Copyright 2014 Cloudbase Solutions SRL
#

# we want to exit on error
# $ErrorActionPreference = "Stop"

Import-Module -DisableNameChecking CharmHelpers

Juju-ConfigureVMSwitch
$nova_restart = Generate-Config -ServiceName "nova"
$neutron_restart = Generate-Config -ServiceName "neutron"

if ($nova_restart){
    Restart-Service $JujuCharmServices["nova"]["service"]
}

if ($neutron_restart){
    Restart-Service $JujuCharmServices["neutron"]["service"]
}