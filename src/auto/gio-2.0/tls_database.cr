require "../g_object-2.0/object"

module Gio
  # #GTlsDatabase is used to look up certificates and other information
  # from a certificate or key store. It is an abstract base class which
  # TLS library specific subtypes override.
  #
  # A #GTlsDatabase may be accessed from multiple threads by the TLS backend.
  # All implementations are required to be fully thread-safe.
  #
  # Most common client applications will not directly interact with
  # #GTlsDatabase. It is used internally by #GTlsConnection.
  class TlsDatabase < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_database_get_type
    end

    def create_certificate_handle(certificate : Gio::TlsCertificate) : ::String?
      # g_tls_database_create_certificate_handle: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_database_create_certificate_handle(self, certificate)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def lookup_certificate_for_handle(handle : ::String, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificate?
      # g_tls_database_lookup_certificate_for_handle: (Method | Throws)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_database_lookup_certificate_for_handle(self, handle, interaction, flags, cancellable)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def lookup_certificate_for_handle_async(handle : ::String, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_database_lookup_certificate_for_handle_async: (Method)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_tls_database_lookup_certificate_for_handle_async(self, handle, interaction, flags, cancellable, callback, user_data)
    end

    def lookup_certificate_for_handle_finish(result : Gio::AsyncResult) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_for_handle_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_database_lookup_certificate_for_handle_finish(self, result)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_certificate_issuer(certificate : Gio::TlsCertificate, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_issuer: (Method | Throws)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_database_lookup_certificate_issuer(self, certificate, interaction, flags, cancellable)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_certificate_issuer_async(certificate : Gio::TlsCertificate, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_database_lookup_certificate_issuer_async: (Method)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_tls_database_lookup_certificate_issuer_async(self, certificate, interaction, flags, cancellable, callback, user_data)
    end

    def lookup_certificate_issuer_finish(result : Gio::AsyncResult) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_issuer_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_database_lookup_certificate_issuer_finish(self, result)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_certificates_issued_by(issuer_raw_dn : Enumerable(UInt8), interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : GLib::List
      # g_tls_database_lookup_certificates_issued_by: (Method | Throws)
      # @issuer_raw_dn: (array element-type UInt8)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      issuer_raw_dn = issuer_raw_dn.to_a.to_unsafe

      _retval = LibGio.g_tls_database_lookup_certificates_issued_by(self, issuer_raw_dn, interaction, flags, cancellable)
      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_certificates_issued_by_async(issuer_raw_dn : Enumerable(UInt8), interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_database_lookup_certificates_issued_by_async: (Method)
      # @issuer_raw_dn: (array element-type UInt8)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      issuer_raw_dn = issuer_raw_dn.to_a.to_unsafe

      LibGio.g_tls_database_lookup_certificates_issued_by_async(self, issuer_raw_dn, interaction, flags, cancellable, callback, user_data)
    end

    def lookup_certificates_issued_by_finish(result : Gio::AsyncResult) : GLib::List
      # g_tls_database_lookup_certificates_issued_by_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_database_lookup_certificates_issued_by_finish(self, result)
      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    def verify_chain(chain : Gio::TlsCertificate, purpose : ::String, identity : Gio::SocketConnectable?, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseVerifyFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificateFlags
      # g_tls_database_verify_chain: (Method | Throws)
      # @identity: (nullable)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_database_verify_chain(self, chain, purpose, identity, interaction, flags, cancellable)
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def verify_chain_async(chain : Gio::TlsCertificate, purpose : ::String, identity : Gio::SocketConnectable?, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseVerifyFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_database_verify_chain_async: (Method)
      # @identity: (nullable)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_tls_database_verify_chain_async(self, chain, purpose, identity, interaction, flags, cancellable, callback, user_data)
    end

    def verify_chain_finish(result : Gio::AsyncResult) : Gio::TlsCertificateFlags
      # g_tls_database_verify_chain_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_database_verify_chain_finish(self, result)
      Gio::TlsCertificateFlags.from_value(_retval)
    end
  end
end
