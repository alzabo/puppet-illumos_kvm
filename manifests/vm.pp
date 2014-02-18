define illumos_kvm::vm (
  $manifest_dir = '/lib/svc/manifest/site',
  $cpu          = 'host',
  $vnc_host     = $::illumos_kvm::vnchost,
  $vnc_port     = undef,
  $vga          = 'std',
  $boot         = undef,
  $smp          = 1,
  $enable       = true,
  $memory_size,
  $drive,
  $net,
) {
  file { "${manifest_dir}/kvm-${title}.xml":
    ensure  => file,
    content => template('illumos_kvm/manifest.erb'),
  } ~>
  exec { "manifest_import_${title}":
    path        => '/usr/sbin',
    command     => 'svcadm restart manifest-import',
    refreshonly => true,
  } ~>
  service { "kvm/${title}":
    enable    => $enable,
    manifest  => "${manifest_dir}/kvm-${title}.xml",
  }
}
