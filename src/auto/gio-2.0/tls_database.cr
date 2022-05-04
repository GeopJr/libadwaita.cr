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
  @[GObject::GeneratedWrapper]
  class TlsDatabase < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TlsDatabaseClass), class_init,
        sizeof(LibGio::TlsDatabase), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_database_get_type
    end

    # Create a handle string for the certificate. The database will only be able
    # to create a handle for certificates that originate from the database. In
    # cases where the database cannot create a handle for a certificate, %NULL
    # will be returned.
    #
    # This handle should be stable across various instances of the application,
    # and between applications. If a certificate is modified in the database,
    # then it is not guaranteed that this handle will continue to point to it.
    def create_certificate_handle(certificate : Gio::TlsCertificate) : ::String?
      # g_tls_database_create_certificate_handle: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_database_create_certificate_handle(self, certificate)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Look up a certificate by its handle.
    #
    # The handle should have been created by calling
    # g_tls_database_create_certificate_handle() on a #GTlsDatabase object of
    # the same TLS backend. The handle is designed to remain valid across
    # instantiations of the database.
    #
    # If the handle is no longer valid, or does not point to a certificate in
    # this database, then %NULL will be returned.
    #
    # This function can block, use g_tls_database_lookup_certificate_for_handle_async() to perform
    # the lookup operation asynchronously.
    def lookup_certificate_for_handle(handle : ::String, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificate?
      # g_tls_database_lookup_certificate_for_handle: (Method | Throws)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_database_lookup_certificate_for_handle(self, handle, interaction, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Asynchronously look up a certificate by its handle in the database. See
    # g_tls_database_lookup_certificate_for_handle() for more information.
    def lookup_certificate_for_handle_async(handle : ::String, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_database_lookup_certificate_for_handle_async: (Method)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_tls_database_lookup_certificate_for_handle_async(self, handle, interaction, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous lookup of a certificate by its handle. See
    # g_tls_database_lookup_certificate_for_handle() for more information.
    #
    # If the handle is no longer valid, or does not point to a certificate in
    # this database, then %NULL will be returned.
    def lookup_certificate_for_handle_finish(result : Gio::AsyncResult) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_for_handle_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_database_lookup_certificate_for_handle_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Look up the issuer of @certificate in the database. The
    # #GTlsCertificate:issuer property of @certificate is not modified, and
    # the two certificates are not hooked into a chain.
    #
    # This function can block. Use g_tls_database_lookup_certificate_issuer_async()
    # to perform the lookup operation asynchronously.
    #
    # Beware this function cannot be used to build certification paths. The
    # issuer certificate returned by this function may not be the same as
    # the certificate that would actually be used to construct a valid
    # certification path during certificate verification.
    # [RFC 4158](https://datatracker.ietf.org/doc/html/rfc4158) explains
    # why an issuer certificate cannot be naively assumed to be part of the
    # the certification path (though GLib's TLS backends may not follow the
    # path building strategies outlined in this RFC). Due to the complexity
    # of certification path building, GLib does not provide any way to know
    # which certification path will actually be used when verifying a TLS
    # certificate. Accordingly, this function cannot be used to make
    # security-related decisions. Only GLib itself should make security
    # decisions about TLS certificates.
    def lookup_certificate_issuer(certificate : Gio::TlsCertificate, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_issuer: (Method | Throws)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_database_lookup_certificate_issuer(self, certificate, interaction, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously look up the issuer of @certificate in the database. See
    # g_tls_database_lookup_certificate_issuer() for more information.
    def lookup_certificate_issuer_async(certificate : Gio::TlsCertificate, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_database_lookup_certificate_issuer_async: (Method)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_tls_database_lookup_certificate_issuer_async(self, certificate, interaction, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous lookup issuer operation. See
    # g_tls_database_lookup_certificate_issuer() for more information.
    def lookup_certificate_issuer_finish(result : Gio::AsyncResult) : Gio::TlsCertificate
      # g_tls_database_lookup_certificate_issuer_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_database_lookup_certificate_issuer_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::Full)
    end

    # Look up certificates issued by this issuer in the database.
    #
    # This function can block, use g_tls_database_lookup_certificates_issued_by_async() to perform
    # the lookup operation asynchronously.
    def lookup_certificates_issued_by(issuer_raw_dn : Enumerable(UInt8), interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?) : GLib::List
      # g_tls_database_lookup_certificates_issued_by: (Method | Throws)
      # @issuer_raw_dn: (array element-type UInt8)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      issuer_raw_dn = issuer_raw_dn.to_a.to_unsafe
      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_database_lookup_certificates_issued_by(self, issuer_raw_dn, interaction, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously look up certificates issued by this issuer in the database. See
    # g_tls_database_lookup_certificates_issued_by() for more information.
    #
    # The database may choose to hold a reference to the issuer byte array for the duration
    # of of this asynchronous operation. The byte array should not be modified during
    # this time.
    def lookup_certificates_issued_by_async(issuer_raw_dn : Enumerable(UInt8), interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseLookupFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_database_lookup_certificates_issued_by_async: (Method)
      # @issuer_raw_dn: (array element-type UInt8)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      issuer_raw_dn = issuer_raw_dn.to_a.to_unsafe
      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_tls_database_lookup_certificates_issued_by_async(self, issuer_raw_dn, interaction, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous lookup of certificates. See
    # g_tls_database_lookup_certificates_issued_by() for more information.
    def lookup_certificates_issued_by_finish(result : Gio::AsyncResult) : GLib::List
      # g_tls_database_lookup_certificates_issued_by_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_database_lookup_certificates_issued_by_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::TlsCertificate).new(_retval, GICrystal::Transfer::Full)
    end

    # Determines the validity of a certificate chain, outside the context
    # of a TLS session.
    #
    # @chain is a chain of #GTlsCertificate objects each pointing to the next
    # certificate in the chain by its #GTlsCertificate:issuer property.
    #
    # @purpose describes the purpose (or usage) for which the certificate
    # is being used. Typically @purpose will be set to %G_TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER
    # which means that the certificate is being used to authenticate a server
    # (and we are acting as the client).
    #
    # The @identity is used to ensure the server certificate is valid for
    # the expected peer identity. If the identity does not match the
    # certificate, %G_TLS_CERTIFICATE_BAD_IDENTITY will be set in the
    # return value. If @identity is %NULL, that bit will never be set in
    # the return value. The peer identity may also be used to check for
    # pinned certificates (trust exceptions) in the database. These may
    # override the normal verification process on a host-by-host basis.
    #
    # Currently there are no @flags, and %G_TLS_DATABASE_VERIFY_NONE should be
    # used.
    #
    # If @chain is found to be valid, then the return value will be 0. If
    # @chain is found to be invalid, then the return value will indicate at
    # least one problem found. If the function is unable to determine
    # whether @chain is valid (for example, because @cancellable is
    # triggered before it completes) then the return value will be
    # %G_TLS_CERTIFICATE_GENERIC_ERROR and @error will be set accordingly.
    # @error is not set when @chain is successfully analyzed but found to
    # be invalid.
    #
    # GLib guarantees that if certificate verification fails, at least one
    # error will be set in the return value, but it does not guarantee
    # that all possible errors will be set. Accordingly, you may not safely
    # decide to ignore any particular type of error. For example, it would
    # be incorrect to mask %G_TLS_CERTIFICATE_EXPIRED if you want to allow
    # expired certificates, because this could potentially be the only
    # error flag set even if other problems exist with the certificate.
    #
    # Prior to GLib 2.48, GLib's default TLS backend modified @chain to
    # represent the certification path built by #GTlsDatabase during
    # certificate verification by adjusting the #GTlsCertificate:issuer
    # property of each certificate in @chain. Since GLib 2.48, this no
    # longer occurs, so you cannot rely on #GTlsCertificate:issuer to
    # represent the actual certification path used during certificate
    # verification.
    #
    # Because TLS session context is not used, #GTlsDatabase may not
    # perform as many checks on the certificates as #GTlsConnection would.
    # For example, certificate constraints may not be honored, and
    # revocation checks may not be performed. The best way to verify TLS
    # certificates used by a TLS connection is to let #GTlsConnection
    # handle the verification.
    #
    # The TLS backend may attempt to look up and add missing certificates
    # to the chain. This may involve HTTP requests to download missing
    # certificates.
    #
    # This function can block. Use g_tls_database_verify_chain_async() to
    # perform the verification operation asynchronously.
    def verify_chain(chain : Gio::TlsCertificate, purpose : ::String, identity : Gio::SocketConnectable?, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseVerifyFlags, cancellable : Gio::Cancellable?) : Gio::TlsCertificateFlags
      # g_tls_database_verify_chain: (Method | Throws)
      # @identity: (nullable)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_database_verify_chain(self, chain, purpose, identity, interaction, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end

    # Asynchronously determines the validity of a certificate chain after
    # looking up and adding any missing certificates to the chain. See
    # g_tls_database_verify_chain() for more information.
    def verify_chain_async(chain : Gio::TlsCertificate, purpose : ::String, identity : Gio::SocketConnectable?, interaction : Gio::TlsInteraction?, flags : Gio::TlsDatabaseVerifyFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_database_verify_chain_async: (Method)
      # @identity: (nullable)
      # @interaction: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      identity = if identity.nil?
                   Pointer(Void).null
                 else
                   identity.to_unsafe
                 end
      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_tls_database_verify_chain_async(self, chain, purpose, identity, interaction, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous verify chain operation. See
    # g_tls_database_verify_chain() for more information.
    #
    # If @chain is found to be valid, then the return value will be 0. If
    # @chain is found to be invalid, then the return value will indicate
    # the problems found. If the function is unable to determine whether
    # @chain is valid or not (eg, because @cancellable is triggered
    # before it completes) then the return value will be
    # %G_TLS_CERTIFICATE_GENERIC_ERROR and @error will be set
    # accordingly. @error is not set when @chain is successfully analyzed
    # but found to be invalid.
    def verify_chain_finish(result : Gio::AsyncResult) : Gio::TlsCertificateFlags
      # g_tls_database_verify_chain_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_database_verify_chain_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end
  end
end
