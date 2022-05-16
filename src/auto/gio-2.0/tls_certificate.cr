require "../g_object-2.0/object"

module Gio
  # A certificate used for TLS authentication and encryption.
  # This can represent either a certificate only (eg, the certificate
  # received by a client from a server), or the combination of
  # a certificate and a private key (which is needed when acting as a
  # #GTlsServerConnection).
  @[GObject::GeneratedWrapper]
  class TlsCertificate < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TlsCertificateClass), class_init,
        sizeof(LibGio::TlsCertificate), instance_init, 0)
    end

    GICrystal.define_new_method(TlsCertificate, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TlsCertificate`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, certificate : Enumerable(UInt8)? = nil, certificate_pem : ::String? = nil, dns_names : Enumerable(Pointer(Void))? = nil, ip_addresses : Enumerable(Pointer(Void))? = nil, issuer : Gio::TlsCertificate? = nil, issuer_name : ::String? = nil, not_valid_after : GLib::DateTime? = nil, not_valid_before : GLib::DateTime? = nil, password : ::String? = nil, pkcs11_uri : ::String? = nil, pkcs12_data : Enumerable(UInt8)? = nil, private_key : Enumerable(UInt8)? = nil, private_key_pem : ::String? = nil, private_key_pkcs11_uri : ::String? = nil, subject_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[15]
      _values = StaticArray(LibGObject::Value, 15).new(LibGObject::Value.new)
      _n = 0

      if !certificate.nil?
        (_names.to_unsafe + _n).value = "certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate)
        _n += 1
      end
      if !certificate_pem.nil?
        (_names.to_unsafe + _n).value = "certificate-pem".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate_pem)
        _n += 1
      end
      if !dns_names.nil?
        (_names.to_unsafe + _n).value = "dns-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, dns_names)
        _n += 1
      end
      if !ip_addresses.nil?
        (_names.to_unsafe + _n).value = "ip-addresses".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ip_addresses)
        _n += 1
      end
      if !issuer.nil?
        (_names.to_unsafe + _n).value = "issuer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, issuer)
        _n += 1
      end
      if !issuer_name.nil?
        (_names.to_unsafe + _n).value = "issuer-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, issuer_name)
        _n += 1
      end
      if !not_valid_after.nil?
        (_names.to_unsafe + _n).value = "not-valid-after".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, not_valid_after)
        _n += 1
      end
      if !not_valid_before.nil?
        (_names.to_unsafe + _n).value = "not-valid-before".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, not_valid_before)
        _n += 1
      end
      if !password.nil?
        (_names.to_unsafe + _n).value = "password".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password)
        _n += 1
      end
      if !pkcs11_uri.nil?
        (_names.to_unsafe + _n).value = "pkcs11-uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pkcs11_uri)
        _n += 1
      end
      if !pkcs12_data.nil?
        (_names.to_unsafe + _n).value = "pkcs12-data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pkcs12_data)
        _n += 1
      end
      if !private_key.nil?
        (_names.to_unsafe + _n).value = "private-key".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key)
        _n += 1
      end
      if !private_key_pem.nil?
        (_names.to_unsafe + _n).value = "private-key-pem".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key_pem)
        _n += 1
      end
      if !private_key_pkcs11_uri.nil?
        (_names.to_unsafe + _n).value = "private-key-pkcs11-uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key_pkcs11_uri)
        _n += 1
      end
      if !subject_name.nil?
        (_names.to_unsafe + _n).value = "subject-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subject_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TlsCertificate.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_certificate_get_type
    end

    def certificate=(value : Enumerable(UInt8)) : Enumerable(UInt8)
      # handle array

      LibGObject.g_object_set(self, "certificate", unsafe_value, Pointer(Void).null)
      value
    end

    def certificate : Enumerable(UInt8)
      # Returns: None

      value = uninitialized Pointer(UInt8)
      LibGObject.g_object_get(self, "certificate", pointerof(value), Pointer(Void).null)
      value
    end

    def certificate_pem=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "certificate-pem", unsafe_value, Pointer(Void).null)
      value
    end

    def certificate_pem : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "certificate-pem", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def dns_names : Enumerable(Pointer(Void))
      # Returns: Container

      value = uninitialized Pointer(Pointer(Void))
      LibGObject.g_object_get(self, "dns-names", pointerof(value), Pointer(Void).null)
      value
    end

    def ip_addresses : Enumerable(Pointer(Void))
      # Returns: Container

      value = uninitialized Pointer(Pointer(Void))
      LibGObject.g_object_get(self, "ip-addresses", pointerof(value), Pointer(Void).null)
      value
    end

    def issuer=(value : Gio::TlsCertificate?) : Gio::TlsCertificate?
      unsafe_value = value

      LibGObject.g_object_set(self, "issuer", unsafe_value, Pointer(Void).null)
      value
    end

    def issuer : Gio::TlsCertificate?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "issuer", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificate.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def issuer_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "issuer-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def not_valid_after : GLib::DateTime?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "not-valid-after", pointerof(value), Pointer(Void).null)
      GLib::DateTime.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def not_valid_before : GLib::DateTime?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "not-valid-before", pointerof(value), Pointer(Void).null)
      GLib::DateTime.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def password=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "password", unsafe_value, Pointer(Void).null)
      value
    end

    def pkcs11_uri=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "pkcs11-uri", unsafe_value, Pointer(Void).null)
      value
    end

    def pkcs11_uri : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "pkcs11-uri", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def pkcs12_data=(value : Enumerable(UInt8)) : Enumerable(UInt8)
      # handle array

      LibGObject.g_object_set(self, "pkcs12-data", unsafe_value, Pointer(Void).null)
      value
    end

    def private_key=(value : Enumerable(UInt8)) : Enumerable(UInt8)
      # handle array

      LibGObject.g_object_set(self, "private-key", unsafe_value, Pointer(Void).null)
      value
    end

    def private_key : Enumerable(UInt8)
      # Returns: None

      value = uninitialized Pointer(UInt8)
      LibGObject.g_object_get(self, "private-key", pointerof(value), Pointer(Void).null)
      value
    end

    def private_key_pem=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "private-key-pem", unsafe_value, Pointer(Void).null)
      value
    end

    def private_key_pem : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "private-key-pem", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def private_key_pkcs11_uri=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "private-key-pkcs11-uri", unsafe_value, Pointer(Void).null)
      value
    end

    def private_key_pkcs11_uri : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "private-key-pkcs11-uri", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def subject_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "subject-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a #GTlsCertificate from the data in @file.
    #
    # As of 2.72, if the filename ends in `.p12` or `.pfx` the data is loaded by
    # g_tls_certificate_new_from_pkcs12() otherwise it is loaded by
    # g_tls_certificate_new_from_pem(). See those functions for
    # exact details.
    #
    # If @file cannot be read or parsed, the function will return %NULL and
    # set @error.
    def self.new_from_file(file : ::String) : self
      # g_tls_certificate_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_certificate_new_from_file(file, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GTlsCertificate from the data in @file.
    #
    # If @file cannot be read or parsed, the function will return %NULL and
    # set @error.
    #
    # Any unknown file types will error with %G_IO_ERROR_NOT_SUPPORTED.
    # Currently only `.p12` and `.pfx` files are supported.
    # See g_tls_certificate_new_from_pkcs12() for more details.
    def self.new_from_file_with_password(file : ::String, password : ::String) : self
      # g_tls_certificate_new_from_file_with_password: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_certificate_new_from_file_with_password(file, password, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GTlsCertificate from the PEM-encoded data in @cert_file
    # and @key_file. The returned certificate will be the first certificate
    # found in @cert_file. As of GLib 2.44, if @cert_file contains more
    # certificates it will try to load a certificate chain. All
    # certificates will be verified in the order found (top-level
    # certificate should be the last one in the file) and the
    # #GTlsCertificate:issuer property of each certificate will be set
    # accordingly if the verification succeeds. If any certificate in the
    # chain cannot be verified, the first certificate in the file will
    # still be returned.
    #
    # If either file cannot be read or parsed, the function will return
    # %NULL and set @error. Otherwise, this behaves like
    # g_tls_certificate_new_from_pem().
    def self.new_from_files(cert_file : ::String, key_file : ::String) : self
      # g_tls_certificate_new_from_files: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_certificate_new_from_files(cert_file, key_file, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GTlsCertificate from the PEM-encoded data in @data. If
    # @data includes both a certificate and a private key, then the
    # returned certificate will include the private key data as well. (See
    # the #GTlsCertificate:private-key-pem property for information about
    # supported formats.)
    #
    # The returned certificate will be the first certificate found in
    # @data. As of GLib 2.44, if @data contains more certificates it will
    # try to load a certificate chain. All certificates will be verified in
    # the order found (top-level certificate should be the last one in the
    # file) and the #GTlsCertificate:issuer property of each certificate
    # will be set accordingly if the verification succeeds. If any
    # certificate in the chain cannot be verified, the first certificate in
    # the file will still be returned.
    def self.new_from_pem(data : ::String, length : Int64) : self
      # g_tls_certificate_new_from_pem: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_certificate_new_from_pem(data, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GTlsCertificate from a
    # [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html) URI.
    #
    # An example @pkcs11_uri would be `pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01`
    #
    # Where the token’s layout is:
    #
    # |[
    # Object 0:
    #   URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=private%20key;type=private
    #   Type: Private key (RSA-2048)
    #   ID: 01
    #
    # Object 1:
    #   URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=Certificate%20for%20Authentication;type=cert
    #   Type: X.509 Certificate (RSA-2048)
    #   ID: 01
    # ]|
    #
    # In this case the certificate and private key would both be detected and used as expected.
    # @pkcs_uri may also just reference an X.509 certificate object and then optionally
    # @private_key_pkcs11_uri allows using a private key exposed under a different URI.
    #
    # Note that the private key is not accessed until usage and may fail or require a PIN later.
    def self.new_from_pkcs11_uris(pkcs11_uri : ::String, private_key_pkcs11_uri : ::String?) : self
      # g_tls_certificate_new_from_pkcs11_uris: (Constructor | Throws)
      # @private_key_pkcs11_uri: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      private_key_pkcs11_uri = if private_key_pkcs11_uri.nil?
                                 Pointer(LibC::Char).null
                               else
                                 private_key_pkcs11_uri.to_unsafe
                               end

      # C call
      _retval = LibGio.g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri, private_key_pkcs11_uri, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GTlsCertificate from the data in @data. It must contain
    # a certificate and matching private key.
    #
    # If extra certificates are included they will be verified as a chain
    # and the #GTlsCertificate:issuer property will be set.
    # All other data will be ignored.
    #
    # You can pass as single password for all of the data which will be
    # used both for the PKCS #12 container as well as encrypted
    # private keys. If decryption fails it will error with
    # %G_TLS_ERROR_BAD_CERTIFICATE_PASSWORD.
    #
    # This constructor requires support in the current #GTlsBackend.
    # If support is missing it will error with
    # %G_IO_ERROR_NOT_SUPPORTED.
    #
    # Other parsing failures will error with %G_TLS_ERROR_BAD_CERTIFICATE.
    def self.new_from_pkcs12(data : Enumerable(UInt8), password : ::String?) : self
      # g_tls_certificate_new_from_pkcs12: (Constructor | Throws)
      # @data: (array length=length element-type UInt8)
      # @password: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      length = data.size # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe
      # Generator::NullableArrayPlan
      password = if password.nil?
                   Pointer(LibC::Char).null
                 else
                   password.to_unsafe
                 end

      # C call
      _retval = LibGio.g_tls_certificate_new_from_pkcs12(data, length, password, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def list_new_from_file(file : ::String) : GLib::List
      # g_tls_certificate_list_new_from_file: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_certificate_list_new_from_file(file, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the value of #GTlsCertificate:dns-names.
    def dns_names : Enumerable(GLib::Bytes)?
      # g_tls_certificate_get_dns_names: (Method | Getter)
      # Returns: (transfer container) (array element-type Interface)

      # C call
      _retval = LibGio.g_tls_certificate_get_dns_names(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the value of #GTlsCertificate:ip-addresses.
    def ip_addresses : Enumerable(Gio::InetAddress)?
      # g_tls_certificate_get_ip_addresses: (Method | Getter)
      # Returns: (transfer container) (array element-type Interface)

      # C call
      _retval = LibGio.g_tls_certificate_get_ip_addresses(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the #GTlsCertificate representing @cert's issuer, if known
    def issuer : Gio::TlsCertificate?
      # g_tls_certificate_get_issuer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_certificate_get_issuer(@pointer)

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the issuer name from the certificate.
    def issuer_name : ::String?
      # g_tls_certificate_get_issuer_name: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_certificate_get_issuer_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Returns the time at which the certificate became or will become invalid.
    def not_valid_after : GLib::DateTime?
      # g_tls_certificate_get_not_valid_after: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_certificate_get_not_valid_after(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the time at which the certificate became or will become valid.
    def not_valid_before : GLib::DateTime?
      # g_tls_certificate_get_not_valid_before: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_certificate_get_not_valid_before(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the subject name from the certificate.
    def subject_name : ::String?
      # g_tls_certificate_get_subject_name: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_certificate_get_subject_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Check if two #GTlsCertificate objects represent the same certificate.
    # The raw DER byte data of the two certificates are checked for equality.
    # This has the effect that two certificates may compare equal even if
    # their #GTlsCertificate:issuer, #GTlsCertificate:private-key, or
    # #GTlsCertificate:private-key-pem properties differ.
    def is_same(cert_two : Gio::TlsCertificate) : Bool
      # g_tls_certificate_is_same: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_certificate_is_same(@pointer, cert_two)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This verifies @cert and returns a set of #GTlsCertificateFlags
    # indicating any problems found with it. This can be used to verify a
    # certificate outside the context of making a connection, or to
    # check a certificate against a CA that is not part of the system
    # CA database.
    #
    # If @identity is not %NULL, @cert's name(s) will be compared against
    # it, and %G_TLS_CERTIFICATE_BAD_IDENTITY will be set in the return
    # value if it does not match. If @identity is %NULL, that bit will
    # never be set in the return value.
    #
    # If @trusted_ca is not %NULL, then @cert (or one of the certificates
    # in its chain) must be signed by it, or else
    # %G_TLS_CERTIFICATE_UNKNOWN_CA will be set in the return value. If
    # @trusted_ca is %NULL, that bit will never be set in the return
    # value.
    #
    # GLib guarantees that if certificate verification fails, at least one
    # error will be set in the return value, but it does not guarantee
    # that all possible errors will be set. Accordingly, you may not safely
    # decide to ignore any particular type of error. For example, it would
    # be incorrect to mask %G_TLS_CERTIFICATE_EXPIRED if you want to allow
    # expired certificates, because this could potentially be the only
    # error flag set even if other problems exist with the certificate.
    #
    # Because TLS session context is not used, #GTlsCertificate may not
    # perform as many checks on the certificates as #GTlsConnection would.
    # For example, certificate constraints may not be honored, and
    # revocation checks may not be performed. The best way to verify TLS
    # certificates used by a TLS connection is to let #GTlsConnection
    # handle the verification.
    def verify(identity : Gio::SocketConnectable?, trusted_ca : Gio::TlsCertificate?) : Gio::TlsCertificateFlags
      # g_tls_certificate_verify: (Method)
      # @identity: (nullable)
      # @trusted_ca: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      # Generator::NullableArrayPlan
      trusted_ca = if trusted_ca.nil?
                     Pointer(Void).null
                   else
                     trusted_ca.to_unsafe
                   end

      # C call
      _retval = LibGio.g_tls_certificate_verify(@pointer, identity, trusted_ca)

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end
  end
end
