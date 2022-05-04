require "../g_object-2.0/object"

module Gio
  # #GTlsInteraction provides a mechanism for the TLS connection and database
  # code to interact with the user. It can be used to ask the user for passwords.
  #
  # To use a #GTlsInteraction with a TLS connection use
  # g_tls_connection_set_interaction().
  #
  # Callers should instantiate a derived class that implements the various
  # interaction methods to show the required dialogs.
  #
  # Callers should use the 'invoke' functions like
  # g_tls_interaction_invoke_ask_password() to run interaction methods. These
  # functions make sure that the interaction is invoked in the main loop
  # and not in the current thread, if the current thread is not running the
  # main loop.
  #
  # Derived classes can choose to implement whichever interactions methods they'd
  # like to support by overriding those virtual methods in their class
  # initialization function. Any interactions not implemented will return
  # %G_TLS_INTERACTION_UNHANDLED. If a derived class implements an async method,
  # it must also implement the corresponding finish method.
  @[GObject::GeneratedWrapper]
  class TlsInteraction < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TlsInteractionClass), class_init,
        sizeof(LibGio::TlsInteraction), instance_init, 0)
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
      LibGio.g_tls_interaction_get_type
    end

    # Run synchronous interaction to ask the user for a password. In general,
    # g_tls_interaction_invoke_ask_password() should be used instead of this
    # function.
    #
    # Derived subclasses usually implement a password prompt, although they may
    # also choose to provide a password from elsewhere. The @password value will
    # be filled in and then @callback will be called. Alternatively the user may
    # abort this password request, which will usually abort the TLS connection.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code. Certain implementations may
    # not support immediate cancellation.
    def ask_password(password : Gio::TlsPassword, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_ask_password: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_interaction_ask_password(self, password, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end

    # Run asynchronous interaction to ask the user for a password. In general,
    # g_tls_interaction_invoke_ask_password() should be used instead of this
    # function.
    #
    # Derived subclasses usually implement a password prompt, although they may
    # also choose to provide a password from elsewhere. The @password value will
    # be filled in and then @callback will be called. Alternatively the user may
    # abort this password request, which will usually abort the TLS connection.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code. Certain implementations may
    # not support immediate cancellation.
    #
    # Certain implementations may not support immediate cancellation.
    def ask_password_async(password : Gio::TlsPassword, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_interaction_ask_password_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_tls_interaction_ask_password_async(self, password, cancellable, callback, user_data)

      # Return value handling
    end

    # Complete an ask password user interaction request. This should be once
    # the g_tls_interaction_ask_password_async() completion callback is called.
    #
    # If %G_TLS_INTERACTION_HANDLED is returned, then the #GTlsPassword passed
    # to g_tls_interaction_ask_password() will have its password filled in.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code.
    def ask_password_finish(result : Gio::AsyncResult) : Gio::TlsInteractionResult
      # g_tls_interaction_ask_password_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_interaction_ask_password_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end

    # Invoke the interaction to ask the user for a password. It invokes this
    # interaction in the main loop, specifically the #GMainContext returned by
    # g_main_context_get_thread_default() when the interaction is created. This
    # is called by called by #GTlsConnection or #GTlsDatabase to ask the user
    # for a password.
    #
    # Derived subclasses usually implement a password prompt, although they may
    # also choose to provide a password from elsewhere. The @password value will
    # be filled in and then @callback will be called. Alternatively the user may
    # abort this password request, which will usually abort the TLS connection.
    #
    # The implementation can either be a synchronous (eg: modal dialog) or an
    # asynchronous one (eg: modeless dialog). This function will take care of
    # calling which ever one correctly.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code. Certain implementations may
    # not support immediate cancellation.
    def invoke_ask_password(password : Gio::TlsPassword, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_invoke_ask_password: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_interaction_invoke_ask_password(self, password, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end

    # Invoke the interaction to ask the user to choose a certificate to
    # use with the connection. It invokes this interaction in the main
    # loop, specifically the #GMainContext returned by
    # g_main_context_get_thread_default() when the interaction is
    # created. This is called by called by #GTlsConnection when the peer
    # requests a certificate during the handshake.
    #
    # Derived subclasses usually implement a certificate selector,
    # although they may also choose to provide a certificate from
    # elsewhere. Alternatively the user may abort this certificate
    # request, which may or may not abort the TLS connection.
    #
    # The implementation can either be a synchronous (eg: modal dialog) or an
    # asynchronous one (eg: modeless dialog). This function will take care of
    # calling which ever one correctly.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code. Certain implementations may
    # not support immediate cancellation.
    def invoke_request_certificate(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_invoke_request_certificate: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_interaction_invoke_request_certificate(self, connection, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end

    # Run synchronous interaction to ask the user to choose a certificate to use
    # with the connection. In general, g_tls_interaction_invoke_request_certificate()
    # should be used instead of this function.
    #
    # Derived subclasses usually implement a certificate selector, although they may
    # also choose to provide a certificate from elsewhere. Alternatively the user may
    # abort this certificate request, which will usually abort the TLS connection.
    #
    # If %G_TLS_INTERACTION_HANDLED is returned, then the #GTlsConnection
    # passed to g_tls_interaction_request_certificate() will have had its
    # #GTlsConnection:certificate filled in.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code. Certain implementations may
    # not support immediate cancellation.
    def request_certificate(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_request_certificate: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_interaction_request_certificate(self, connection, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end

    # Run asynchronous interaction to ask the user for a certificate to use with
    # the connection. In general, g_tls_interaction_invoke_request_certificate() should
    # be used instead of this function.
    #
    # Derived subclasses usually implement a certificate selector, although they may
    # also choose to provide a certificate from elsewhere. @callback will be called
    # when the operation completes. Alternatively the user may abort this certificate
    # request, which will usually abort the TLS connection.
    def request_certificate_async(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_interaction_request_certificate_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_tls_interaction_request_certificate_async(self, connection, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Complete a request certificate user interaction request. This should be once
    # the g_tls_interaction_request_certificate_async() completion callback is called.
    #
    # If %G_TLS_INTERACTION_HANDLED is returned, then the #GTlsConnection
    # passed to g_tls_interaction_request_certificate_async() will have had its
    # #GTlsConnection:certificate filled in.
    #
    # If the interaction is cancelled by the cancellation object, or by the
    # user then %G_TLS_INTERACTION_FAILED will be returned with an error that
    # contains a %G_IO_ERROR_CANCELLED error code.
    def request_certificate_finish(result : Gio::AsyncResult) : Gio::TlsInteractionResult
      # g_tls_interaction_request_certificate_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_interaction_request_certificate_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::TlsInteractionResult.new(_retval)
    end
  end
end
