# @summary Entry point for Sicura compliance management
#
# @param classes
#   Classes to include for compliance management.  Note that any element
#   prefaced with `--` will be removed from the `Array`.
# @param simp_classes
#   Classes to include for compliance management.  For compatibility with the
#   SIMP framework, this defaults to the value of `simp::classes`.  Note that
#   any element prefaced with `--` will be removed from the `Array`.
#
# @example
#   include sicura
class sicura (
  Array[String[1]] $classes      = [],
  Array[String[1]] $simp_classes = simplib::lookup(
    'simp::classes',
    {
      'value_type'    => Array[String[1]],
      'merge'         => 'unique',
      'default_value' => [],
    },
  ),
) {
  include simplib::knockout($classes + $simp_classes)
}
