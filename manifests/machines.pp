class illumos_kvm::machines {
  create_resources('illumos_kvm::vm', $::illumos_kvm::machines)
}
