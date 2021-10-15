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
  class TlsInteraction < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_interaction_get_type
    end

    def ask_password(password : Gio::TlsPassword, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_ask_password: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_interaction_ask_password(self, password, cancellable)
      Gio::TlsInteractionResult.from_value(_retval)
    end

    def ask_password_async(password : Gio::TlsPassword, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_interaction_ask_password_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_tls_interaction_ask_password_async(self, password, cancellable, callback, user_data)
    end

    def ask_password_finish(result : Gio::AsyncResult) : Gio::TlsInteractionResult
      # g_tls_interaction_ask_password_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_interaction_ask_password_finish(self, result)
      Gio::TlsInteractionResult.from_value(_retval)
    end

    def invoke_ask_password(password : Gio::TlsPassword, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_invoke_ask_password: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_interaction_invoke_ask_password(self, password, cancellable)
      Gio::TlsInteractionResult.from_value(_retval)
    end

    def invoke_request_certificate(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_invoke_request_certificate: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_interaction_invoke_request_certificate(self, connection, flags, cancellable)
      Gio::TlsInteractionResult.from_value(_retval)
    end

    def request_certificate(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?) : Gio::TlsInteractionResult
      # g_tls_interaction_request_certificate: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_tls_interaction_request_certificate(self, connection, flags, cancellable)
      Gio::TlsInteractionResult.from_value(_retval)
    end

    def request_certificate_async(connection : Gio::TlsConnection, flags : Gio::TlsCertificateRequestFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_tls_interaction_request_certificate_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_tls_interaction_request_certificate_async(self, connection, flags, cancellable, callback, user_data)
    end

    def request_certificate_finish(result : Gio::AsyncResult) : Gio::TlsInteractionResult
      # g_tls_interaction_request_certificate_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_interaction_request_certificate_finish(self, result)
      Gio::TlsInteractionResult.from_value(_retval)
    end
  end
end
