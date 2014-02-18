# == Class: illumos_kvm
#
# Full description of class kvm here.
#
# === Examples
#
#   class { 'illumos_kvm':
#     package => [
#       'driver/virtualization/kvm'
#       'system/kvm'
#     ]
#     machines => {
#       'foo' => {
#         'vga'         => 'std',
#         'memory_size' => '256',
#         'vnc_port'    => '3',
#         'smp'         => '1',
#         'drive'       => {
#           'file'  => '/dev/zvol/rdsk/rpool/vm/images/freebsd9.1-root',
#           'if'    => 'ide',
#           'cache' => 'none',
#         },
#         'net'         => {
#           'vlan'    => '0',
#           'macaddr' => '2:8:20:1e:c0:88',
#           'model'   => 'e1000',
#           'ifname'  => 'vnic2',
#         },
#       },
#     },
#   }
#
# === Authors
#
# ryan.cunningham.xyzzy@gmail.com
#
class illumos_kvm (
  $package,
  $machines,
  $vnchost = '0.0.0.0',
) {
  include 'illumos_kvm::package'
  include 'illumos_kvm::machines'
}
