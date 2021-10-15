require "../g_object-2.0/object"

module Gio
  # A certificate used for TLS authentication and encryption.
  # This can represent either a certificate only (eg, the certificate
  # received by a client from a server), or the combination of
  # a certificate and a private key (which is needed when acting as a
  # #GTlsServerConnection).
  class TlsCertificate < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, certificate : Enumerable(UInt8)? = nil, certificate_pem : ::String? = nil, dns_names : Enumerable(Pointer(Nil))? = nil, ip_addresses : Enumerable(Pointer(Nil))? = nil, issuer : Gio::TlsCertificate? = nil, issuer_name : ::String? = nil, not_valid_after : GLib::DateTime? = nil, not_valid_before : GLib::DateTime? = nil, pkcs11_uri : ::String? = nil, private_key : Enumerable(UInt8)? = nil, private_key_pem : ::String? = nil, private_key_pkcs11_uri : ::String? = nil, subject_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[13]
      _values = StaticArray(LibGObject::Value, 13).new(LibGObject::Value.new)
      _n = 0

      if certificate
        (_names.to_unsafe + _n).value = "certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate)
        _n += 1
      end
      if certificate_pem
        (_names.to_unsafe + _n).value = "certificate-pem".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate_pem)
        _n += 1
      end
      if dns_names
        (_names.to_unsafe + _n).value = "dns-names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, dns_names)
        _n += 1
      end
      if ip_addresses
        (_names.to_unsafe + _n).value = "ip-addresses".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ip_addresses)
        _n += 1
      end
      if issuer
        (_names.to_unsafe + _n).value = "issuer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, issuer)
        _n += 1
      end
      if issuer_name
        (_names.to_unsafe + _n).value = "issuer-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, issuer_name)
        _n += 1
      end
      if not_valid_after
        (_names.to_unsafe + _n).value = "not-valid-after".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, not_valid_after)
        _n += 1
      end
      if not_valid_before
        (_names.to_unsafe + _n).value = "not-valid-before".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, not_valid_before)
        _n += 1
      end
      if pkcs11_uri
        (_names.to_unsafe + _n).value = "pkcs11-uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pkcs11_uri)
        _n += 1
      end
      if private_key
        (_names.to_unsafe + _n).value = "private-key".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key)
        _n += 1
      end
      if private_key_pem
        (_names.to_unsafe + _n).value = "private-key-pem".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key_pem)
        _n += 1
      end
      if private_key_pkcs11_uri
        (_names.to_unsafe + _n).value = "private-key-pkcs11-uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, private_key_pkcs11_uri)
        _n += 1
      end
      if subject_name
        (_names.to_unsafe + _n).value = "subject-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subject_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TlsCertificate.g_type, _n, _names, _values)
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

    def issuer=(value : TlsCertificate?) : TlsCertificate?
      unsafe_value = value

      LibGObject.g_object_set(self, "issuer", unsafe_value, Pointer(Void).null)
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

    def self.new_from_file(file : ::String) : Gio::TlsCertificate
      # g_tls_certificate_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_new_from_file(file)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_files(cert_file : ::String, key_file : ::String) : Gio::TlsCertificate
      # g_tls_certificate_new_from_files: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_new_from_files(cert_file, key_file)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_pem(data : ::String, length : Int64) : Gio::TlsCertificate
      # g_tls_certificate_new_from_pem: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_new_from_pem(data, length)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_pkcs11_uris(pkcs11_uri : ::String, private_key_pkcs11_uri : ::String?) : Gio::TlsCertificate
      # g_tls_certificate_new_from_pkcs11_uris: (Constructor | Throws)
      # @private_key_pkcs11_uri: (nullable)
      # Returns: (transfer full)

      private_key_pkcs11_uri = if private_key_pkcs11_uri.nil?
                                 Pointer(LibC::Char).null
                               else
                                 private_key_pkcs11_uri.to_unsafe
                               end

      _retval = LibGio.g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri, private_key_pkcs11_uri)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def list_new_from_file(file : ::String) : GLib::List
      # g_tls_certificate_list_new_from_file: (Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_list_new_from_file(file)
      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    def dns_names : Enumerable(GLib::Bytes)?
      # g_tls_certificate_get_dns_names: (Method | Getter)
      # Returns: (transfer container)

      _retval = LibGio.g_tls_certificate_get_dns_names(self)
      _retval unless _retval.null?
    end

    def ip_addresses : Enumerable(Gio::InetAddress)?
      # g_tls_certificate_get_ip_addresses: (Method | Getter)
      # Returns: (transfer container)

      _retval = LibGio.g_tls_certificate_get_ip_addresses(self)
      _retval unless _retval.null?
    end

    def issuer : Gio::TlsCertificate?
      # g_tls_certificate_get_issuer: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_certificate_get_issuer(self)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def issuer_name : ::String?
      # g_tls_certificate_get_issuer_name: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_get_issuer_name(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def not_valid_after : GLib::DateTime?
      # g_tls_certificate_get_not_valid_after: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_get_not_valid_after(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def not_valid_before : GLib::DateTime?
      # g_tls_certificate_get_not_valid_before: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_get_not_valid_before(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def subject_name : ::String?
      # g_tls_certificate_get_subject_name: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_certificate_get_subject_name(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def is_same(cert_two : Gio::TlsCertificate) : Bool
      # g_tls_certificate_is_same: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_certificate_is_same(self, cert_two)
      GICrystal.to_bool(_retval)
    end

    def verify(identity : Gio::SocketConnectable?, trusted_ca : Gio::TlsCertificate?) : Gio::TlsCertificateFlags
      # g_tls_certificate_verify: (Method)
      # @identity: (nullable)
      # @trusted_ca: (nullable)
      # Returns: (transfer none)

      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      trusted_ca = if trusted_ca.nil?
                     Pointer(Void).null
                   else
                     trusted_ca.to_unsafe
                   end

      _retval = LibGio.g_tls_certificate_verify(self, identity, trusted_ca)
      Gio::TlsCertificateFlags.from_value(_retval)
    end
  end
end
